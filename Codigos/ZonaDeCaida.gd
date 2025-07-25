extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.get_name()=="CharacterBody2D":
		print("Hemos caido")
		
		
		get_tree().reload_current_scene()
