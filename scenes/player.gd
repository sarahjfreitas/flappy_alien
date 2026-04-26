extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound

var gravity := 200.0
var current_jump_speed := 0.0
var initial_x := 200.0
var horizontal_speed := 100.0
var health : int

signal hit(health : int)
signal dead
	
func _ready() -> void:
	animated_sprite_2d.play("idle")
	position.x = initial_x
	health = 3

func _unhandled_input(event: InputEvent) -> void:
	if health <= 0:
		return
		
	if event.is_pressed() and (event is InputEventMouseButton or event is InputEventScreenTouch):
		jump()

func _physics_process(delta: float) -> void:
	if health <= 0:
		velocity = Vector2.ZERO
		position.x = initial_x
		return
		
	if current_jump_speed > 0:
		current_jump_speed = max(0, current_jump_speed - 30)
		
	if current_jump_speed == 0:
		animated_sprite_2d.play("down")
	
	var direction = sign(initial_x - position.x)
	velocity.x = move_toward(velocity.x, direction * horizontal_speed, horizontal_speed * delta)
	
	velocity.y = (current_jump_speed * -1) + gravity
	move_and_slide()
	
	if get_slide_collision_count() > 0 and $ImortalTimer.is_stopped():
		health -= 1
		hit.emit(health)
		$ImortalTimer.start()
		
		if (health <= 0):
			dead.emit()

func jump():
	animated_sprite_2d.play("up")
	current_jump_speed = 1000.0
	jump_sound.play()
