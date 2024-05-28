extends Area2D

var mouse_in:bool = false

func _physics_process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_in:
		print("House Clicked")

func _on_mouse_entered():
	mouse_in = true

func _on_mouse_exited():
	mouse_in = false
