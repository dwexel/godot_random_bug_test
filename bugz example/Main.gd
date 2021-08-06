extends Node

export (PackedScene) var moth_scene
export (PackedScene) var bug_scene

export var swarm_size = 3

func _ready():

	randomize()

	for _i in swarm_size:
		var moth = moth_scene.instance()
		add_child(moth)
		moth.position.x = rand_range(0, 100)
		moth.position.y = rand_range(0, 100)
		
	
	print_tree_pretty()




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LightEmitter_light_on():
	pass # Replace with function body.
