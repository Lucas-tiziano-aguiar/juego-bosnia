extends Humano

@onready var parado = $Parado;
@onready var arrastrado = $Arrastrado
@onready var anim := $Animacion
var blend = 0.5
func _ready():
	parado.disabled = false
	arrastrado.disabled = true

func _physics_process(delta):
	if is_on_floor():
		direccion = Humano.inputTeclasLeftRight()
	velocity.x = direccion * speed
	velocity.y = velocity.y + gravity
	salto()
	if direccion != 0 and is_on_floor():
		direccionSprite()
		agacharse()
		sprint()
	else:
		iddle()
	move_and_slide()

func sprint():
	if Input.is_action_pressed("sprint"):
		anim.play("correr")
		speed = 180
	else:
		caminar()
	

func caminar():
	anim.play("caminar")
	speed = 130

func iddle():
	anim.play("iddle")

func direccionSprite():
	if direccion > 0:
		anim.flip_h= false
	else:
		anim.flip_h = true

func agacharse():
	if Input.is_action_pressed("crouch"):
		anim.play("agacharse")
		anim.play("agachado")
		parado.disabled = true
		arrastrado.disabled = false
	elif Input.is_action_just_released("crouch"):
		anim.play("levantarse")
		parado.disabled = false
		arrastrado.disabled = true

func salto():
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		anim.play("saltar")
		velocity.y -= jump
