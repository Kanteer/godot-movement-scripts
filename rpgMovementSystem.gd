#extends Player

const VELOCITY = 100
const ACCELERATION = 100
const FRICTION = 100

enum {
  MOVE,
  ATTACK,
  ROLL
}

var state = MOVE
var velocity = Vector2.ZERO

#onready var animationPlayer = $AnimationPlayer
#onready var animationTree = $AnimationTree
#onready var animationState = animationTree.get("parameters/playback")

#func _ready():
  animationTree.active = true

func _process(delta):
  Input.on_key_just_pressed("ui_down") - Input.on_key_just_pressed("ui_up")
  Input.on_key_just_pressed("ui_left") - Input.on_key_just_pressed("ui_right")

