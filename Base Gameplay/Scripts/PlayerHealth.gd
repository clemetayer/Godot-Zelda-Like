extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var Health = 100
var SaveKey = "Health Player1"

# Called when the node enters the scene tree for the first time.
func _ready():
	Health = General.PlayerHealth
	get_node("HealthBar").value = Health

func UpdateHealth(amount):
	if(Health + amount >= 0):
		Health += amount
	else:
		Health = 100
		get_tree().change_scene("res://Scenes/GameOver.tscn") # To game over scene
	get_node("HealthBar").value = Health
	General.PlayerHealth = Health #Note : Script General : Project -> Parameters -> Autoload. To transfer variables between scenes

func GetHealth():
	return Health

func save(SaveObject : Resource):
	SaveObject.data[SaveKey] = Health
	
func load(SaveObject : Resource):
	Health = SaveObject.data[SaveKey]
	get_node("HealthBar").value = Health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("test_hurtme"):
		UpdateHealth(-10)
		get_node("HealthBar").value = Health
	
