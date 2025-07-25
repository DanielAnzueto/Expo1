extends Area2D

@export var next_scene_path:String
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _on_body_entered(body: Node2D) -> void:
	if body.name=="CharacterBody2D":
		change_scene()
		
func change_scene():
	get_tree().change_scene_to_file(next_scene_path)
