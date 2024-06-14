extends Node2D

var expressao = 0
onready var rostos = self.get_children()

func _ready() -> void:
	pass
	
func _process(delta):
	# Para mudar a expressao da sprite (alterando o alpha da imagem)
	for i in range(len(rostos)):
		var rosto = rostos[i];
		var myValue = int(expressao == i);
		rosto.modulate.a = move_toward(rosto.modulate.a, myValue, 0.168);
