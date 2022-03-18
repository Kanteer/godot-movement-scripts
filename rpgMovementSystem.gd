#extends Player

var VELOCITY = 100
var ACCELERATION = 100
var FRICTION = 100

func _process(delta):
  Input.on_key_just_pressed("ui_down") - Input.on_key_just_pressed("ui_up")
  Input.on_key_just_pressed("ui_left") - Input.on_key_just_pressed("ui_right")

