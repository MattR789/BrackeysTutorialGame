extends Node

var score = 0
@onready var scoreTracker = $"../Player/Score"

func add_point():
	score += 1
	print(score)
	scoreTracker.text = "Coins: " + str(score)
