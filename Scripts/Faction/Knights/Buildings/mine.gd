extends RootBuilding

@onready var activeSprite = $Active
@onready var inactiveSprite = $Inactive
@onready var destroyedSprite = $Destroyed
@onready var activeCollision = $ActiveCollision
@onready var inactiveCollision = $InactiveCollision
@onready var destroyedCollision = $DestroyedCollision

func _ready():
	# set default spawn values
	inactiveSprite.visible = true
	inactiveCollision.disabled = false
	currentDisplayedSprite = inactiveSprite
	
	activeSprite.visible = false
	activeCollision.disabled = true
	destroyedSprite.visible = false
	destroyedCollision.disabled = true
	
	super()
