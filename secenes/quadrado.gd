extends StaticBody2D
@onready var sprite_2d: Sprite2D = $Sprite2D
# informações pro player
var Idade =0 
var Sprite
var Cena = "res://secenes/quadrado.tscn"
var Nome = "Bola"
var pegavel = true

var Spassado 
var Spresente 
var Sfuturo

func preload_resources() :
	Spassado= preload("res://assets/bolabranca.png")
	Spresente= preload("res://assets/bolacinza.png")
	Sfuturo= preload("res://assets/bolapreta.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	preload_resources()
	checar_idade()
func futuro() :
	Idade += 10
	checar_idade()
	get_parent().viajantes-=1
func passado() :
	Idade -= 10
	checar_idade()
	get_parent().viajantes-=1
func checar_idade() :
	Nome= "Bola de "+ str(Idade)+ " anos."
	if Idade < 0 :
		sprite_2d.texture = Spassado
		Sprite = Spassado
	if Idade == 0 :
		sprite_2d.texture = Spresente
		Sprite = Spresente
	if Idade > 0 :
		sprite_2d.texture = Sfuturo
		Sprite = Sfuturo
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
