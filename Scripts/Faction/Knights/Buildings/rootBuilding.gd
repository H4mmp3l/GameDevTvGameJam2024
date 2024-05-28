extends Area2D

class_name RootBuilding

var mouse_in:bool = false
var hasStations:bool = false
var occupiedStations:Dictionary
var currentDisplayedSprite = null
var is_selected:bool = false

@onready var stations = $Stations
@onready var spawn = $Spawn
@onready var selectedFrame = $SelectedFrame

signal entity_selected
signal entity_stationing

func _ready():
	selectedFrame.set_corner_positions(currentDisplayedSprite.texture.get_width(), currentDisplayedSprite.texture.get_height())
	if stations != null && stations.get_children() != null:
		hasStations = true
		for station in stations.get_children():
			occupiedStations[station.name] = false

func _physics_process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_in:
		if Input.get_current_cursor_shape() == Input.CURSOR_POINTING_HAND:
			Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		selectedFrame.show_corner()
		is_selected = true
		emit_signal("entity_selected")
	if Input.is_action_just_pressed("right_click") && mouse_in:
		if hasStations:
			emit_signal("entity_stationing")

func _on_mouse_entered():
	mouse_in = true
	if !is_selected:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	mouse_in = false
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
func deselect():
	is_selected = false
	selectedFrame.hide_corner()

func unit_entering_station(selfObject, unit, contextMenu):
	for station in stations.get_children():
		if !occupiedStations[station.name]:
			occupiedStations[station.name] = true
			var stationPosition = get_global_position_from_entity(station)
			unit.enterStation(selfObject, stationPosition, station.name, contextMenu)
			break
	
func unit_leaving_station(stationName):
	occupiedStations[stationName] = false
	return get_global_position_from_entity(spawn)

func get_global_position_from_entity(entity):
	return Vector2(global_position.x + entity.position.x, global_position.y + entity.position.y)
