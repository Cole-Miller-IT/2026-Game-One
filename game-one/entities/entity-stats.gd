class_name EntityStats
extends Resource

@export var health: float
@export var armour: float
@export var damage: float
@export var speed: float
@export var texture: Texture2D

# How to use:
# Define a new scene that will use this reasouce.
# Create a new resource (like EnemyOne.tres) using this EntityStats resource.
# Attach a script to that new resource using the inspector to add the custom paramters like health and texture.
# Add:   @export var stats: EntityStats       to the script for the new entity scene.
# Then use the new resource defined in the previous step to use the EnemyOne.tres resource.
# In the script use lines like:  currentHealth = stats.health to use the resources data for the current scene.
