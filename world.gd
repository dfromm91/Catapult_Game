extends Node2D


var target_scene = preload("target.tscn")
var target_locations = [Vector2(100, 500), Vector2(300, 400), 
Vector2(350, 300),Vector2(575, 250),
Vector2(700, 400),Vector2(750, 200),
Vector2(800, 150),Vector2(300, 100),
Vector2(900, 400),Vector2(500, 50)
] # Example locations

func _ready():
	spawn_target(0) # Spawn the first target


func _process(delta):
	$Label.text='Throws: '+str(Game.throws)
	$Label2.text = 'Targets Left: '+str(Game.targetsleft)
	if Game.hit==true:
		spawn_target(Game.index)
		Game.hit=false
	if Game.targetsleft==0:
		get_tree().change_scene_to_file('res://end.tscn')

func spawn_target(index):
	if Game.index<len(target_locations):
		var target_instance = target_scene.instantiate()
		add_child(target_instance)
		target_instance.position = target_locations[Game.index]
	else:
		print('you win')


