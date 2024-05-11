extends CharacterBody2D

var SPEED = 400.0
var Start = 0
var x = -1
var y = 1
var xAndy = 1

@onready var ScoreP1 = $"../HBoxContainer/Score_P1"
var numberP1 = 0
@onready var ScoreP2 = $"../HBoxContainer/Score_P2"
var numberP2 = 0

@onready var colorBallP1 = preload("res://Aseprite/Save/Sprite-0006.aseprite")
@onready var colorBallP2 = preload("res://Aseprite/Save/Sprite-0005.aseprite")
@onready var colorBallDefault = preload("res://Aseprite/Save/Sprite-0003.png")
@onready var sprite = $Sprite2D

@onready var P1 = $"../Player"
@onready var P2 = $"../Player2"

@onready var timer = $"../Timer"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
		BallMovement()
		ScoreP1.text = str(numberP1)
		ScoreP2.text = str(numberP2)


func BallMovement():
	velocity.x = x * SPEED
	velocity.y = y * SPEED
	move_and_slide()

func _on_butp_2_body_entered(body):
	position = Vector2(576,268)
	numberP1 = numberP1 + 1
	sprite.texture = colorBallDefault
	SPEED = 400.0



func _on_but_pun_body_entered(body):
	position = Vector2(576,268)
	numberP2 = numberP2 + 1
	sprite.texture = colorBallDefault
	SPEED = 400.0


func _on_area_bas_body_entered(body):
	y = -1


func _on_area_haut_body_entered(body):
	y = 1


func _on_area_p_1_body_entered(body):
	x = 1
	sprite.texture = colorBallP1
	SPEED += 50.0



func _on_area_p_2_body_entered(body):
	x = -1
	sprite.texture = colorBallP2
	SPEED += 50.0





func _on_timer_timeout():
	add_child($".")
