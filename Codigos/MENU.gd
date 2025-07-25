extends Control



func _on_juagr_pressed() -> void:
	Transicions.change_scene("res://Esenas/INTRO1.tscn")


func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://Esenas/Opciones_del_MENU.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()
