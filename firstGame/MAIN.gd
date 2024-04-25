extends Node2D
var didWin = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if didWin == true:
		$Camera2D.position.x = 2000
		$Camera2D.position.y = 2000
		$CharacterBody2D.position.y = 1221
		$CharacterBody2D.position.x = -172
	else:
		$Camera2D.position.y = $CharacterBody2D.position.y
		$Camera2D.position.x = 000


func _on_area_2d_body_entered(body):
	didWin = true


func _on_button_pressed():
	pass


func _on_button_button_down():
	didWin = false
