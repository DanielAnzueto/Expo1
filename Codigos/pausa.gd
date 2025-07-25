extends CanvasLayer

@onready var Judador=$AudioStreamPlayer
func _physics_process(delta: float) -> void:

	if Input.is_action_just_pressed("PAUSA"):
		Judador.play()
		get_tree().paused= not get_tree().paused
		$ColorRect.visible= not $ColorRect.visible
		$Label.visible=not $Label.visible
