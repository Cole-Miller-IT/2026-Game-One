extends Control

@export var loadScene: PackedScene
@export var splashScreen: TextureRect
var inTime: float = 0.5
var fadeInTime: float = 1.5
var pauseTime: float = 1.5
var fadeOutTime: float = 1.5
var outTime: float = 0.5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade()

# Creates a simple fade in, pause, then fade out effect.
func fade() -> void: 
	splashScreen.modulate.a = 0.0 # Start with the texture hidden
	
	var tween = self.create_tween()
	tween.tween_interval(inTime)
	tween.tween_property(splashScreen, "modulate:a", 1.0, fadeInTime)
	tween.tween_interval(pauseTime)
	tween.tween_property(splashScreen, "modulate:a", 0.0, fadeOutTime)
	tween.tween_interval(outTime)
	await tween.finished
	
	get_tree().change_scene_to_packed(loadScene)
	
