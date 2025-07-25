extends CharacterBody2D

const CreepRun = 70

func _ready():
	velocity.x = -CreepRun
	$AnimatedSprite2D.play("run")

func _physics_process(delta):
	velocity.x = -CreepRun
	move_and_slide()
