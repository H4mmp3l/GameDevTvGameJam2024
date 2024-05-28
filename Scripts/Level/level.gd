extends Node2D

@onready var PlayerCamera = $"Player Camera"
@onready var InitialCameraPosition = $"InitialCameraPosition"
@onready var SpawnerContainer = $Spawner

var current_selected_unit = null

signal unit_selected

func _ready():
	PlayerCamera.position = InitialCameraPosition.position
	var allSpawner = SpawnerContainer.get_children()
	for spawner in allSpawner:
		spawner.connect("unit_created", _unitCreated)
		spawner.connect("unit_stationing", _unitStationing)
		spawner.spawnDefaultUnit()
		
	#Archer2.connect("archer_selected", _on_archer_selected.bind())
	
func _process(delta):
	if current_selected_unit!=null && Input.is_action_just_pressed("right_click"):
		current_selected_unit.move(get_global_mouse_position())
	
func _on_unit_selected(selected_unit):
	print("unit selected")
	current_selected_unit = selected_unit

func _unitCreated(unit):
	unit.connect("unit_selected", _on_unit_selected.bind(unit))

func _unitStationing(unit, stationNode):
	print(stationNode)
	var station = stationNode
	print(station)
	unit.stationing()
