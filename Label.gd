extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text= "Congratulations! \nyou cleared all the \ntargets with "+str(Game.throws)+" Throws"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
