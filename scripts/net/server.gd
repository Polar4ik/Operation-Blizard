extends Node

var peer: ENetMultiplayerPeer
var port := 8888

var server_data := {}

func _ready() -> void:
	multiplayer.peer_connected.connect(peer_connect)
	multiplayer.peer_disconnected.connect(peer_disconnect)

func peer_connect(id: int) -> void:
	print("Peer connect: ", id)

func peer_disconnect(id: int) -> void:
	print("Peer disconnect: ", id)

func create_server() -> void:
	peer = ENetMultiplayerPeer.new()
	
	var error = peer.create_server(port)
	if error == OK:
		multiplayer.multiplayer_peer = peer
		set_multiplayer_authority(multiplayer.get_unique_id())
		print("Server created. Wait players")
	else:
		push_error("Server dont create: ", error)

@rpc("any_peer")
func add_info(id: int, nick: String) -> void:
	server_data[id] = {
		"nick": nick
	}
	print(server_data)
