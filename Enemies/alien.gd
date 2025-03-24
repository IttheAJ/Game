extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = 1
@export var flip_time = 1

func _ready() -> void:
		$Timer.wait_time = flip_time # Replace with function body.

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = direction * SPEED
	move_and_slide()
	$AnimatedSprite2D.flip_h = direction > 0

func _on_timer_timeout() -> void:
	direction *= -1
