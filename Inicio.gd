extends Control

func _on_creditos_pressed():
	get_tree().change_scene("res://Escenas/Creditos.tscn")
	pass # Replace with function body.


func _on_play_pressed():
	get_tree().change_scene("res://Escenas/Juegos.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.
