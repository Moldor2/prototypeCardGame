extends CardState


func enter() -> void:
	var uiLayer := get_tree().get_first_node_in_group("ui_layer")
	if uiLayer:
		cardUI.reparent(uiLayer)
	
	cardUI.color.color = Color.NAVY_BLUE
	cardUI.state.text = "DRAGGING"

func on_input(event: InputEvent) -> void:
	var mouseMotion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	var confirm = event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse")
	
	if mouseMotion:
		cardUI.global_position = cardUI.get_global_mouse_position() - cardUI.pivot_offset
	if cancel:
		transition_requested.emit(self, CardState.State.BASE)
	elif confirm:
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.RELEASED)
