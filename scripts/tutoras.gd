extends Node2D

var filhos
@onready var placeholderback: Sprite2D = $Placeholderback
@onready var back_2_place: Sprite2D = $Back2Place
var viajantes
var viajando:bool = false 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cutscene1()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if viajando :
		if viajantes == 0 :
			get_node("Player").viajando = false
			viajando = false
	if placeholderback.modulate.a > 0 :
		placeholderback.modulate.a -= 0.2*delta
	if back_2_place.modulate.a < 1 :
		back_2_place.modulate.a += 0.2*delta
	
func futuro():
	viajando = true 
	viajantes =0
	filhos = get_children()
	for i in filhos :
		if i.has_method("futuro") :
			i.futuro()
			viajantes+=1
func passado():
	viajando = true 
	viajantes =0
	filhos = get_children()
	for i in filhos :
		if i.has_method("passado") :
			i.passado()
			viajantes+=1
	
@warning_ignore("unused_parameter")
func finale(cena ,idade, nome ,sprite) :
	pass
func cutscene1() :
	pass
