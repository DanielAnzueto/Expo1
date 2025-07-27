extends CharacterBody2D

@export var speed := 100
@export var max_health := 100
@export var attack_damage := 20

var health := max_health
var is_attacking := false
var is_dead := false

func _ready():
	$AttackCooldown.timeout.connect(_on_attack_cooldown_timeout)
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	if is_dead: return

	if is_attacking:
		velocity = Vector2.ZERO
		return

	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		velocity = input_vector * speed
		move_and_slide()
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = velocity.x < 0
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")

func _input(event):
	if is_dead or is_attacking:
		return

	if event.is_action_pressed("attack"):
		attack()

func attack():
	is_attacking = true
	$AnimatedSprite2D.play("attack")
	$AttackCooldown.start()

	var bodies = $AttackArea.get_overlapping_bodies()
	for body in bodies:
		if body.name == "Enemy" and body.has_method("take_damage"):
			body.take_damage(attack_damage)

func _on_attack_cooldown_timeout():
	is_attacking = false

func take_damage(amount):
	if is_dead: return

	health -= amount
	$AnimatedSprite2D.play("hurt")

	if health <= 0:
		die()

func die():
	is_dead = true
	velocity = Vector2.ZERO
	$AnimatedSprite2D.play("die")
	await $AnimatedSprite2D.animation_finished
	queue_free()
