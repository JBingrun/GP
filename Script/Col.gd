extends Node2D

export var value = 1

func _ready():
	#print(get_owner().get_name())
	if get_owner() != null:  #get_owner()原本會抓他的最上母層級，但如果沒有則為null
		get_owner().Col_Total += value

	get_node("Area2D").connect("body_enter", self, "_collect_col") #使用偵測物件接觸訊號


func _collect_col(body):
	#print(get_owner().Col_Collected)
	#print(body.get_name())
	if get_node("AnimationPlayer").get_current_animation() != "Collect":

		if get_owner() != null:  #get_owner()原本會抓他的最上母層級，但如果沒有則為null
			get_owner().Col_Collected += value
		#print(get_owner().Col_Collected)
			get_owner().get_node("GUI/Counter/Col_Collected").set_text(str(get_owner().Col_Collected))
		get_node("AnimationPlayer").play("Collect")

		#queue_free() #物件消失
