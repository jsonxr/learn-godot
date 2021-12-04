extends KinematicBody

const RADIUS = 1.0
const SPEED = 7.0 #/ (2 * PI) # m/s
var velocity = Vector3(0,0,0)

var FPS = ProjectSettings.get_setting('physics/common/physics_fps')
var ROTSPEED = 1.0 * (SPEED / FPS) / RADIUS

func _ready():
	#FPS = ProjectSettings.get_setting('physics/common/physics_fps')
	FPS = ProjectSettings.get_setting('physics/common/physics_fps')
	ROTSPEED = 1.0 * SPEED / (FPS * RADIUS)
	print("SPEED=" + str(SPEED))
	print("FPS=" + str(FPS))
	print("RADIUS=" + str(RADIUS))
	print("ROTSPEED=" + str(ROTSPEED))
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(-ROTSPEED)
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(ROTSPEED)
	else:
		var speed = lerp(velocity.x, 0, 0.1)
		var rotspeed = 1.0 * speed / (FPS* RADIUS)
		velocity.x = speed
		$MeshInstance.rotate_z(-rotspeed)

	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(-ROTSPEED)
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(ROTSPEED)
	else:
		var speed = lerp(velocity.z, 0, 0.1)
		var rotspeed = 1.0 * speed / (FPS* RADIUS)
		velocity.z = speed
		$MeshInstance.rotate_x(rotspeed)
	
	move_and_slide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
