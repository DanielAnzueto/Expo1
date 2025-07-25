extends CharacterBody2D

var coso:int=50
const GRAVEDAD=98
##para recibir y dar daño
var perseguir:bool=false
var Velocidad_de_perseguirPlayer:int = 400

func _ready():
	velocity.x= -coso
	$AnimatedSprite2Ds.play("CORRER")
	
func _physics_process(delta: float) -> void:
	if !perseguir:
		velocity.y +=GRAVEDAD
		if is_on_wall():
			if !$AnimatedSprite2Ds.flip_h:
				velocity.x = coso
			else:
				velocity.x = -coso
		if velocity.x < 0:
			$AnimatedSprite2Ds.flip_h = false
		elif velocity.x > 0:
			$AnimatedSprite2Ds.flip_h = true
	move_and_slide()

func _on_ataque_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$AnimatedSprite2Ds.play("ATACAR")
	pass # Replace with function body.
