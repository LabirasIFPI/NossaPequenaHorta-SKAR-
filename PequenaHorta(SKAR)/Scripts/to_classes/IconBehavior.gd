extends Node2D
class_name Icone

var ALTURA = 500.0;
export var porcentagem = 0.3; # 0 - 1

func _ready():
	porcentagem = rand_range(0.0, 1.0);

func _process(delta):
	var _h = porcentagem * ALTURA;
	var _y = ALTURA - _h;
	$Fill.region_rect = Rect2(0, _y, 500, _h);
	$Fill.position.y = _y;
