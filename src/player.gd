class_name Player
extends RigidBody2D

@export var acceleration: float = 1000
@export var max_speed: float = 300.0

var _movement_dir: Vector2 = Vector2.ZERO


func _process(_delta: float) -> void:
	DebugDraw2D.set_text("Direction", _movement_dir)
	DebugDraw2D.set_text("Speed", linear_velocity.length())


func _physics_process(delta: float) -> void:
	_movement_dir.x = _get_action_value("right") - _get_action_value("left")
	_movement_dir.y = _get_action_value("down") - _get_action_value("up")
	_movement_dir = _movement_dir.normalized()
	var velocity: Vector2 = _movement_dir * acceleration

	if _movement_dir.length() != 0:
		apply_force(velocity * delta)

		var speed: float = clamp(linear_velocity.length(), 0, max_speed)
		linear_velocity = linear_velocity.normalized() * speed


func _get_action_value(action_name: String) -> int:
	return int(Input.is_action_pressed(action_name))
