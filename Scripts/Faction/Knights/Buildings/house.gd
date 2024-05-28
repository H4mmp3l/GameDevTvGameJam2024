extends RootBuilding

@onready var buildSprite = $Build
@onready var buildingSprite = $Building
@onready var destroyedSprite = $Destroyed
@onready var buildCollision = $BuildCollision
@onready var buildingCollision = $BuildingCollision
@onready var destroyedCollision = $DestoryedCollision

func _ready():
	buildSprite.visible = true
	buildCollision.disabled = false
	currentDisplayedSprite = buildSprite
	
	buildingSprite.visible = false
	buildingCollision.disabled = true
	destroyedSprite.visible = false
	destroyedCollision.disabled = true
	
	super()
