extends RootBuilding

@onready var buildSprite = $Build
@onready var buildingSprite = $Building
@onready var destroyedSprite = $Destroyed
@onready var buildCollision = $BuildCollision
@onready var buildingCollision = $BuildingCollision
@onready var destroyedCollision = $DestroyedCollision

func _ready():
	# set default spawn values
	buildSprite.visible = true
	buildCollision.disabled = false
	currentDisplayedSprite = buildSprite
	
	buildingSprite.visible = false
	buildingCollision.disabled = true	
	destroyedSprite.visible = false
	destroyedCollision.disabled = true
	
	# exec parent ready method
	super()
