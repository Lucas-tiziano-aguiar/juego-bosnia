extends CharacterBody2D
class_name Humano

@onready var anim := $AnimatedSprite2D
var speed := 120;
var direccion := 0.0;
const gravity = 9
const jump = 5000

static func inputTeclasLeftRight() -> float:
	return Input.get_axis("left","right")
