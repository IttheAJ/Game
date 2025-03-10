extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var direction = 0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			anim.flip_h = velocity.x < 0
			anim.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("Idle")

	move_and_slide()
	if not is_on_floor(): 
		anim.flip_h = velocity.x < 0
		anim.play("Jump") 




func _process(delta):
	if direction == 1:
		$Animator/Sprite2D.flip_h = false
	elif direction == -1:
		$Animator/Sprite2D.flip_h = true
		
