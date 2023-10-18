extends CharacterBody2D
class_name Humano

var speed := 120;
var direccion := 0.0;
const gravity = 9
const jump = 250

static func inputTeclasLeftRight() -> float:
	return Input.get_axis("left","right")
