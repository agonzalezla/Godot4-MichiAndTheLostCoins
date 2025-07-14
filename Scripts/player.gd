extends CharacterBody2D

const moveSpeed = 25
const maxSpeed = 50

const jumpHeight = -300
const up = Vector2(0,-1)
const gravity = 15

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer

var motion = Vector2()

func _physics_process(_delta: float) -> void:
	
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animationPlayer.play("Walk")
		motion.x = min(motion.x + moveSpeed, maxSpeed)
		
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		animationPlayer.play("Walk")
		motion.x = max(motion.x - moveSpeed, -maxSpeed)
		
	else:
		animationPlayer.play("Idle")
		friction = true
		
	if is_on_floor():	
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = jumpHeight
		if friction == true:
			motion.x = lerp(motion.x, 0.0,0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0.0, 0.01)
			
	velocity = motion  # Asignas el movimiento al cuerpo
	move_and_slide()   # Llamas sin argumentos
