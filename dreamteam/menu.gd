extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#res://Level1/Level1.tscn


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://temp.tscn")

func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Options/Options.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
