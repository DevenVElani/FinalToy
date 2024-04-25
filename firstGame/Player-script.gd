extends CharacterBody2D
var walkspeed = 350
var jump_speed = -1250
var gravity = 2500
var hasJumpedOnce = false
var noMoreJump = false
var landed = true
@onready
var jumpsound: = $jumpsound
@onready
var landingsound = $landingSound 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func getinput():
	if Input.is_action_pressed("ui left"):
		velocity.x = -walkspeed
	elif Input.is_action_pressed("ui right"):
		velocity.x = walkspeed
	else:
		velocity.x = 0
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y = jump_speed
		hasJumpedOnce = true
		noMoreJump = false
		jumpsound.play()
		landed = false
	elif Input.is_action_just_pressed("jump") and noMoreJump != true:
		velocity.y = jump_speed
		noMoreJump = true
		jumpsound.play
func didland():
	if landed == false and velocity.y == 0 and is_on_floor():
		landingsound.play()
		landed = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	didland()
	velocity.y += gravity*delta
	getinput()
	move_and_slide()
