extends CharacterBody2D

class_name GoblinWarrior

@onready var navAgent = $NavigationAgent2D
@onready var animatedSprite = $AnimatedSprite2D
@onready var proximityCollision = $ProximityCollisionArea

var isMouseOver:bool = false
var speed:int = 300
var isAttacking:bool = false

var nextTarget:Node2D

func _ready():
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	proximityCollision.connect("area_entered", _on_proximity_collision_entered)
	navAgent.connect("navigation_finished", _on_navigation_agent_2d_navigation_finished)

func _process(delta):
	print(rad_to_deg(nextTarget.global_position.angle_to_point(get_global_mouse_position())))
	
	
	if isAttacking:
		if nextTarget.position.x:
			var degreeToTarget = rad_to_deg(nextTarget.global_position.angle_to_point(get_global_mouse_position()))
			if degreeToTarget < 45 && degreeToTarget > -45:
				animatedSprite.play("attack_right")
				animatedSprite.flip_h = true
			elif degreeToTarget > 45 && degreeToTarget < 135:
				animatedSprite.play("attack_up")				
			elif degreeToTarget < -45 && degreeToTarget > -135:
				animatedSprite.play("attack_down")
			elif degreeToTarget > 135 || degreeToTarget < -135:
				animatedSprite.play("attack_right")
				animatedSprite.flip_h = false
	else:
		if Input.is_action_just_pressed("right_click"):
			pass
		move()

func _on_mouse_entered():
	isMouseOver = true
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	isMouseOver = false
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _on_navigation_agent_2d_navigation_finished():
	animatedSprite.play("idle")

func _on_proximity_collision_entered(entity):
	if entity == nextTarget:
		clearTarget()
		isAttacking = true

func _on_proximity_collision_exited(entity):
	if entity == nextTarget:
		isAttacking = false

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

func setTarget(target):
	navAgent.target_position = target.global_position
	nextTarget = target

func clearTarget():
	navAgent.target_position = global_position
