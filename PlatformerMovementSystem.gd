class_name Player

signal player_position_changed(new_position)
signal player_death

onready var Physics2D: Node2D = $Physics2D

var previous_position: Vector2 = Vector2()

func _ready() -> void:
  $AnimationPlayer.connect('animation_finished', self, '_on_Animation_finished')
  $Heath.connect('take_damage', self, '_on_Getting_hit')
  $States/Death.connect('dead', self, '_on_Player_death')
  $CooldownTimer.connect('timeout', self, '_on_Cooldown_timeout')
  $CooldownBar.set_duration($CooldownTimer.wait_time)
  
  ._initialize_state()
  _initalize_interaction()
  
func _initalize_interaction():
  if get.tree().get_root().has_node(Game/World/Props'):
    for interaction in get_tree().get_root().has_node(Game/World/Props').get_children():
      if interaction is Interaction:
        interaction.connect('interaction', self, '_change_state')
        
func _physics_process(delta: float) -> void:
  current_state.update(self, delta)
  Physics2D.compute_gravity(self, delta)
  if previous_position != position:
    _on_position_changed()
