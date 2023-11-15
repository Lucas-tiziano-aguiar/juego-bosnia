extends Humano
@export var climbing = false;

@onready var parado = $Parado;
@onready var arrastrado = $Arrastrado
@onready var anim := $Animacion

var trepado = false;
var blend = 0.5
<<<<<<< Updated upstream
=======
var agarrado = false

>>>>>>> Stashed changes
func _ready():
	parado.disabled = false
	arrastrado.disabled = true

func _physics_process(delta):
	if is_on_floor():
		direccion = Humano.inputTeclasLeftRight()
<<<<<<< Updated upstream
		trepado = false;
	velocity.x = direccion * speed
	velocity.y = velocity.y + gravity
<<<<<<< Updated upstream
	salto()
	if direccion != 0 and is_on_floor() and trepado = false:
=======
	if direccion != 0 and is_on_floor():
>>>>>>> Stashed changes
		direccionSprite()
		agacharse()
		sprint()
		salto()
	else:
		if is_on_floor_only():
			iddle()
		else:
			pass
=======
		velocity.x = 0
		velocity.y = 0
		saltoAgarrado()
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
		$raycastParkour.target_position.y = -raycastLong


func estado():
	if speed > 0:
		sprint()
	elif speed == 0:
		iddle()
>>>>>>> Stashed changes

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

<<<<<<< Updated upstream
=======
func saltoAgarrado():
	if Input.is_action_just_pressed("jump"):
		anim.play("saltar")
		direccionSprite()
		velocity.y -= jump
		agarrado = false
		arrastrado.disabled = true

func subirEscalera(): 
	if Input.is_action_pressed("up"):
		velocity.y += speed * 5
	elif Input.is_action_pressed("down"):
		velocity.y = speed

>>>>>>> Stashed changes
func salto():
	if Input.is_action_just_pressed("jump"):
		anim.play("saltar")
		velocity.y -= jump

<<<<<<< Updated upstream

func _on_area_2d_body_entered(body):
	$Area2D/delante
=======
func agarrarse():
	if ($raycastParkour.get_collider()):
		print($raycastParkour.get_collider().is_in_group("tilesAgarrables"))
		if $raycastParkour.get_collider().is_in_group("tilesAgarrables") and Input.is_action_pressed("agarrarse"):
				anim.play("agarrado")
				agarrado = true
		elif Input.is_action_just_released("agarrarse"):
			anim.play("saltar")
			agarrado = false
>>>>>>> Stashed changes
