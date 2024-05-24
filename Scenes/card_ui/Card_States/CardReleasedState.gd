extends CardState


func enter() -> void:
	cardUI.color.color = Color.DARK_MAGENTA
	cardUI.state.text = "RELEASED"
