extends CharacterBody2D
@onready var area_2d: Area2D = $Area2D
@onready var pegar_timer: Timer = $pegar_timer
@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var SpriteInventario = get_parent().get_node("SpriteInventario") 
@onready var label = get_parent().get_node("Nome") 

var ItemGuardadoCena
var ItemGuardadoSprite
var ItemGuardadoIdade
var ItemGuardadoNome
var guardado  = false
var viajando = false
var direction
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
func _ready() -> void:
	animated_sprite_2d_2.position.x = -47
	area_2d.position.x=-47
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not viajando :
		if not is_on_floor():
			velocity += get_gravity() * delta
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
			animated_sprite_2d_2.position.x = 47*direction
			area_2d.position.x=47*direction
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		move_and_slide()
		if Input.is_action_pressed("pegar") and not guardado :
			pegar()
		if Input.is_action_pressed("instanciar") and guardado :
			instanciar()
		if Input.is_action_just_pressed("futuro") :
			get_parent().futuro()
			viajando = true
		if Input.is_action_just_pressed("passado") :
			get_parent().passado()
			viajando = true
func pegar() :
	pegar_timer.start()	
	area_2d.monitoring = true
	animated_sprite_2d_2.visible = true
	

func _on_pegar_timer_timeout() -> void:
	area_2d.monitoring = false
	animated_sprite_2d_2.visible = false
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.pegavel :
		ItemGuardadoCena = body.Cena
		ItemGuardadoIdade = body.Idade
		ItemGuardadoNome = body.Nome
		ItemGuardadoSprite = body.Sprite
		body.queue_free()
		SpriteInventario.texture = ItemGuardadoSprite
		label.text = ItemGuardadoNome
		guardado= true
func instanciar() :
	var obejto = load(ItemGuardadoCena).instantiate()
	obejto.global_position = global_position
	obejto.global_position.x += 50*direction
	obejto.Idade =ItemGuardadoIdade
	get_tree().root.get_child(0).add_child(obejto)
	SpriteInventario.texture = null
	label.text = "Nada"
	guardado = false
