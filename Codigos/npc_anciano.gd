extends Area2D

@onready var exclamacion: Sprite2D = $exclamacion
const _01 = preload("res://DIALOGOS/01.dialogue")
var is_player_close=false
var is_dialoge_active = false


func _ready() -> void:
	DialogueManager.dialogue_started.connect(dialoge_started)
	DialogueManager.dialogue_ended.connect(dialoge_ended)

func _process(delta: float) -> void:
	if is_player_close and Input.is_action_just_pressed("Dialogo") and not is_dialoge_active:
		DialogueManager.show_dialogue_balloon(_01, "start")
		
func _on_area_entered(area: Area2D) -> void:
	exclamacion.visible = true
	is_player_close = true

func _on_area_exited(area: Area2D) -> void:
	exclamacion.visible = false
	is_player_close = false
	
func dialoge_started(dialogue):
	is_dialoge_active=true
	
func dialoge_ended(dialogue):
	is_dialoge_active=false
