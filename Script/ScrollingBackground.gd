extends ParallaxLayer



func _ready():
	set_process(true)
	
func _process(delta):
	var curPos = get_pos()
	curPos.x = curPos.x - 100 * delta
	set_pos(curPos)
