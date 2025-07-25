extends Node

@export var parent : Node2D
@export var max_healt : float=100
var curen_tHealt: float= 0.0
# Called when the node enters the scene tree for the first time.
@export var ui : PlayerUI

func _ready() -> void:
	curen_tHealt= max_healt

func get_demage(demage : float) -> void:
	curen_tHealt -=demage
	
	if ui:
		ui.update_healt(curen_tHealt, max_healt)
	if curen_tHealt <= 0:
		parent.queue_free()
