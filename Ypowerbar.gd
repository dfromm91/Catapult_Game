extends ProgressBar


var increasing = true
var speed = 100  # Adjust the speed of increase/decrease
var y_velocity = 0


func _process(delta):
	if Game.reset==true:
		value=0
		Game.reset=false
	if Game.turn == false and Game.stoneOnGround==true:
		
		if increasing:
			value += speed * delta
		else:
			value -= speed * delta

		if value >= max_value:
			increasing = false
		elif value <= min_value:
			increasing = true
func _input(event):
	if event is InputEventKey and not event.pressed and event.keycode == KEY_SPACE and Game.turn==false:
		y_velocity = self.value
		Game.y_velocity=y_velocity
		
		Game.turn = null
		Game.fire=true
