extends Humano

@onready var parado = $Parado;
@onready var arrastrado = $Arrastrado
@onready var anim := $Animacion
var  raycastLong = 22.5

var blend = 0.5
var agarrado = false
func _ready():
	parado.disabled = false
	arrastrado.disabled = true
	$raycastParkour.target_position.y = raycastLong

func _physics_process(delta):
	agarrarse()
	if agarrado == false and arrastrado.disabled == true:
		if is_on_floor():
			direccion = Humano.inputTeclasLeftRight()
		print(direccion)
		velocity.x = direccion * speed
		velocity.y += gravity
		agacharse()
		if direccion != 0 and is_on_floor():
			direccionSprite()
			sprint()
			salto()
		elif is_on_floor():
			iddle()
	if agarrado == true and arrastrado.disabled == true:
		direccion = Humano.inputTeclasLeftRight()
		velocity.x = 0
		velocity.y = 0
		direccionSprite()
		subirAgarrado()
	if agarrado == false and arrastrado.disabled == false:
		if is_on_floor():
			direccion = Humano.inputTeclasLeftRight()
		velocity.x = direccion * speed
		velocity.y += gravity
		agacharse()
		if direccion != 0 and is_on_floor():
			direccionSprite()
		elif is_on_floor():
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
		$raycastParkour.target_position.y = raycastLong
	elif direccion < 0:
		anim.flip_h = true
		$raycastParkour.target_position.y = -raycastLong

func estado():
	if speed > 0:
		sprint()
	elif speed == 0:
		iddle()

func agacharse():
	if Input.is_action_pressed("crouch"):
		anim.play("agacharse")
		anim.play("agachado")
		parado.disabled = true
		arrastrado.disabled = false
	elif Input.is_action_just_released("crouch") and comprobarEspacio() == false:
		anim.play("levantarse")
		parado.disabled = false
		arrastrado.disabled = true
	else:
		pass

func comprobarEspacio():
	return $levantar.is_colliding()

func subirAgarrado():
	if Input.is_action_just_pressed("jump"):
		anim.play("escalar")
		for i in range(10):
			velocity.y += -speed
			move_and_slide()
		agarrado = false
		arrastrado.disabled = true

func salto():
	if Input.is_action_just_pressed("jump"):
		anim.play("saltar")
		direccionSprite()
		velocity.y -= jump
		agarrado = false
		arrastrado.disabled = true

func agarrarse():
	if ($raycastParkour.get_collider()):
		print($raycastParkour.get_collider().is_in_group("tilesAgarrables"))
		if $raycastParkour.get_collider().is_in_group("tilesAgarrables"):
				if Input.is_action_pressed("agarrarse"):
					anim.play("agarrado")
					agarrado = true
				elif Input.is_action_just_pressed("agarrarse"):
					anim.play("escalar")
				elif Input.is_action_just_released("agarrarse"):
					agarrado = false
		else:
			anim.play("saltar")
			agarrado = false
