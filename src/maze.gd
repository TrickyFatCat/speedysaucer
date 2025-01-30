class_name Maze
extends Area2D


func _ready() -> void:
	body_exited.connect(_handle_body_exited)


func _handle_body_exited(body: Node2D) -> void:
	if body is not Player:
		return

	get_tree().reload_current_scene()
