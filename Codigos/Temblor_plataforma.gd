extends StaticBody2D

@export var fall_delay := 0.2
@export var reset_delay := 1.0
@export var fall_distance := 200.0
@onready var animation: AnimationPlayer = $AnimationPlayer

var original_position

func _ready():
	original_position = position
	$Area2D.body_entered.connect(_on_body_entered)
	animation.play("temblor")

func _on_body_entered(body):
	if body.is_in_group("Player"):  # Asegúrate que el jugador se llame "Player"
		fall()

func fall():
	await get_tree().create_timer(fall_delay).timeout

	# Simula caída: desactiva colisión y mueve la plataforma hacia abajo
	$CollisionShape2D.disabled = true
	var tween := create_tween()
	tween.tween_property(self, "position", position + Vector2(0, fall_distance), 0.1)

	await get_tree().create_timer(reset_delay).timeout

	# Regresa la plataforma
	position = original_position
	$CollisionShape2D.disabled = false
