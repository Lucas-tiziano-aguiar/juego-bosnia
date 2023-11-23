extends Humano

func _ready():
	direccion = 1;

func _physics_process(delta):
	mover()

func mover():
	velocity.x = 40
	velocity.y += gravity
	move_and_slide()

func sprint():
	pass
