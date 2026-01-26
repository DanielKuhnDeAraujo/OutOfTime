extends RigidBody2D
@onready var col_parreira: CollisionShape2D = $Col_parreira
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var col_semente: CollisionShape2D = $Col_semente
var player 
var Idade = -10 
var Sprite
var Cena = "res://secenes/parreira.tscn"
var Nome = "Semente"
var pegavel = false
var uva =true
var Suva
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().get_node("Player")
	preload_resources()
func preload_resources() :
	Suva = preload("res://assets/uvaicon.png")
func futuro() :
	Idade += 10
	checar_idade()
	get_parent().viajantes-=1
func passado() :
	Idade -= 10
	checar_idade()
	get_parent().viajantes-=1
func checar_idade() :
	if Idade < 0 :
		animated_sprite_2d.play("sementeidle")
		col_parreira.disabled= true
		col_semente.disabled = false
	if Idade >=0 :
		animated_sprite_2d.play("parreira_idle")
		col_parreira.disabled= false
		col_semente.disabled = true
		if !uva :
			uva =true
		elif uva : 
			uva = false
	if uva :
		animated_sprite_2d.play("parreirauva_idle")
		
@warning_ignore("unused_parameter")
func interagir(cena ,idade, nome ,sprite) :
	if Idade > 0  && uva :
		print("pegou uva")
		checar_idade()
		player.ItemGuardadoCena = "subcenauva"
		player.ItemGuardadoIdade = 0
		player.ItemGuardadoNome = "Uva"
		player.ItemGuardadoSprite = Suva
		player.SpriteInventario.texture = player.ItemGuardadoSprite
		player.label.text = player.ItemGuardadoNome
		player.guardado= true
		get_parent().finale(player.ItemGuardadoCena,player.ItemGuardadoIdade,player.ItemGuardadoNome,player.ItemGuardadoSprite)
