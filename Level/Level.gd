extends Node

const CAR = preload("res://Player/Car.tscn")

func _ready():
	get_node("Player").position = get_node("PlayerStartPos").position

func car_spawn(start_pos):
	var car = CAR.instance()
	var car_start_node_name = "StartPositions/CarStart" + str(start_pos)
	car.position = get_node(car_start_node_name).position
	get_node("YSort").add_child(car)
	var timer_node_name = "CarTimers/Timer" + str(start_pos)
	get_node(timer_node_name).wait_time = rand_range(1.0, 2.0)

func _on_Timer1_timeout() -> void: car_spawn(1)

func _on_Timer2_timeout() -> void: car_spawn(2)

func _on_Timer3_timeout() -> void: car_spawn(3)

func _on_Timer4_timeout() -> void: car_spawn(4)

func _on_Timer5_timeout() -> void: car_spawn(5)

func _on_Timer6_timeout() -> void: car_spawn(6)
