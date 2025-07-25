extends Button


@onready var animation: AnimationPlayer = $"../TexturePERSONAJEMUERTE/AnimationPlayer"
@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("MUrte")
	audio_stream_player.play()
	pass # Replace with function body.
func _pressed() -> void:
	get_tree().change_scene_to_file("res://MovPersonNOesPADA.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
