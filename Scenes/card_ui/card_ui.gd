class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)

@onready var color: ColorRect = $Color
@onready var state: Label = $State
@onready var drop_point_detector = $DropPointDetector
@onready var cardStateMachine: CardStateMachine = $CardStateMachine as CardStateMachine

func _ready() -> void:
	cardStateMachine.init(self)

func _input(event: InputEvent) -> void:
	cardStateMachine.on_input(event)

func _on_gui_input(event: InputEvent) -> void:
	cardStateMachine.on_gui_input(event)

func _on_mouse_entered() -> void:
	cardStateMachine.on_mouse_entered()

func _on_mouse_exited() -> void:
	cardStateMachine.on_mouse_exited()
