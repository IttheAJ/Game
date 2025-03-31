extends Control

#@onready var temp = $"../"
@onready var resume = $VBoxContainer/Resume
@onready var quit = $VBoxContainer/QUIT

func _ready():
	# Hide the pause menu initially
	self.visible = false 


func resumee():
	get_tree().paused = false
	self.visible = false # Hide the pause menu when resuming

func pause():
	get_tree().paused = true
	self.visible = true # Show the pause menu when pausing

func testEsc():
	if Input.is_action_just_pressed("Pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("Pause") and get_tree().paused:
		resumee()


func _on_resume_pressed():
	resumee()

func _process(delta):
	testEsc()

func _on_save_pressed() -> void:
	pass # Replace with function body.



func _on_options_pressed() -> void:
	pass # Replace with function body.



func _on_quit_pressed() -> void:
	get_tree().quit()
