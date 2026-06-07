extends CharacterBody3D


const SPEED = 5.0

var player: Node3D = null

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player") as Node3D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if player:
		var target_pos = player.global_position
		target_pos.y = global_position.y
		if global_position.distance_to(target_pos) > 0.1:
			look_at(target_pos, Vector3.UP)
		var direction = (target_pos - global_position).normalized()
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	

	move_and_slide()
