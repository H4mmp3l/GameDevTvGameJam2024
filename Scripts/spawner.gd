extends Marker2D

@export var spawnableUnit:PackedScene
@export var containerPath:NodePath
@export var stationNode:NodePath
@onready var container := get_node(containerPath)

signal unit_created
signal unit_stationing

func spawnDefaultUnit():
	if (spawnableUnit):
		var unitInstance = spawnableUnit.instantiate()
		container.add_child(unitInstance)
		if !stationNode:
			unitInstance.position = position
		unit_created.emit(unitInstance)
		unit_stationing.emit(unitInstance, stationNode)
