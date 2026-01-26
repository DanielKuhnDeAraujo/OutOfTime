extends Node2D

var filhos
@onready var placeholderback: Sprite2D = $Placeholderback
@onready var back_2_place: Sprite2D = $Back2Place
@onready var rei: AnimatableBody2D = $rei
@onready var tempo: Label = $tempo
@onready var cena_1: Marker2D = $cena1
var viajantes
var viajando:bool = false 
var viagem = false
var cena = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if viajando :
		if viajantes == 0 :
			get_node("Player").viajando = false
			viajando = false
			
	if viagem :
		if placeholderback.modulate.a > 0 :
			placeholderback.modulate.a -= 0.3*delta
		if back_2_place.modulate.a < 1 :
			back_2_place.modulate.a += 0.3*delta
		else :
			viagem =false
	match cena :
		1:
			rei.position = rei.position.move_toward(cena_1.position, 100 * delta)
		
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
	viagem =true
	tempo.queue_free()
	cena = 1
	
