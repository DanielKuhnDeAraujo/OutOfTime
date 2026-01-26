extends Node2D

var filhos
var viajantes
var viajando:bool = false 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if viajando :
		if viajantes == 0 :
			get_node("Player").viajando = false
			viajando = false
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
