extends Node

export (PackedScene) var roca
var score

func _ready():
	randomize()

func nuevo_juego():
	score = 0
	$Player.inicio($posiciondeinicio.position)
	$iniciotimer.start()
	$interfaz.mostrar_mensaje("Listo!")
	$interfaz.update_score(score)



func game_over():
	$scoretimer.stop()
	$rocatimer.stop()
	$interfaz.game_over()
	


func _on_iniciotimer_timeout():
	$rocatimer.start()
	$scoretimer.start()


func _on_scoretimer_timeout():
	score += 1
	$interfaz.update_score(score)


func _on_rocatimer_timeout():
	$camino/rocaposicion.set_offset(randi())
	
	var r = roca.instance()
	add_child(r)
	
	var d = $camino/rocaposicion.rotation
	
	r.position = $camino/rocaposicion.position
	
	d += rand_range(-PI/4, PI/4) 
	r.rotation = d
	r.set_linear_velocity(Vector2(rand_range(r.velocidad_min,r.velocidad_max),0).rotated(d))
	
	
	
	
	
	
