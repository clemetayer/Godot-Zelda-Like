extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var Health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("HealthBar").value = Health

func UpdateHealth(amount):
	if(Health + amount >= 0):
		Health += amount
	else:
		Health = 0
	get_node("HealthBar").value = Health
		

func GetHealth():
	return Health

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
