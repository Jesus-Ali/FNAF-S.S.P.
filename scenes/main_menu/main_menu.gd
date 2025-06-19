extends MarginContainer

@onready var flash = $static

func _ready():
	randomize()
	start_blinking()

func start_blinking():
	blink_loop()

func blink_loop():
	var delay = randf_range(0.2, 0.5)  # random wait between blinks
	await get_tree().create_timer(delay).timeout

	flash.visible = true
	var blink_duration = randf_range(0.2,1)
	await get_tree().create_timer(blink_duration).timeout  # duration of blink
	flash.visible = false

	blink_loop()  # repeat
