extends KinematicBody2D

# Declare member variables here. Examples:
var speed
var runSpeedMultiplier
var isRunning
const ARROW = preload("res://Scenes/Arrow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 1
	runSpeedMultiplier = 2
	isRunning = false
	
func UpdateHealth(amount):
	get_node("PlayerHealth").UpdateHealth(amount)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("ui_up")):
		.move_and_collide(Vector2(0,-1)*speed)
		$AnimatedSprite.play("up")
	if(Input.is_action_pressed("ui_down")):
		.move_and_collide(Vector2(0,1)*speed )
		$AnimatedSprite.play("down")
	if(Input.is_action_pressed("ui_left")):
		.move_and_collide(Vector2(-1,0)*speed)
		$AnimatedSprite.play("left")
	if(Input.is_action_pressed("ui_right")):
		.move_and_collide(Vector2(1,0)*speed)
		$AnimatedSprite.play("right")
	if(not(Input.is_action_pressed("ui_up")) and not(Input.is_action_pressed("ui_down")) and not(Input.is_action_pressed("ui_left")) and not(Input.is_action_pressed("ui_right"))):
		$AnimatedSprite.stop()

func _input(event):
	if(event.is_action_pressed("ui_run")):
		if(isRunning):
			speed = speed/runSpeedMultiplier
			$AnimatedSprite.set_speed_scale(speed)
			isRunning = false
		else:
			speed = speed*runSpeedMultiplier
			$AnimatedSprite.set_speed_scale(speed)
			isRunning = true
	if(event.is_action_pressed("ui_fire")):
		var Arrow = ARROW.instance()
		get_parent().add_child(Arrow)
	if(event.is_action_pressed("ui_save")):
		get_parent().save_game()
	if(event.is_action_pressed("ui_load")):
		get_parent().load_game()
	
