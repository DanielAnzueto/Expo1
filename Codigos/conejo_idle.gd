extends CharacterBody2D

@onready var animation = $AnimatedSprite2Ds

func _ready() -> void:
	animation.play("CONEJO_idle")
