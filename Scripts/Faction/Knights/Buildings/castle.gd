extends Area2D

var mouse_in:bool = false

@onready var station1 = $Station1
@onready var station2 = $Station2
@onready var spawn = $Spawn
var station1Occupied = false
var station2Occupied = false

func _physics_process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_in:
		print("Castle Clicked")

func _on_mouse_entered():
	mouse_in = true

func _on_mouse_exited():
	mouse_in = false

func unit_entering_station(unit):
	if !station1Occupied:
		print("station 1")
		unit.position = station1.position
		station1Occupied = true
	elif !station2Occupied:
		print("station 2")
		unit.position = station2.position
		station2Occupied = true
