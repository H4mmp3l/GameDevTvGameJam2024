extends CanvasLayer

@onready var nameLabel = $ContextMenu/Name/NameLabel
@onready var hpLabel = $ContextMenu/HP
@onready var armorLabel = $ContextMenu/Armor
@onready var leaveBuildingButton = $ContextMenu/LeaveBuilding

signal leave_station

func _ready():
	hide_context_menu()

func show_context_menu():
	visible = true
	
func hide_context_menu():
	visible = false
	nameLabel.visible = false
	hpLabel.visible = false
	armorLabel.visible = false
	leaveBuildingButton.visible = false

func change_context_menu_name(name):
	nameLabel.text = name
	nameLabel.visible = true
	
func change_context_menu_hp(hp):
	hpLabel.text = "HP: " + str(hp)
	hpLabel.visible = true
	
func change_context_menu_armor(armor):
	armorLabel.text = "Armor: " + str(armor)
	armorLabel.visible = true
	
func change_context_menu_leave_building_button(is_stationed):
	leaveBuildingButton.visible = is_stationed

func fill_context_menu(nameLabel, hp, armor, is_stationed):
	change_context_menu_name(nameLabel)
	change_context_menu_hp(hp)
	change_context_menu_armor(armor)
	change_context_menu_leave_building_button(is_stationed)

func _on_leave_building_pressed():
	leave_station.emit()

func _on_unit_open_context_menu(nameLabel, hp, armor, is_stationed):
	fill_context_menu(nameLabel, hp, armor, is_stationed)
	show_context_menu()

func _on_unit_close_context_menu():
	hide_context_menu()

func _on_unit_update_context_menu(nameLabel, hp, armor, is_stationed):
	fill_context_menu(nameLabel, hp, armor, is_stationed)
