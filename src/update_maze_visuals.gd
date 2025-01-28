@tool
extends CollisionPolygon2D

@export var visuals: Polygon2D = null

# func _ready() -> void:
# 	if Engine.is_editor_hint():
# 		EditorInterface.get_inspector().property_edited.connect(_handle_property_edited)

# func _handle_property_edited(property: String) -> void:
# 	if visuals == null || property != "polygon":
# 		return
#
# 	visuals.polygon = polygon


# WARNING: Not the best solution, but it works. Consider find a better way to handle such cases
func _process(_delta: float) -> void:
	if Engine.is_editor_hint() && visuals != null:
		visuals.polygon = polygon
