extends Node2D

signal volteado(carta)
signal clicked(carta)

var esta_volteado : bool
var cara : String

onready var frontal = $carta_1
onready var cubierta = $Cubierta
onready var click = $clicked

func _ready():
	$Animacion.play("Cubrir")
	click.connect("clicked", self, "_on_clicked")

func poner_cara (f: String):
	cara = f
	
	frontal.texture = load("res://Imágenes Memorama/" + cara + ".jpg")

func flip():
	if esta_volteado: return

	$Animacion.play("Descubrir")
	esta_volteado = true
	emit_signal("volteado", self)

func reset():
	if !esta_volteado: return

	$Animacion.play("Cubrir")
	esta_volteado = false
	emit_signal("volteado", self)

func _on_clicked():
	emit_signal("clicked", self)
