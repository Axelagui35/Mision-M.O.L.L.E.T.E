extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_roca = ["pequeño","mediano","grande"]


func _ready():
	$AnimatedSprite.animation = tipo_roca[randi() % tipo_roca.size()]
	
	if $AnimatedSprite.animation == "grande":
		$CollisionShape2D.scale.x = 1.5
		$CollisionShape2D.scale.y = 1.5
	elif $AnimatedSprite.animation == "mediano":
		$CollisionShape2D.scale.x = 1.5
		$CollisionShape2D.scale.y = 1.5


func _on_visibilidad_screen_exited():
	queue_free()
