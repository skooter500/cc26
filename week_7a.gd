extends Node2D

var size = 12

@export var font:Font

func change_instrument(channel, instrument):
	var midi_event = InputEventMIDI.new()
	midi_event.channel = 0
	midi_event.message = MIDI_MESSAGE_PROGRAM_CHANGE
	midi_event.instrument = instrument
	$MidiPlayer.receive_raw_midi_message(midi_event)
	

var last_note = -1
func _input(event: InputEvent) -> void:
	var vs = get_viewport_rect().size

	if event is InputEventMIDI:
		play_note(event.pitch, 1, 0)
		
	if event is InputEventMouseMotion:
		var r:int = remap(event.position.y, 0, vs.y, 0, size)
		var c:int = remap(event.position.x, 0, vs.x, 0, size)
	
		var note = (r * size) + c
		if note != last_note:
			if major:
				play_note(note, 2, 0)
				play_note(note + 3, 2, 0)
				play_note(note + 5, 2, 0)
			else:
				play_note(note, 2, 0)
				play_note(note + 4, 2, 0)
				play_note(note + 6, 2, 0)
			last_note = note

func _ready() -> void:
	
	var x = 10.0 / 17.0
	
	var sum = 0
	for i in range(17):
		sum += x
	change_instrument(0, 25)
	print(sum)
	OS.open_midi_inputs()
	
	pass
	
func play_note(note, duration, channel):
	
	note = note % 127
	
	var m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_ON
	m.pitch = note
	m.velocity = 100
	m.channel = channel		
	$MidiPlayer.receive_raw_midi_message(m)	
	await get_tree().create_timer(duration).timeout
	m = InputEventMIDI.new()
	m.message = MIDI_MESSAGE_NOTE_OFF
	m.pitch = note
	m.velocity = 100
	m.channel = channel		
	$MidiPlayer.receive_raw_midi_message(m)	
	
func _process(delta: float) -> void:
	queue_redraw()
	pass
	
func _draw() -> void:
	
	var vs = get_viewport_rect().size
	var box_size = vs.x / float(size)
	for r in size:
		for c in size:
			var x = remap(c, 0, size, 0, vs.x)
			var y = remap(r, 0, size, 0, vs.y)
			var col = (r + c) / float(size * 2)
			
			draw_rect(Rect2(x, y, box_size, box_size), 
			Color.from_hsv(col, 1, 1))
			draw_string(ThemeDB.fallback_font, Vector2(x + box_size * 0.1, y + box_size * 0.7), str(r) + "," + str(c), HORIZONTAL_ALIGNMENT_CENTER
			,0,18, Color.WHITE)
	pass

var major = false

func _on_check_box_toggled(toggled_on: bool) -> void:
	major = toggled_on
	pass # Replace with function body.
