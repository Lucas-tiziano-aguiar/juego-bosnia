extends CharacterBody2D

@onready var anim := $AnimatedSprite2D
var speed := 120;
var direccion := 0.0;
const gravity = 9
const jump = 250

func _physics_process(delta):
	direccion = Input.get_axis("left","right")
	if Input.is_action_pressed("sprint"):
		speed = 200
	else:
	
		speed = 120
	
	velocity.x = direccion * speed
	velocity.y = velocity.y + gravity
	if direccion != 0:
		anim.play("caminar")
	
	else:
		anim.play("iddle")
	if direccion > 0:
		anim.flip_h= false
	else:
		anim.flip_h = true
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y -= jump
	move_and_slide()
