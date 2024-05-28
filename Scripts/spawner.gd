extends Marker2D

@export var spawnableEntity:PackedScene
@export var containerPath:NodePath
@onready var container := get_node(containerPath)

signal entity_created

func spawnEntity():
	if (spawnableEntity):
		var entityInstance = spawnableEntity.instantiate()
		container.add_child(entityInstance)
		entityInstance.position = position
		entity_created.emit(entityInstance)
