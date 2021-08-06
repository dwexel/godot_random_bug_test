extends Path2D

var screen_size = Vector2.ZERO
var follower_pos = Vector2.ZERO
var c = Color.red
var cp_length = 200
var rng = RandomNumberGenerator.new()

func _ready():
	
	rng.randomize()
	
	print(rng.seed)
	
	screen_size = get_viewport_rect().size
	position = Vector2.ZERO
	curve.clear_points()
	
	for i in 3:
		var control_point = Vector2(cp_length, 0).rotated(rng.randf_range(0, PI * 2))
		curve.add_point(random_point(), control_point, control_point.rotated(PI))
	

func random_point():
	rng.randomize()
	var point = Vector2.ZERO
	point.x = rng.randf_range(0, screen_size.x)
	point.y = rng.randf_range(0, screen_size.y)
	return point


func new_point():
		var control_point = Vector2(cp_length, 0).rotated(rng.randf_range(0, PI * 2))
		curve.add_point(random_point(), control_point, control_point.rotated(PI))

func _process(_delta):
	
	follower_pos = $Player.position
	
	var penultimate_point = curve.get_point_count() - 1
	var pen_point_position = curve.get_point_position(penultimate_point)
	var v = follower_pos - pen_point_position
	
	if  v.length() < 5:
		new_point()

