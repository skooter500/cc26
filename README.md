# Creative Coding for AI & Data Science 2026

```
Greetings fellow octopus
```

# Assessment
- End of year programming test 33%
- Weekly engagement mark 33%
- [Assignment 1 33% - Due 30/04/2026](assignment.md)

# Notes
- [Godot 2D & 3D Essentials](notes/godot%20intro.pdf)
- [GDScript Comprehensive](notes/gdscript.pdf)

# Resources
- [FOSSIKAL](https://github.com/skooter500/csresources/blob/main/foss_resources.md)
- [CSResources git repo](https://github.com/skooter500/csresources/blob/main/git_ref.pdf). Here you will find links to the previous courses and all my quick references
- [Git for poets](https://www.youtube.com/watch?v=BCQHnlnPusY)
- [Godot for beginners](https://www.youtube.com/watch?v=LOhfqjmasi0)
- [GDScript Tutorial](https://www.youtube.com/watch?v=e1zJS31tr88)
- [5 Games Made in Godot to inspire you each week](https://www.youtube.com/@stayathomedev) 

## Week 4 Lab - Creating Interactive Systems

- Download this repo to get the examples!

For this lab you will be creating three interactive systems. They start simple and get harder. See how far you can get and upload screenshots to Brightspace to get your mark for this week

### PhysicsPaint
Create a new scene and add a 2D Node as the root. Save the scene as PhysicsPaint. Add a script to the root. You can detect mouse movement by adding the following code:

```GDScript
func _input(event: InputEvent) -> void:	
	if event is InputEventMouseMotion:
		print(event.position.x)
		print(event.position.y)
```

- Add code so that colorful Boxes fall whenever the mouse moves over the viewport.
- Add sliders to the user interface to control the Hue, Saturation Brightness and Alpha of the generated Boxes so that their colors are not random.
- Add a Timer node on the Boxes so that they get deleted after 5 seconds so that the scene does not fill up 
- Experiment with changing the gravity settings!

### Theramin

Here are some videos for inspiration for this second part:

- https://www.youtube.com/watch?v=aJBDHxyLEHg

- https://www.youtube.com/watch?v=w5qf9O6c20o

- https://www.youtube.com/shorts/UcqyyAXy43w

Here is some code for a sine wave oscillator:

```GDScript
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
```

- Add this to a new scene. Use the mouse Y to control the frequency and the mouse X to control the amplitude. 
- Use a nested for loop to draw this:

![Sketch](images/p32.png)

- Have the parameters of the image change with the mouse - for example mouse changes the colors or sizes or numbers of circles
- Experiment with this line of code to generate different sounds. Add in additional Sin Waves to generate harmonics:

```GDScript
var sample := amplitude * sin(phase)
```

### Spiral Jam
Create this Spiral Generator:

- https://youtu.be/aZTHZGjHZzM

Take screenshots and videos of your creations and upload to Brightspace

## Week 3
- Scripting with GDScript
- Nodes for 2D
- RigidBodies
- Setting colors in code
- Spawning scenes from other scenes

### Lab - Drawing with Code

### Learning Outcomes
- Godot workflows
- Creatinve problem solving and analysis
- Creating a visual system from code
- Undetstanding the relationship between color and shapes and code
- For loop
- if statement
- Computational thinking

Use the functions in _draw() to create the following patterns:

![Sketch](images/p31.png)

![Sketch](images/p35.png)

![Sketch](images/p36.png)

![Sketch](images/p34.png)

![Sketch](images/p33.png)

![Sketch](images/p32.png)

![Sketch](images/p27.png)

![Sketch](images/p27.png)

![Sketch](images/p23.png)

![Sketch](images/p10.png)

![Sketch](images/p29.png)

Try these if statement exercises:

[![YouTube](http://img.youtube.com/vi/18kMOeygmHA/0.jpg)](https://www.youtube.com/watch?v=18kMOeygmHA)

Import some sprites and get them moving around!

Check out any of the Godot projects on [my github repo](http://github.com/skooter500) for ideas.

Take screenshots of whatever you create today and upload [this form](https://forms.office.com/Pages/ResponsePage.aspx?id=yxdjdkjpX06M7Nq8ji_V2ou3qmFXqEdGlmiD1Myl3gNURUwwN04xREJaSENNSlNDU1g2RDAyV09LUS4u)

- [Learn how to use bash and git](https://github.com/skooter500/csresources/blob/main/gitlab.md)


## Week 2 - Intro to Godot
- Godot 2D and 3D examples
- Godot 2D nodes
- Movement and rotation
- 2D Drawing primitives
- 2D Colors
- Using variables
- [Playlists of previous Godot projects](https://www.youtube.com/@skooter500/playlists)



We made a little interactive art think where you move the mouse. Open the project in Godot!
