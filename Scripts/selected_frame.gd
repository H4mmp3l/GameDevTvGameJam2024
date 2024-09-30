extends Node2D

@onready var leftTopCorner = $LeftTopCorner
@onready var rightTopCorner = $RightTopCorner
@onready var leftBottomCorner = $LeftBottomCorner
@onready var rightBottomCorner = $RightBottomCorner

signal newSelection

func _ready():
	hide_corner()

func set_corner_positions_and_show_frame(newPosition, width, heigth):
	set_corner_positions(width / 2, heigth / 2)
	set_frame_position(newPosition)
	show_corner()

func update_corner_positions(newPosition):
	set_frame_position(newPosition)
	
func set_corner_positions(width, heigth):
	leftTopCorner.position = Vector2(-width,-heigth)
	rightTopCorner.position = Vector2(width, -heigth)
	leftBottomCorner.position = Vector2(-width,heigth)
	rightBottomCorner.position = Vector2(width, heigth)

func hide_corner():
	leftTopCorner.visible = false
	rightTopCorner.visible = false
	leftBottomCorner.visible = false
	rightBottomCorner.visible = false

func show_corner():
	leftTopCorner.visible = true
	rightTopCorner.visible = true
	leftBottomCorner.visible = true
	rightBottomCorner.visible = true

func set_frame_position(newPosition):
	global_position = newPosition
