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
  #animationTree.active = true

#func _physics_process(delta):
  #match state:
    #MOVE:
      #move_state (delta)
    #ATTACK
      #attack_state (delta)
    #ROLL
      #roll_state (delta)
    
func move_state(delta):
  var input_vector = Vector2.ZERO
  input_vector.x = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
  input_vector.y = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
  input_vector = inout_vector.normalized()
  
  if input_vector !=Vector2.ZERO:
    #animationTree.set("parameters/Idle/blend_position", input_vector)
    #animationTree.set("parameters/Run/blend_position", input_vector)
    #animationState.travel("Run")
    velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
  else:
    #animationState.travel("Idle")
    velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
    
move_and_slide(velocity * delta)
