extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D



var rolingg=false
var standing=preload("res://Collitions_personaje/collition_PARADO.tres")
var rolingDe=preload("res://Collitions_personaje/RolingDesactivado.tres")


func _process(delta: float) -> void:
	print(rolingg)



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
		#Roling_runch
		if Input.is_action_just_pressed("Roling"):
			roling()
		elif Input.is_action_just_released("Roling"):
			stand()
			#esas son funciones
			
	move_and_slide()
	animations(direction)
	
	if direction==1:
		sprite_2d.flip_h=false
	elif direction==-1:
		sprite_2d.flip_h=true

func animations(direction):
	if is_on_floor():
		if direction==0:
			animation_player.play("IDLE")
		else:
			if rolingg:
				animation_player.play("ROLING_ABAJAO")
			else:
				animation_player.play("RUN")
	else:
		if velocity.y<0:
			animation_player.play("JUMP")
		elif velocity.y>0:
			animation_player.play("FALL")
			
func roling():
	if rolingg:
		return
	rolingg=true
	
func stand():
	if rolingg==false:
		return
	rolingg=false
