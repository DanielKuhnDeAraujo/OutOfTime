extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lvl_1_pressed() -> void:
	pass # Replace with function body.


func _on_lvl_2_pressed() -> void:
	pass # Replace with function body.


func _on_lvl_3_pressed() -> void:
	pass # Replace with function body.


func _on_retornar_ao_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://secenes/tela inicial.tscn")
