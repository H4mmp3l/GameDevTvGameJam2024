extends CharacterBody2D

class_name RootCharacter

var mouse_in:bool = false
var stationed = false

signal unit_selected

func _physics_process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_in && !stationed:
		emit_signal("unit_selected")

func move(coordinates:Vector2):
	if !stationed:
		position = coordinates
		
func stationing():
	stationed = true

func unstationing():
	stationed = false

func _on_mouse_entered():
	mouse_in = true

func _on_mouse_exited():
	mouse_in = false
