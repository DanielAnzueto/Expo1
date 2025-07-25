extends CharacterBody2D

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.play("idle")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.salud_vida.get_demage(25)
		# cuanto de daño le voy a hacer al Player. Get_demage(el daño)
