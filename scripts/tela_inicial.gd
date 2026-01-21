extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_levels_pressed() -> void:
	print("APERTOU LEVELS")


func _on_opções_pressed() -> void:
	print("APERTOU opção")


func _on_sair_pressed() -> void:
	queue_free()
