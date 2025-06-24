extends Node3D

func _ready() -> void:
	%Bullseye.visible = true
	hide_segment(1)
	var fall_timer = Timer.new()
	
func _process(delta: float) -> void:
	%Bullseye.get_child(11).position.y -= 0.1
	
func hide_segment(seg_id: int) -> void:
	var mitte = %Bullseye.get_child(seg_id)
	var mitte_obj = mitte.get_child(0)
	mitte_obj.visible = false
	var mitte_static_body = mitte_obj.get_child(0)
	var mitte_collision_body = mitte_static_body.get_child(0)
	mitte_collision_body.disabled = true
	
