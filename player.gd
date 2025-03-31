extends CharacterBody2D
@onready var pause_menu = $PauseMenu

const SPEED = 500.0
const JUMP_VELOCITY = -500.0

@onready var animated_sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_attacking = false  # Track if the player is attacking

func _ready():
	animated_sprite_2d.animation_finished.connect(_on_animation_finished)

func _physics_process(delta):
	# Add gravity so the player can fall while attacking
	if not is_on_floor():
		velocity.y += gravity * delta

	# Allow movement even when attacking
	var input_axis = Input.get_axis("ui_left", "ui_right")
	if input_axis:
		velocity.x = input_axis * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Handle Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle Attack (can still move/fall)
	if Input.is_action_just_pressed("Attack") and not is_attacking:
		attack()

	move_and_slide()
	update_animations(input_axis)

	# Check if health is 0
	if Game.Health <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://menu.tscn")

func update_animations(input_axis):
	# Allow attack animation to play without overriding movement/falling
	if is_attacking:
		return  

	if input_axis != 0:
		animated_sprite_2d.flip_h = input_axis < 0
		animated_sprite_2d.play("Walk")
	else:
		animated_sprite_2d.play("Idle")
		
	if not is_on_floor():
		animated_sprite_2d.play("DoubleJump")

func attack():
	is_attacking = true
	animated_sprite_2d.play("Attack")

func _on_animation_finished():
	# Reset attack state when "Attack" animation finishes
	if animated_sprite_2d.animation == "Attack":
		is_attacking = false
