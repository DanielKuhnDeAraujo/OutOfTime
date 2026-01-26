extends RigidBody2D

@onready var sprite_2d: Sprite2D = $Semente

#isso é so p ajustar a posicao
@onready var muda_pos: Marker2D = $Muda_pos
@onready var tree_pos: Marker2D = $Tree_pos
@onready var sem_pos: Marker2D = $Sem_pos

@onready var col_broto: CollisionShape2D = $Col_broto
@onready var col_semente: CollisionShape2D = $Col_semente

var Idade = -10 
var Sprite
var Cena = "res://secenes/arvoree.tscn"
var Nome = "Arvore"
var pegavel = true

var Spassado 
var Spresente 
var Sfuturo
var Smorta

# Called when the node enters the scene tree for the first time.
func preload_resources() :
	Spassado= preload("res://assets/Semente.png")
	Spresente= preload("res://assets/Muda.png")
	Sfuturo= preload("res://assets/Arvore.png")
	Smorta = preload("res://assets/Árvore morta.png")
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
		pegavel = true
		sprite_2d.position = muda_pos.position
		sprite_2d.texture = Spassado
		Sprite = Spassado
		col_semente.disabled = false
		set_collision_layer_value(3, false)
	else:
		rotation = 0
		set_collision_layer_value(3, true)
		
	if Idade == 0 :
		
		sprite_2d.scale = Vector2(1,1)
		rotation = 0
		pegavel = true
		sprite_2d.texture = Spresente 
		sprite_2d.position = muda_pos.position
		Sprite = Spresente
		$Col_Folhas.disabled = false
		col_broto.disabled = false
		
	else:
		col_broto.disabled = true
		
	if Idade > 0 and Idade < 40:
		$Col_Folhas.disabled = false
		sprite_2d.scale = Vector2(0.186, 0.186)
		
		pegavel = false
		sprite_2d.texture = Sfuturo
		Sprite = Sfuturo
		sprite_2d.position = tree_pos.position

		
		
	else:
		$Col_Folhas.disabled = true
		
	if Idade >= 40:
		sprite_2d.position = tree_pos.position
		pegavel = false
		sprite_2d.texture = Smorta
		sprite_2d.position = tree_pos.position
		Sprite = Smorta
		
# Called every frame. 'delta' is the elapsed time since the previous frame.

	
