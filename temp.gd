extends Node2D
#@onready var pause_menu = $PauseMenu
@onready var pause_menu = $PauseMenu
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		pause_menu.toggle_pause()


func _on_transition_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Player/world.tscn")
