#extends Player

#Variables. Edit them to change how the character moves.
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

#State instances. These instances are what the character will do when a button is pressed, matching the states to make them more easier to manage and use later on in scripting.
func _physics_process(delta):
  match state:
    MOVE:
      move_state (delta)
    ATTACK:
      attack_state (delta)
    ROLL:
      roll_state (delta)

#This makes the character move.
func move_state(delta):
  var input_vector = Vector2.ZERO #This grabs the vectors for the value and makes the value equal to 0. What this does is that it makes sure your character doesn't move when there isn't any inputs.
  input_vector.x = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") #Checks the inputs and moves the character on the x axis.
  input_vector.y = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right") #Checks the inputs and moves the character on the y axis.
  input_vector = inout_vector.normalized() #This is self explanitory, it normalizes the values so you get only 0 or 1, nothing in between.
  
  if input_vector !=Vector2.ZERO: #If the input vector does not equal zero, then do this.
    #animationTree.set("parameters/Idle/blend_position", input_vector) #Sets the animation to Idle.
    #animationTree.set("parameters/Run/blend_position", input_vector) #Sets the animation to Run.
    #animationState.travel("Run") #Sets the state to Run.
    velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta) #Velocity is equal to the amount of velocity moving towards the direction.
  else:
    #animationState.travel("Idle")
    velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta) #Sets all velocity and movement back to 0.
    
move_and_slide(velocity * delta) #Collisions.
