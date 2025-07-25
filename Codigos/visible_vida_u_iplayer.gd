class_name PlayerUI extends Control
#se pone class_name para que godot detecte que es un player
@onready var label: Label = $HBoxContainer/Label

var basura :int = 0
# Called when the node enters the scene tree for the first time.
func update_healt(current:float , max: float):
	$ProgressBar.value=current/max

func add_Basura():
	basura += 1
	label.text = str(basura)
	#str convierte variables en cadenas simples, numeros y textos
