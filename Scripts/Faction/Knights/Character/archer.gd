extends CharacterBody2D

class_name Archer

@onready var navAgent = $NavigationAgent2D
@onready var animatedSprite = $AnimatedSprite2D

var isMouseOver:bool = false
var isSelected:bool = false
var speed:int = 300
var selectedFrameWidth = 64
var selectedFrameHeigth = 64

signal entitySelected

func _ready():
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	navAgent.connect("navigation_finished", _on_navigation_agent_2d_navigation_finished)

func _process(delta):
	if Input.is_action_just_pressed("left_click") && isMouseOver:
		entitySelected.emit(self)
		isSelected = true
	if Input.is_action_just_pressed("right_click") && isSelected:
		navAgent.target_position = get_global_mouse_position()
	move()

func _on_mouse_entered():
	isMouseOver = true

func _on_mouse_exited():
	isMouseOver = false

func _on_navigation_agent_2d_navigation_finished():
	animatedSprite.play("idle")

func move():
	if navAgent.target_position && !navAgent.is_navigation_finished():
		var direction = to_local(navAgent.get_next_path_position()).normalized()
		velocity = direction * speed
		if (velocity.x > 0):
			animatedSprite.flip_h = false
		else:
			animatedSprite.flip_h = true
		animatedSprite.play("running")
		move_and_slide()

func deselect():
	isSelected = false
