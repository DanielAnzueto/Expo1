extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@onready var animationPlayer = $AnimationPlayer
@onready var sprite2D = $Sprite2D
@onready var salud_vida: Node = $Salud_vida

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	if position.y > 371:
		get_tree().change_scene_to_file("res://Esenas/ReinicioPrimerNivel.tscn")
	move_and_slide()
	
	animations(direction)
	if direction ==1:
		sprite2D.flip_h =false
	elif direction ==-1:
		sprite2D.flip_h =true

func animations(direction):
	if is_on_floor():
		if direction == 0:
			animationPlayer.play("IDLE-SinEspada")
		else:
			animationPlayer.play("RUN_SinEspada")
	else:
		if velocity.y<0:
			animationPlayer.play("JUMP_SinEspada")
		elif velocity.y>0:
			animationPlayer.play("Fall_SinEspada")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("move_down") and is_on_floor():
		position.y +=1.5


func _on_hit_box_area_entered(area: Area2D) -> void:
	area.get_parent().get_parent().queue_free()
