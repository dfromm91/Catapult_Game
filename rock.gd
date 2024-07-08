extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y>575:
		Game.stoneOnGround=true
		if Game.subhealth==true:
			Game.health-=1
		if Game.hit==true:
			Game.hit=false
		if Game.subhealth==false:
			Game.subhealth=true
		Game.reset=true
		Game.throws+=1
		queue_free()
