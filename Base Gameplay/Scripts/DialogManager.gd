extends Polygon2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var dialog = []
var page = 0 #used to handle the pages for the RichTextLabel
var StartDialog = false
var RTL;

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	RTL = get_node("RichTextLabel") #shortcut because used a lot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(StartDialog):
		if(Input.is_action_pressed("ui_interact")):
			if (RTL.get_visible_characters() > RTL.get_total_character_count()): 
					if page < len(dialog)-1:
						page += 1
						RTL.set_visible_characters(0)
						RTL.set_bbcode(dialog[page])
					elif page >= len(dialog)-1:
						RTL.set_visible_characters(0)
						page = 0
						self.hide()
						StartDialog = false

#function to enable the DialogBox to show up and start it
func StartDialog():
	if(StartDialog == false):
		StartDialog = true
		page = 0
		self.show()
		RTL.set_visible_characters(0)
		RTL.set_bbcode(dialog[page])
		
#check if you can show another character in the DialogBox
func _on_Timer_timeout():
	RTL.set_visible_characters(RTL.get_visible_characters()+1)
