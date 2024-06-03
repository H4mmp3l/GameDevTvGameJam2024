extends Node2D

@onready var characterContainer = $CharacterContainer
@onready var buildingContainer = $BuildingContainer
@onready var selectedFrame = $SelectedFrame

var selectedEntity:Node2D

func _ready():
	for characterNode in characterContainer.get_children():
		link_selected_entity_signal(characterNode)
	
	for buildingNode in buildingContainer.get_children():
		link_selected_entity_signal(buildingNode)

func _process(delta):
	if Input.is_action_just_pressed("deselect"):
		selectedEntity.deselect()
		selectedEntity = null
		selectedFrame.hide_corner()

func link_selected_entity_signal(entity):
	entity.connect("entitySelected", _on_entity_selected)

func _on_entity_selected(entity):
	if selectedEntity is Node2D:
		selectedEntity.deselect()
	selectedEntity = entity
	selectedFrame.set_corner_positions_and_show_frame(entity.global_position, entity.selectedFrameWidth, entity.selectedFrameHeigth)
