extends AnimatableBody2D
@onready var label: Label = $Label
@onready var balão_de_fala: Sprite2D = $BalãoDeFala
func _ready() -> void:
	balão_de_fala.visible = false
func fala( texto: String) :
	if not balão_de_fala.visible :
		balão_de_fala.visible = true
	label.text = texto
		
