extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game
signal pause
signal mute
signal unmute
signal home

@export var menu_button : MenuButton
var popup_menu: PopupMenu
var muted = false

func _ready():
	popup_menu = menu_button.get_popup()
	$HowTo.hide()
	
func _on_menu_item_selected(id: int):
	if id == 0:
		home.emit()
	elif id == 1:
		how_to()
	elif id == 2:
		if muted == false:
			muted = true
			mute.emit()
		elif muted == true:
			muted = false
			unmute.emit()

func show_message(text, wait_time):
	$Message.text = text
	$Message.show()
	$MessageTimer.wait_time = wait_time
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over", 2)
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout
	# ask if they want to play again
	$Message.text = "Play again?"
	$Message.show()
	$StartButton.show()
	# Make a one-shot timer and wait for it to finish.
	#await get_tree().create_timer(1.0).timeout
	#$StartButton.show()
	
func show_win_lose(message):
	show_message(message, 2)
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout
	
	if message == "Game Over":
		$Message.text = "Play again?"
	else:
		$Message.text = "Dodge the Ricks!"
	$Message.show()
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	
func update_lives(lives):
	$LivesLabel.text = "Lives: " + str(lives)
	
func update_level(level):
	$LevelLabel.text = "Level: " + str(level)
	
func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()


func _on_menu_button_button_down() -> void:
	pause.emit()

func _on_menu_button_pressed() -> void:
	$MenuButton/PopupMenu.visible = true

func how_to():
	$Message.hide()
	$HowTo.show()
