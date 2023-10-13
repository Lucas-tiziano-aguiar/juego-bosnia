extends Humano

func _physics_process(delta):
	direccion = Humano.inputTeclasLeftRight()
	velocity.x = direccion * speed
	velocity.y = velocity.y + gravity
	if direccion != 0 and is_on_floor():
		if Input.is_action_pressed("sprint"):
			anim.play("run")
			speed = 140
		else:
			anim.play("caminar");
			speed = 120
	else:
		anim.play("iddle")
	if direccion > 0:
		anim.flip_h= false
	else:
		anim.flip_h = true
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y -= jump
	move_and_slide()
