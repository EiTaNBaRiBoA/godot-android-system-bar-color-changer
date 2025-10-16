extends Control


func _on_color_picker_button_color_changed(color: Color) -> void:
	$ColorRect.color = color
	SystemBarColorChanger.set_system_bar_color(color)

func _on_translucent_system_bars_toggled(toggled_on: bool) -> void:
	SystemBarColorChanger.set_translucent_system_bars(toggled_on)

func _on_set_system_color_pressed() -> void:
	SystemBarColorChanger.set_system_bar_color("004748")
