extends Node2D

var turno = 0
onready var horarios = self.get_children()

func _ready() -> void:
	pass
	
func _process(delta):
	# Para mudar o fundo(alterando o alpha da imagem)
	for i in range(len(horarios)):
		var hora = horarios[i];
		var myValue = int(turno == i);
		hora.modulate.a = move_toward(hora.modulate.a, myValue, 0.168);
