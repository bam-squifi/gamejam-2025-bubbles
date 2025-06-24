extends Node3D

var current = 0
var next = 0

func _ready() -> void:
	%Bullseye.visible = true
	current = randi() % 12
	
func hide_segment(seg_id: int) -> void:
	var mitte = %Bullseye.get_child(seg_id)
	var mitte_obj = mitte.get_child(0)
	mitte_obj.visible = false
	var mitte_static_body = mitte_obj.get_child(0)
	var mitte_collision_body = mitte_static_body.get_child(0)
	mitte_collision_body.disabled = true
	
func _on_timer_timeout() -> void:
	%Bullseye.get_child(current).position.y -= 1
	
func _on_new_tile_timer_timeout() -> void:
	# Ist noch sehr billig
	# TODO: Feld muss aus der letzte der Kinder genommen werden und dann an die randi() range übergeben werden
	# Timer wann das nächste Feld fällt. ;)
	# Starte erst wenn Groundplane Timer weg ist
	current = randi() % 11
