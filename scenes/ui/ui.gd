extends CanvasLayer
class_name UI 

const MEDAL_BRONZE = preload("res://assets/ui/medal bronze.png")
const MEDAL_GOLD = preload("res://assets/ui/medal gold.png")
const MEDAL_SILVER = preload("res://assets/ui/medal silver.png")
@onready var medal_img: TextureRect = %MedalImg
@onready var current_score: Label = %CurrentScore
@onready var high_score: Label = %HighScore

@onready var score_label: Label = %ScoreLabel
@onready var start_menu: Control = %StartMenu
@onready var game_over_container: VBoxContainer = %GameOver

func _ready() -> void:
	score_label.text = "0"
	
func update_score(points: int) -> void:
	score_label.text = str(points) 

func game_over() -> void:
	game_over_container.show()
	score_label.hide()

func calculate_score(amount: int, high: int) -> void:
	current_score.text = str(amount)
	if amount >= 40:
		medal_img.texture = MEDAL_GOLD
	elif amount >= 20:
		medal_img.texture = MEDAL_SILVER
	else:
		medal_img.texture = MEDAL_BRONZE
	high_score.text = str(high)


func _on_ok_button_pressed() -> void:
	get_tree().reload_current_scene()
