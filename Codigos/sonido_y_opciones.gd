extends Control


func _on_historia_pressed() -> void:
	get_tree().change_scene_to_file("res://Esenas/historia.tscn")


func _on_atras_pressed() -> void:
	get_tree().change_scene_to_file("res://Esenas/Opciones_del_MENU.tscn")
