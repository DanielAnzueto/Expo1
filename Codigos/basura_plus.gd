extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("Idle")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.player_UI.add_Basura()
		queue_free()
