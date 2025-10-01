extends Node

@export var mob_scene: PackedScene
@export var pickle_scene: PackedScene
var score
var lives
var level
var garage = load("res://art/garage_background.webp")
var living_room = load("res://art/living_room.webp")
var portal = load("res://art/portal.webp")


func game_over():
	remove_mobs()
	remove_pickles()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$PickleTimer.stop()
	$BackgroundMusic.stop()
	$TextureRect.modulate = Color(0.324, 0.324, 0.324, 0.914)
	$HUD.show_win_lose("Game Over")

func new_game():
	$TextureRect.texture = garage
	$TextureRect.scale = Vector2(1.8, 1.8)
	$TextureRect.position = Vector2(-300, 70)
	level_up(0)
	$BackgroundMusic.play()
	$TextureRect.modulate = Color(0.324, 0.324, 0.324, 0.914)

func make_mob():
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
		#make_pickle(x, y)
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

func make_pickle():
	var x = 100.0
	var y = 150.0
	# Create a new instance of the Mob scene.
	var pickle = pickle_scene.instantiate()
	# Choose a random location on Path2D.
	var pickle_spawn_location = $PicklePath/PickleSpawnLocation
	pickle_spawn_location.progress_ratio = randf()
	
	# Set the mob's position to the random location.
	pickle.position = pickle_spawn_location.position
	# Set the mob's direction perpendicular to the path direction.
	var direction = pickle_spawn_location.rotation + PI / 2
	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	pickle.rotation = direction

	var velocity = Vector2(randf_range(x, y), 0.0)
	pickle.linear_velocity = velocity.rotated(direction)
	# Spawn the mob by adding it to the Main scene.
	add_child(pickle)


func _on_mob_timer_timeout() -> void:
	make_mob()
	
func _on_pickle_timer_timeout() -> void:
	if level >= 1:
		make_pickle()
		
func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)
	check_level(level)


func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
	$PickleTimer.start()
	$TextureRect.modulate = Color(1, 1, 1, 1)

func _ready():
	pass

func update_lives(change):
	if change == 0:
		lives += 1
		$HUD.update_lives(lives)
	elif change == 1:
		if lives > 0:
			lives -= 1
			$HUD.update_lives(lives)
		elif lives < 1:
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
			
func remove_pickles():
	for child in get_children():
		if child is Pickle:
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
			$TextureRect.texture = living_room
			$TextureRect.position = Vector2(-660, 70)
	elif curr_level == 2:
		if score == 6:
			level_up(curr_level)
			$TextureRect.texture = portal
			$TextureRect.scale = Vector2(.9, .9)
			$TextureRect.position = Vector2(-135, 70)
	elif curr_level == 3:
		if score == 7:
			win_game()

func level_up(curr_level):
	$TextureRect.modulate = Color(0.324, 0.324, 0.324, 0.914)
	remove_mobs()
	remove_pickles()
	$Player.start($StartPosition.position)
	$MobTimer.stop()
	$PickleTimer.stop()
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
	remove_pickles()
	$StartTimer.stop()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$PickleTimer.stop()
	$TextureRect.modulate = Color(0.324, 0.324, 0.324, 0.914)
	$HUD.show_win_lose("You win!")


func _on_player_hit() -> void:
	pass # Replace with function body.


func _on_player_health(extra_arg_0: bool) -> void:
	pass # Replace with function body.
