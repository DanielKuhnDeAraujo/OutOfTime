extends StaticBody2D
@onready var sprite_2d: Sprite2D = $Sprite2D
# informações pro player
var Idade =0 
var Sprite
var Cena = "res://secenes/quadrado.tscn"
var Nome = "Bola"
var pegavel = true

var passado 
var presente 
var futuro

func preload_resources() :
	passado= preload("res://assets/bolabranca.png")
	presente= preload("res://assets/bolacinza.png")
	futuro= preload("res://assets/bolapreta.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	preload_resources()
	sprite_2d.texture = passado
	Sprite = passado


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
