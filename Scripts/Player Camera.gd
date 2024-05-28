extends Camera2D

const speed:int = 600
const scroll_speed:int = 1
const min_zoom:float = 0.8
const max_zoom:float = 1.5

func _process(delta): 
	if Input.is_action_pressed("move_camera_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("move_camera_down"):
		position.y += speed * delta
	if Input.is_action_pressed("move_camera_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("move_camera_right"):
		position.x += speed * delta
	if Input.is_action_pressed("scroll_in"):
		if zoom.x <= max_zoom || zoom.y <= max_zoom:
			var calculated_scroll_speed = scroll_speed * delta
			zoom = Vector2(zoom.x + calculated_scroll_speed, zoom.y + calculated_scroll_speed)
	if Input.is_action_pressed("scroll_out"):
		if zoom.x >= min_zoom || zoom.y >= min_zoom:
			var calculated_scroll_speed = scroll_speed * delta
			zoom = Vector2(zoom.x - calculated_scroll_speed, zoom.y - calculated_scroll_speed)
		
