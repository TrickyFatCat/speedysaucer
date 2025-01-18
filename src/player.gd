class_name Player
extends RigidBody2D

@export var force: float = 1000

var _movement_dir: Vector2 = Vector2.ZERO


func _process(_delta: float) -> void:
	DebugDraw2D.set_text("Direction", _movement_dir)


func _physics_process(_delta: float) -> void:
	_movement_dir.x = _get_action_value("right") - _get_action_value("left")
	_movement_dir.y = _get_action_value("down") - _get_action_value("up")

	if _movement_dir.length() != 0:
		apply_force(_movement_dir * force)


func _get_action_value(action_name: String) -> int:
	return int(Input.is_action_pressed(action_name))
