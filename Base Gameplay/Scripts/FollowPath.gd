extends Path2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var pathLoc = 0;
export var pathSpeed = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Monster3Path").offset = pathLoc
	pathLoc += pathSpeed
