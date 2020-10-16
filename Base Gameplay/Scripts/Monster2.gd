extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var canHit;
export var Speed = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	canHit = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Player = get_parent().get("Player")
	translate(GetVector())
	if(canHit):
		if(overlaps_body(Player)):
			Player.UpdateHealth(-10)
			get_node("Timer").start()
			canHit = false

func GetPlayerPosition():
	return get_parent().get("PlayerPos")

func GetAngle():
	var Vect = self.position - GetPlayerPosition()
	if(Vect.x > 0):
		return atan(Vect.y/Vect.x) + PI
	else:
		return atan(Vect.y/Vect.x) 

func GetVector():
	var Angle = GetAngle()
	return Speed*Vector2(cos(Angle),sin(Angle))

func _on_Monster1_area_shape_entered(area_id, area, area_shape, self_shape):
	get_node("MonsterHealth").UpdateHealth(-10)
	if(get_node("MonsterHealth").GetHealth() <= 0):
		queue_free()

func _on_Timer_timeout():
	canHit = true


func _on_Monster1_body_entered(body):
	var Player = get_parent().get("Player")
	if(body.get_name() == Player.get_name()):
		Player.UpdateHealth(-10)
