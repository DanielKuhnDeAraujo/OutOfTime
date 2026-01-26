extends Node2D

var filhos
@onready var placeholderback: Sprite2D = $Placeholderback
@onready var back_2_place: Sprite2D = $Back2Place
@onready var rei: AnimatableBody2D = $rei
@onready var tempo: Label = $tempo
@onready var cena_1: Marker2D = $cena1
@onready var fala_timer: Timer = $"fala timer"
@onready var transição: Sprite2D = $Transição
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
			if rei.position== cena_1.position :
				rei.fala("Welcome to the Far Realm. You've\ntravel to our dimension,a dimension \nout of time")
				fala_timer.start()
				cena=2
				
		3 :
			rei.fala("I will teach you how to properly \ntravel time, but when you go back to\nyour time, you will have to do some\njobs for us")
			fala_timer.start()
			cena = 4
		5:
			rei.fala("First things first let me transport\nus to another place")
			fala_timer.start()
			cena = 6
		7:
			if transição.modulate.a < 1 :
				transição.modulate.a += 0.25*delta
			else :
				get_tree().change_scene_to_file("res://secenes/tutoras2.tscn")
			
			
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
	


func _on_fala_timer_timeout() -> void:
	match cena:
		2 :
			cena = 3
		4: 
			cena =5
		6: 
			cena =7
