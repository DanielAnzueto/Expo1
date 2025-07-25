extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


var doDASHH=false
var DASHHdirection:int

var ATACAR:bool=false
var push_force=10

@onready var animationPlayer=$AnimationPlayer
@onready var sprite2d=$Sprite2D
@onready var ESPADA=$AudioStreamPlayer
@onready var SALTO=$AudioStreamPlayer2
@onready var player_UI: PlayerUI = $CanvasLayer/VisibleVida_UIplayer
#SOLO REFERENCIA DE PLAYER_UI A LA BASURA(COINS)
@onready var salud_vida: Node = $Salud_vida
#vida

const Wall_slide_acelation=20
const Max_wall_slide_speed=120

##dashh
var is_in_dash :bool=false
##atacar
var is_atack :bool=false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if not is_on_floor():
		SALTO.play()
		velocity += get_gravity() * delta
	#OJO CON ESTE, QUE FUE EL ATACAR EL CAMBIO, SOLO BORRALO
	if !ATACAR:
		ESPADA.play()
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif Input.is_action_just_pressed("ATACAR"):
			ATACAR=true
		
	else:
		animationPlayer.play("ATAQUE_ESPADA")
		await(animationPlayer.animation_finished)
		ATACAR=false
		
	
#AQUI ES PARA EL DASHH

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
		
	if position.y > 293:
		get_tree().change_scene_to_file("res://Esenas/GameOver.tscn")
			
		
	move_and_slide()
	
	animations(direction)
	
	if direction==1:
		sprite2d.flip_h=false
	elif direction== -1:
		sprite2d.flip_h=true
		
func animations(direction):
	if is_on_floor():
		if direction==0:
			animationPlayer.play("IDLE_ESPADA")
		else:
			animationPlayer.play("CORRER_ESPADA")
	else:
		if velocity.y<0:
			animationPlayer.play("JUMP_ESPADA")
		elif velocity.y>0:
			animationPlayer.play("FALL_ESPADA")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("move_down") and is_on_floor():
		position.y +=1.5
		

func _on_hit_box_area_entered(area: Area2D) -> void:
	area.get_parent().get_parent().queue_free()
