extends Node2D

@onready var PlayerCamera = $"Player Camera"
@onready var InitialCameraPosition = $"InitialCameraPosition"
@onready var AllSpawnerContainer = $Spawner
@onready var castle = $Buildings/Castle
@onready var contextMenu = $ContextMenu

var defaultCursor = load("res://Assets/UI/Pointers/01.png")
var selectCursor = load("res://Assets/UI/Pointers/02.png")

var current_selected_entity = null

signal entity_selected

func _ready():
	Input.set_custom_mouse_cursor(selectCursor, Input.CURSOR_POINTING_HAND, Vector2(32, 32))
	Input.set_custom_mouse_cursor(defaultCursor, Input.CURSOR_ARROW, Vector2(22, 17))
		
	PlayerCamera.position = InitialCameraPosition.position
	contextMenu.connect("leave_station", _on_entity_leaving_station)
	for spawnerContainer in AllSpawnerContainer.get_children():
		for spawner in spawnerContainer.get_children():
			spawner.connect("entity_created", _entity_created)
			spawner.spawnEntity()
	
func _process(delta):
	if current_selected_entity is RootCharacter && Input.is_action_just_pressed("right_click"):
		current_selected_entity.move(get_global_mouse_position())

func _entity_created(entity):
	entity.connect("entity_selected", _on_entity_selected.bind(entity))
	if entity is RootBuilding:
		entity.connect("entity_stationing", _on_entity_stationing.bind(entity))

func _on_entity_selected(selected_entity):
	if current_selected_entity != null:
		current_selected_entity.deselect()
	current_selected_entity = selected_entity
	if current_selected_entity is RootCharacter:
		current_selected_entity.openContextMenu(contextMenu)
	
func _on_entity_stationing(stationing_entity):
	if current_selected_entity is RootCharacter:
		stationing_entity.unit_entering_station(stationing_entity, current_selected_entity, contextMenu)
		

func _on_entity_leaving_station():
	if current_selected_entity is RootCharacter:
		current_selected_entity.leaveStation(contextMenu)
