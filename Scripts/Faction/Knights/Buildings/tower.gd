extends Area2D

class_name Tower

var currentDisplayedSprite = null
var isMouseOver:bool = false
var selectedFrameWidth = null
var selectedFrameHeigth = null

@onready var buildSprite = $Build
@onready var buildingSprite = $Building
@onready var destroyedSprite = $Destroyed
@onready var buildCollision = $BuildCollision
@onready var buildingCollision = $BuildingCollision
@onready var destroyedCollision = $DestroyedCollision

signal entitySelected

func _ready():
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	
	buildSprite.visible = true
	buildCollision.disabled = false
	currentDisplayedSprite = buildSprite
	
	buildingSprite.visible = false
	buildingCollision.disabled = true	
	destroyedSprite.visible = false
	destroyedCollision.disabled = true
	
	selectedFrameWidth = currentDisplayedSprite.texture.get_width()
	selectedFrameHeigth = currentDisplayedSprite.texture.get_height()

func _process(delta):
	if Input.is_action_just_pressed("left_click") && isMouseOver:
		entitySelected.emit(self)

func _on_mouse_entered():
	isMouseOver = true

func _on_mouse_exited():
	isMouseOver = false
