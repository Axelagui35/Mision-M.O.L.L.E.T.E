extends Area2D

export (int) var velocidad
var movimiento = Vector2()
var limite
signal golpe

func _ready():
	hide()
	limite = get_viewport_rect().size



func _process(delta):
	movimiento=Vector2()
	if Input.is_action_pressed("ui_right"):
		movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):
		movimiento.y += 1
	if Input.is_action_pressed("ui_up"):
		movimiento.y -= 1
	if movimiento.length() > 0 : # verificar si se esta moviendo
		movimiento = movimiento.normalized() * velocidad
		
	position += movimiento * delta
	position.x = clamp(position.x,0,limite.x)
	position.y = clamp(position.y,0,limite.y)
	
	if movimiento.x != 0:
		$AnimatedSprite.animation = "Lado"
		$AnimatedSprite.flip_h = movimiento.x < 0
		$AnimatedSprite.flip_v = false
	elif movimiento.y != 0:
		$AnimatedSprite.animation = "Arriba"
		$AnimatedSprite.flip_v = movimiento.y < 0



# warning-ignore:unused_argument
func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true

func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
