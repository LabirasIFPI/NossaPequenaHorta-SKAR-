extends Node2D

var modo = 0
onready var estados = self.get_children()

func _ready() -> void:
	pass
	
func _process(delta):
	# Para mudar a expressao da sprite (alterando o alpha da imagem)
	for i in range(len(estados)):
		var estado = estados[i];
		var myValue = int(modo == i);
		estado.modulate.a = move_toward(estado.modulate.a, myValue, 0.168);
