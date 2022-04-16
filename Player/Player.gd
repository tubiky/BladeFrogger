extends KinematicBody2D


const speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	move_and_slide(velocity.normalized() * speed)
	player_animation(velocity)

func player_animation(velocity):
	if velocity.y > 0:
		get_node("AnimatedSprite").play("walk_down")
		
	elif velocity.y < 0:
		get_node("AnimatedSprite").play("walk_up")
	
	#elif velocity.x > 0:
	#	get_node("AnimatedSprite").flip_h = true
	#	get_node("AnimatedSprite").play("walk_side")
	
	# When you make a 4-direction game, you only need walking animation to the left
	# Cause you can re-use the side-walking animation by flipping it horizontally
	
	elif velocity.x != 0:                                   # These two lines are the 
		get_node("AnimatedSprite").flip_h = velocity.x > 0  # kick of the coding!
		get_node("AnimatedSprite").play("walk_side")
		
	else:
		get_node("AnimatedSprite").stop()
		get_node("AnimatedSprite").frame = 0
		
func test():
	queue_free()
