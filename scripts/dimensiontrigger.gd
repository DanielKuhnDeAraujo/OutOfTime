extends Node
func futuro() :
	get_parent().viajantes-=1
	get_parent().cutscene1()
	queue_free()
