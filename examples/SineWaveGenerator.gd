extends Node

# Sine Wave AudioStreamGenerator
# Attach to a Node, add an AudioStreamPlayer child named "AudioStreamPlayer"

@export var frequency: float = 440.0   # Hz (A4)
@export var amplitude: float = 0.5     # 0.0 - 1.0
@export var sample_rate: float = 44100.0

var playback: AudioStreamGeneratorPlayback
var phase: float = 0.0

func _ready() -> void:
	var stream := AudioStreamGenerator.new()
	stream.mix_rate = sample_rate
	stream.buffer_length = 0.1  # 100ms buffer

	$AudioStreamPlayer.stream = stream
	$AudioStreamPlayer.play()
	playback = $AudioStreamPlayer.get_stream_playback()


func _process(_delta: float) -> void:
	_fill_buffer()


func _fill_buffer() -> void:
	var frames_available := playback.get_frames_available()
	var phase_increment := TAU * frequency / sample_rate

	for i in frames_available:
		var sample := amplitude * sin(phase)
		playback.push_frame(Vector2(sample, sample))  # stereo (L, R)
		phase = fmod(phase + phase_increment, TAU)


# Call these at runtime to change the tone
func set_frequency(hz: float) -> void:
	frequency = hz

func set_amplitude(amp: float) -> void:
	amplitude = clamp(amp, 0.0, 1.0)
