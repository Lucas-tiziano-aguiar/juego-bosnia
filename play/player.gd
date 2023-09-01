extends CharacterBody2D

var speed := 120;
var direccion := 0.0;
const gravity = 9
const jump = 250

func _physics_process(delta):
	direccion = Input.get_axis("left","right")
	velocity.x = direccion * speed
	velocity.y = velocity.y + gravity
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y -= jump
	move_and_slide()
