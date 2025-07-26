extends Button

@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"
@onready var animation: AnimationPlayer = $"../TexturePERSONAJEMUERTE/AnimationPlayer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("MUrte")
	audio_stream_player.play()
	pass # Replace with function body.
func _pressed() -> void:
	get_tree().change_scene_to_file("res://Asets/COSITAS/INTRO_ESPADA.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
