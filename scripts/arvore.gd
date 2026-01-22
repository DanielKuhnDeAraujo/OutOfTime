extends RigidBody2D

@onready var sprite_2d: Sprite2D = $Semente

var Idade = -10 
var Sprite
var Cena = "res://secenes/arvore.tscn"
var Nome = "Arvore"
var pegavel = true

var Spassado 
var Spresente 
var Sfuturo

# Called when the node enters the scene tree for the first time.
func preload_resources() :
	Spassado= preload("res://assets/Semente.png")
	Spresente= preload("res://assets/Broto.png")
	Sfuturo= preload("res://assets/Arvore.png")
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
	Nome= "Pau de "+ str(Idade)+ " anos."
	if Idade < 0 : #deixar vazio
		sprite_2d.texture = Spassado
		Sprite = Spassado
	if Idade == 0 :
		sprite_2d.texture = Spresente
		Sprite = Spresente
	if Idade > 0 :
		sprite_2d.texture = Sfuturo
		Sprite = Sfuturo
		$Col_Folhas.disabled = false
		
	else:
		pegavel = true
		$Col_Folhas.disabled = true
# Called every frame. 'delta' is the elapsed time since the previous frame.

	
