extends Node

@export var mob_scene: PackedScene
var score
var lives
var level

func game_over():
	remove_mobs()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_win_lose("Game Over")

func new_game():
	level_up(0)


func _on_mob_timer_timeout() -> void:
	var x
	var y
	var mob_count = count_mobs()
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()
	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()
	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position
	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2
	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	# Choose the velocity for the mob.
	if level == 1:
		x = 50.0
		y = 100.0
	elif level == 2:
		x = 100.0
		y = 150.0
	elif level == 3:
		x = 150.0
		y = 200.0
	var velocity = Vector2(randf_range(x, y), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	# Spawn the mob by adding it to the Main scene.
	add_child(mob)

func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)
	check_level(level)


func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()

func _ready():
	pass

func update_lives():
	if lives > 0:
		lives -= 1
	$HUD.update_lives(lives)
	if lives < 1:
		$Player.hide() # Player disappears after being hit.
		# Must be deferred as we can't change physics properties on a physics callback.
		$Player/CollisionShape2D.set_deferred("disabled", true)
		game_over()
	else:
		pass
			
func remove_mobs():
	for child in get_children():
		if child is Mob:
			child.queue_free()

func count_mobs():
	var count:= 0
	for child in get_children():
		if child is Mob:
			count += 1
	return count

func check_level(curr_level):
	if curr_level == 1:
		if score == 5:
			level_up(curr_level)
	elif curr_level == 2:
		if score == 5:
			level_up(curr_level)
	elif curr_level == 3:
		if score == 5:
			win_game()

func level_up(curr_level):
	remove_mobs()
	$Player.start($StartPosition.position)
	$MobTimer.stop()
	$ScoreTimer.stop()
	score = 0
	lives = 3
	level = curr_level + 1
	$HUD.update_score(score)
	$HUD.update_lives(lives)
	$HUD.update_level(level)
	$HUD.show_message("Level " + str(level) +": Get Ready", 2)
	$StartTimer.start()
	
func win_game():
	remove_mobs()
	$StartTimer.stop()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_win_lose("You win!")
