class_name CardStateMachine
extends Node

@export var initial_state: CardState

var currentState: CardState
var states := {}

func init(card: CardUI) -> void:
	for child in get_children():
		if child is CardState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.cardUI = card
	if initial_state:
		initial_state.enter()
		currentState = initial_state

func on_input(event: InputEvent) -> void:
	if currentState:
		currentState.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	if currentState:
		currentState.on_gui_input(event)

func on_mouse_entered() -> void:
	if currentState:
		currentState.on_mouse_entered()

func on_mouse_exited() -> void:
	if currentState:
		currentState.on_mouse_exited()

func _on_transition_requested(from: CardState, to: CardState.State) -> void:
	if from != currentState:
		return
	var new_state: CardState = states[to]
	if not new_state:
		return
	if currentState:
		currentState.exit()
	new_state.enter()
	currentState = new_state
