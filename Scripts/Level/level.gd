extends Node2D

@onready var characterContainer = $CharacterContainer
@onready var buildingContainer = $BuildingContainer
@onready var enemyContainer = $EnemyContainer
@onready var selectedFrame = $SelectedFrame
@onready var initialCameraPosition = $InitialCameraPosition
@onready var playerCamera = $"Player Camera"

var selectedEntity:Node2D
var targetCastle:Node2D

func _ready():
	Input.set_custom_mouse_cursor(load("res://Assets/UI/Pointers/01.png"), Input.CURSOR_ARROW, Vector2(22,17))
	Input.set_custom_mouse_cursor(load("res://Assets/UI/Pointers/02.png"), Input.CURSOR_POINTING_HAND, Vector2(32,32))
	playerCamera.position = initialCameraPosition.position
	
	for characterNode in characterContainer.get_children():
		link_selected_entity_signal(characterNode)
	
	for buildingNode in buildingContainer.get_children():
		link_selected_entity_signal(buildingNode)
		if buildingNode is Castle:
			targetCastle = buildingNode
	
	for enemyNode in enemyContainer.get_children():
		enemyNode.setTarget(targetCastle)
		pass

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
	if selectedEntity is CharacterBody2D:
		selectedEntity.updateFrame(selectedFrame)
	selectedFrame.set_corner_positions_and_show_frame(entity.global_position, entity.selectedFrameWidth, entity.selectedFrameHeigth)
