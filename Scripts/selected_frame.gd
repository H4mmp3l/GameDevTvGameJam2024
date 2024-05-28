extends Node2D

@onready var leftTopCorner = $LeftTopCorner
@onready var rightTopCorner = $RightTopCorner
@onready var leftBottomCorner = $LeftBottomCorner
@onready var rightBottomCorner = $RightBottomCorner

func _ready():
	hide_corner()

func set_corner_positions(width, heigth):
	width /= 2
	heigth /= 2
	
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
