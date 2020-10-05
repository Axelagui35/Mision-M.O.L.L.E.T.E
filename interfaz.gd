extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$mensaje.text = texto
	$mensaje.show()
	$mensajetimer.start()
	
func game_over():
	mostrar_mensaje("Game Over")
	yield($mensajetimer,"timeout")
	$Button.show()
	$mensaje.text = ""
	$mensaje.show()

func update_score(puntos):
	$scorelabel.text = str(puntos)
	
	
	
	
	
	
	
	
	
	
	
	


func _on_mensajetimer_timeout():
	$mensaje.hide()


func _on_Button_pressed():
	$Button.hide()
	emit_signal("iniciar_juego")
