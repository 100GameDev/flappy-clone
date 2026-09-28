extends Area2D

var pipe_speed = -700

func _physics_process(delta: float) -> void:
	var velocity = Vector2(pipe_speed, 0)
	position += velocity * delta
