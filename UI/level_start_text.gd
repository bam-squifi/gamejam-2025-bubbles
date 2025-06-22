extends Node

var timer_not_started = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if %"Go!".visible and timer_not_started:
		$GoTimer.start()
		timer_not_started = false
		
func _on_go_timer_timeout() -> void:
	$"%Go!".visible = false
	print("go")
