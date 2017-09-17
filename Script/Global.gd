extends Node

var Viewport_Scale
var Viewport_Res #解析度

func _ready():
	#var viewport = get_node("/root/World")
	var Viewport = get_node("/root").get_children()[1].get_viewport_rect().size
	Viewport_Scale = 512/Viewport.y
	print(Viewport_Scale)
	Viewport_Res = get_node("/root").get_children()[1].get_viewport_rect().size
	#print(viewport.get_name())
	#print(viewport)
	pass
