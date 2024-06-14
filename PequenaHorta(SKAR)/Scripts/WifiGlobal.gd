extends Node


var txt = ""
var client
var connected: bool = false
var sinal = 0

var ip = "192.168.43.92"
var port = 80

var ledstate: int;

var gas = 0
var temp = 0
var umi = 0
var umi_solo = 0

#onready var debug =  get_parent().get_node("Cenário/DEBUG")
func _ready():
	tryToConnect()

# @TODO: para printar na tela main informações sobre a conexão
# tudo o que envolve debug foi comentado
#func debugar(_text):
#	if is_instance_valid(debug):
#		debug.text += _text + "\n"

func _process(_delta):
	
	var timeDict = OS.get_time();
	var seconds = timeDict.second;
	if !connected and seconds % 4 == 0:
		tryToConnect()
		
#	if seconds % 10 == 0:
#		if is_instance_valid(debug):
#			debug.text = "";
#	if udp_server.is_connected():
#		print("conectado aeeeee")
#		pass
		# Aqui você pode implementar a lógica de comunicação com o ESP
	
	if connected and not client.is_connected_to_host():
		connected = false
		print("saiu")
	else:
		_readWebSocket()


func tryToConnect():
#	debugar("Tentando conectar.")
#	print("Tentando conectar ao IP %s, na porta %s" % [ip, port])
	client = StreamPeerTCP.new()
#	client.set_no_delay(true)
	client.connect_to_host(ip, port)
	if(client.is_connected_to_host()):
		connected = true
#		debugar("Conexão realizada com sucesso.")
		print("Conexão com o disposito ESP realizada com sucesso!")
		print("IP: ", ip)
		print("Porta: ", port)

		
func _readWebSocket():
	while client.get_available_bytes()>0:
		var message = client.get_utf8_string(client.get_available_bytes())
		if message == null:
			continue
		elif message.length()>0:
			for i in message:
				if i =='\n':
					_messageInterpreter(txt)
#					print("Mensagem: " + txt)
					txt = ""
				else:
					txt += i
#
func _writeWebsocket(txt):
	if connected and client.is_connected_to_host():
		client.put_data(txt.to_ascii())
		

func _messageInterpreter(txt):
	# Formato da mensagem recebida:'30:20:100'
	var command = txt.split(':')
	if command.size() > 3:
		# Mensagem está incorreta.
		return
	else:
		temp = float(command[0])
		umi = float(command[1])
		umi_solo = float(command[2])
