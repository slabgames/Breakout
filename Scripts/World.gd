extends Node2D


var score = 0 setget set_score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_score(val):
	score = val
	get_node("Score").text = "Score : " + str(score)
	
func get_score()->int:
	return score


func _on_Ball_brick_hit():
	self.score += 5
