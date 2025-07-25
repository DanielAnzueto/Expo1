extends CharacterBody2D

@onready var animation= $AnimationPlayer

func _ready() -> void:
	animation.play("idle")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
 		body.salud_vida.get_damage(10)
