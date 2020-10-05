extends Node2D

var cantidad_carta: int = 12

onready var cartaPrefab = preload("res://Escenas/Carta.tscn")
onready var tiempo = $Tiempo

var carta_al_descubierto = null
var _cartas = []

var cantidad_actual = 6

func _ready():
	randomize()
	tiempo.connect("timeout", self, "tiempo_cumplido")
	cantidad_carta = 12
	init_game()

func init_game():
	cantidad_carta = cantidad_actual * 2

	var columnas : int = 4
	var filas : int = 3
	var ancho_fila : int = 190
	var ancho_carta : int = 170
	var fila_offset : int = (190-170)
	var margen_fila : int = 0 #si se aumentan las cartas salen más hacia la derecha
	var ultimo_margen_filas = 0

#Esto no afecta porque sabemos el número de filas y columnas:
	if cantidad_carta % columnas > 0:
		var ultima_fila_vacia = (columnas - (cantidad_carta % columnas))
		ultimo_margen_filas = (ultima_fila_vacia * ancho_fila) / 2

	var numero : Array = [1, 2, 3, 4, 5, 6]
	
	while numero.size() > cantidad_carta / 2:
		numero.remove(randi() % numero.size())

	var caras : Array = []
		
	for i in range(float(cantidad_carta / 2)):
		var cara : String = "carta_" + str(numero[i])
		caras.append(cara)
		caras.append(cara)
		
	var f2 : Array = []
	while caras.size():
		if f2.size() == 0:
			f2.append(caras[0])
		else:
			f2.insert(randi() % (f2.size() + 1), caras[0])
		caras.remove(0)
	caras = f2

	for i in range(cantidad_carta):
		var r = floor(i / columnas)
		var c = i % columnas
		var extra = 0
		if r == filas - 1:
			extra = ultimo_margen_filas

		var carta = cartaPrefab.instance()
		carta.add_to_group("carta")
		carta.global_position = Vector2(margen_fila + c * ancho_fila + extra, r  * ancho_fila)
		carta.scale = Vector2(ancho_carta / 170, ancho_carta / 170)
		self.add_child(carta)
		carta.poner_cara(caras[i])

		carta.connect("clicked", self, "_on_clicked_carta")
		carta.connect("volteado", self, "_on_card_flipped")
		
func _on_clicked_carta(carta):
	if !carta.esta_volteado:
		carta.flip()

func _on_card_flipped(carta):
	if carta.esta_volteado:
		if carta_al_descubierto == null:
			carta_al_descubierto = carta

		else:
			if carta_al_descubierto.cara == carta.cara:
				carta_al_descubierto == null

			else:
				_cartas.append(carta_al_descubierto)
				_cartas.append(carta)
				$Tiempo.start()
				carta_al_descubierto = null
				


