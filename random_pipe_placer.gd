extends Node2D

var pipe_scene := [
	preload("res://pipe.tscn"),
]


func _ready() -> void:
	get_node("Timer").timeout.connect(_on_timer_timeout)
	
func _on_timer_timeout() -> void:
	var random_pipe_scene: PackedScene = pipe_scene.pick_random()
	var pipe_instance := random_pipe_scene.instantiate()
	add_child(pipe_instance)
	var viewport_size := get_viewport_rect().size
	var random_position := Vector2(0.0, 0.0)
	random_position.x = 1500
	random_position.y = randf_range(-800, viewport_size.y / 2)
	pipe_instance.position = random_position
	pipe_instance.area_entered.connect(_on_area_entered)
	
func _on_area_entered(area_that_entered: Area2D) -> void:
	get_child(1).queue_free()
