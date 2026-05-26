extends Control

# Tutorial on this: https://www.youtube.com/watch?v=QKAuacUG0y4&list=PLEHvj4yeNfeGiG6ZJXDymk5dYBAjCGiwe&index=7

@export var loadScene: PackedScene # What scene to move to after the splash screens.
@export var splashScreenContainer: Node
var splashScreens: Array

var inTime: float = 0.5
var fadeInTime: float = 1.5
var pauseTime: float = 1.5
var fadeOutTime: float = 1.5
var outTime: float = 0.5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_screens()
	fade()

# Creates a simple fade in, pause, then fade out effect.
func fade() -> void: 
	for screen in splashScreens:
		# Fade in, then out
		var tween = self.create_tween()
		tween.tween_interval(inTime)
		tween.tween_property(screen, "modulate:a", 1.0, fadeInTime)
		tween.tween_interval(pauseTime)
		tween.tween_property(screen, "modulate:a", 0.0, fadeOutTime)
		tween.tween_interval(outTime)
		await tween.finished
	
	get_tree().change_scene_to_packed(loadScene)
	
func get_screens() -> void:
	splashScreens = splashScreenContainer.get_children()
	for screen in splashScreens:
		screen.modulate.a = 0.0
		
# Skip screens and go straight to the next scene on any input event.
func _unhandled_input(event: InputEvent) -> void:
	if event.is_pressed():
		get_tree().change_scene_to_packed(loadScene)
