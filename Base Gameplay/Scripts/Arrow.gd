extends Area2D

# Declare member variables here. Examples:
var TranslationDirection = Vector2(0,0)
var Speed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	position = GetPlayerPosition()
	TranslationDirection = GetVector()
	look_at(GetCrosshairPosition())


func GetPlayerPosition():
	return get_parent().get("PlayerPos")
	
func GetCrosshairPosition():
	return get_parent().get("CrosshairPos")
	
func GetAngle():
	var Vect = GetCrosshairPosition() - GetPlayerPosition()
	if(Vect.x >=0):
		return atan(Vect.y/Vect.x)
	else:
		return atan(Vect.y/Vect.x) + PI
	
func GetVector():
	var Angle = GetAngle()
	return Speed*Vector2(cos(Angle),sin(Angle))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(TranslationDirection)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
