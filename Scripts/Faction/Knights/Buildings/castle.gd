extends RootBuilding

class_name Castle

@onready var buildSprite = $Build
@onready var destroyedSprite = $Destroyed
@onready var buildCollision = $BuildCollision
@onready var destroyedCollision = $DestroyedCollision

func _ready():
	# set default spawn values
	buildSprite.visible = true
	buildCollision.disabled = false
	currentDisplayedSprite = buildSprite
	
	destroyedSprite.visible = false
	destroyedCollision.disabled = true
	
	# exec parent ready method
	super()
	
