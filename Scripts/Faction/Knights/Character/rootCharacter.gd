extends CharacterBody2D

class_name RootCharacter

var mouse_in:bool = false
var is_stationed:bool = false
var stationedInBuilding = null
var stationedInStation = null
var is_selected:bool = false

@onready var selectedFrame = $SelectedFrame
@onready var sprite = $AnimatedSprite2D

signal entity_selected

func _ready():
	selectedFrame.set_corner_positions(64, 64)

func _physics_process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_in:
		if Input.get_current_cursor_shape() == Input.CURSOR_POINTING_HAND:
			Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		selectedFrame.show_corner()
		is_selected = true
		emit_signal("entity_selected")
		
func deselect():
	selectedFrame.hide_corner()
	is_selected = false

func move(coordinates:Vector2):
		position = coordinates	
		if is_stationed:
			leaveStation()
	
func enterStation(buildingToStationIn, stationPosition, stationName):
	is_stationed = true
	stationedInBuilding = buildingToStationIn
	stationedInStation = stationName
	position = stationPosition
	
func leaveStation():
	is_stationed = false
	position = stationedInBuilding.unit_leaving_station(stationedInStation)
	stationedInBuilding = null
	stationedInStation = null
	
func _on_mouse_entered():
	mouse_in = true
	if !is_selected:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	mouse_in = false
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
