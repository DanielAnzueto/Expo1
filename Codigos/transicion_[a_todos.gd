extends CanvasLayer

@onready var anim = $AnimationPlayer

func _ready():
	# layer es para poner el canvaslayer detrás del juego
	layer = -1
	$AnimationPlayer.play("TRANCICION")

func change_scene(path: String) -> void:
	# layer es para poner el canvaslayer delante del juego
	layer =  1
	# Reproducir la animación: trans
	anim.play("TRANCICION")
	await ($AnimationPlayer.animation_finished)
	# Esperar a que termine la animación antes de cambiar de escena
	# Cambiar la escena
	get_tree().change_scene_to_file(path)
	# Reproducir la animación al revés
	anim.play_backwards("TRANCICION")
	await ($AnimationPlayer.animation_finished)
	layer= -1
