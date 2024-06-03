extends CharacterBody2D

@onready var navigationAgent = $NavigationAgent2D as NavigationAgent2D

const speed = 300
const accel = 7

func _physics_process(delta):
	var direction = navigationAgent.get_next_path_position().normalized()
	velocity = velocity.lerp(direction * speed, accel * delta)
	move_and_slide()

func _on_level_castle_created(castle_position):
	navigationAgent.target_position = castle_position
	pass # Replace with function body.
