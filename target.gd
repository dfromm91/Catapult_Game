extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	Game.targetsleft-=1
	Game.hit =true
	Game.subhealth = false
	Game.index+=1
	Game.bonk=true
	queue_free()
	
	print(Game.index)
