class_name EnemyOne
extends CharacterBody2D

@export var stats: EntityStats

@onready var sprite: Sprite2D = $Sprite2D

var currentHealth: float

func _ready() -> void:
	# Use the specific Resource passed to initalize this enemies stats.
	currentHealth = stats.health
	sprite.texture = stats.texture
