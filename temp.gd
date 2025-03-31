extends Node2D
#@onready var pause_menu = $PauseMenu
#@onready var pause_menu = $PauseMenu
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_transition_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Player/world.tscn")
