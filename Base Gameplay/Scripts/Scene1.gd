extends Node2D

# Declare member variables here. Examples:
# --- TODO : remplacer les gets des variables par des méthodes
var Player
var PlayerPos = Vector2(0,0)
var Crosshair
var CrosshairPos = Vector2(1,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	Player = get_node("Player1")
	Crosshair = get_node("Crosshair")
	PlayerPos = Player.position
	CrosshairPos = Crosshair.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PlayerPos = Player.position
	CrosshairPos = Crosshair.position

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Scenes/Scene1.tscn")
	
