# MIT License
#
# Copyright (c) 2024-present Anish Mishra (syntaxerror247)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

@tool
extends Node

const _plugin_name: String = "SystemBarColorChanger"

var android_runtime: Object

func _ready() -> void:
	if Engine.has_singleton("AndroidRuntime"):
		android_runtime = Engine.get_singleton("AndroidRuntime")
	else:
		print_verbose("%s plugin not initialized. It is only available on Android devices." % _plugin_name)


func set_system_bar_color(color: Color) -> void:
	if not android_runtime:
		return
	
	var activity = android_runtime.getActivity()
	var callable = func ():
		activity.getWindow().getDecorView().setBackgroundColor(color.to_argb32())
		activity.getGodot().setSystemBarsAppearance()
	
	activity.runOnUiThread(android_runtime.createRunnableFromGodotCallable(callable))


func set_translucent_system_bars(translucent = true) -> void:
	if not android_runtime:
		printerr("%s plugin not initialized!" % _plugin_name)
		return
	
	var activity = android_runtime.getActivity()
	var godot = activity.getGodot()
	var callable = func ():
		godot.enableEdgeToEdge(translucent)
	
	activity.runOnUiThread(android_runtime.createRunnableFromGodotCallable(callable))
