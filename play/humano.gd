extends CharacterBody2D
class_name Humano

var Health = 200;
var speed := 0;
var direccion := 0.0;
var gravity = 9
const jump = 230

static func inputTeclasLeftRight() -> float:
	return Input.get_axis("left","right")
