extends Node

var port := 8888
var ip := "localhost"

var peer: ENetMultiplayerPeer

func _ready() -> void:
	multiplayer.connected_to_server.connect(connect_to_server)
	multiplayer.connection_failed.connect(connect_failed)

func connect_to_server() -> void:
	print("Connect to server")
	%Server.add_info.rpc_id(1, multiplayer.get_unique_id(), %Nick.text)

func connect_failed() -> void:
	print("Connect failed")

func create_client() -> void:
	peer = ENetMultiplayerPeer.new()
	
	var error = peer.create_client(ip, port)
	if error == OK:
		multiplayer.multiplayer_peer = peer
		set_multiplayer_authority(multiplayer.get_unique_id())
		print("Client created.")
	else:
		push_error("Client dont create: ", error)
