extends Control

@onready var temp = $"../"


func _on_resume_pressed() -> void:
	temp.pauseMenu()




func _on_save_pressed() -> void:
	pass # Replace with function body.



func _on_options_pressed() -> void:
	pass # Replace with function body.



func _on_quit_pressed() -> void:
	get_tree().quit()
