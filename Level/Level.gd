extends Node

const CAR = preload("res://Player/Car.tscn")

func _ready():
	pass


func _on_Timer_timeout():
	var car = CAR.instance()
	car.position = get_node("CarStart1").position
	add_child(car)
	
