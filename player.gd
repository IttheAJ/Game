extends CharacterBody2D


const SPEED = 5000.0
const JUMP_VELOCITY = -400.0
var direction = 0
var attacking = false
@onready var pause_menu = $PauseMenu
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and not attacking:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and attacking == false:
		velocity.x = direction * SPEED
		if is_on_floor():
			anim.flip_h = velocity.x < 0
			anim.play("Walk")
	elif not attacking:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("Idle")
		
	if Input.is_action_just_pressed("Attack") and not attacking:
		anim.play("Attack")
		attacking = true
	

	move_and_slide()
	if not is_on_floor() and not attacking: 
		anim.flip_h = velocity.x < 0
		anim.play("Jump") 

func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "Attack":
		attacking = false

func _proce(delta):
	if direction == 1:
		$Animator/Sprite2D.flip_h = false
	elif direction == -1:
		$Animator/Sprite2D.flip_h = true
		

func _ready():
	add_to_group("Player")
	


func _proces(delta):
	if Input.is_action_just_pressed("Pause"):
		pause_menu.toggle_pause()
func _physics_processs(delta):
	if get_tree().paused:
		return


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		print("Enemy entered")
