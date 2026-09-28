extends CharacterBody2D

@export var jump_height := -35
@export var fall_speed := 8.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += (get_gravity()) * delta / fall_speed
		position += velocity 
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_height
		position += velocity * delta

func _on_deathfloor_body_entered(body: Node2D) -> void:
	queue_free()
