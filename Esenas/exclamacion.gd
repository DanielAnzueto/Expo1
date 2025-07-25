extends Sprite2D

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.play("arriba_abajo")
