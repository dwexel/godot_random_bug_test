extends KinematicBody2D

onready var curve = get_node("..").curve

var t = 0
export var speed = 1.5


func _physics_process(delta):
	t += delta * speed
	position = curve.interpolatef(t)
	
