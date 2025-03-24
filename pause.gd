extends Control

#@onready var temp = $"../"
@onready var resume = $VBoxContainer/Resume
@onready var quit = $VBoxContainer/QUIT


func _ready() -> void:
	visible = false
	resume.pressed.connect(_on_resume_pressed)
	quit.pressed.connect(_on_resume_pressed)
	center_pause_menu()

	#temp.pauseMenu()


func center_pause_menu():
	var viewport_size = get_viewport().get_visible_rect().size
	position = viewport_size / 2 - size / 2


func toggle_pause():
	visible = !visible
	get_tree().paused=visible

func _on_resume_pressed():
	toggle_pause();

func _on_save_pressed() -> void:
	pass # Replace with function body.



func _on_options_pressed() -> void:
	pass # Replace with function body.



func _on_quit_pressed() -> void:
	get_tree().quit()
