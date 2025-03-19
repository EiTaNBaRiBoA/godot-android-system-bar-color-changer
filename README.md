<p align="center">
   <img width="200" src="SystemBarColorChanger/icon.png?raw=true" alt="plugin icon">
</p>

# Android System Bar Color Changer [![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/syntaxerror247)

This Plugin enables to dynamically change the system bar colors (status bar and navigation bar) of your godot android app.

## Installation
Steps:
- download latest release from Github [releases](https://github.com/syntaxerror247/godot-android-system-bar-color-changer/releases).
- unzip the release archive.
- copy addon to your Godot project's root directory.
- enable the plugin via the `Plugins` tab of `Project->Project Settings...` menu, in the Godot Editor.

## How to use
1. Make the system bar visible
   - Disable `immersive_mode` in the Android export settings, **or**
   - Use [`window_set_mode`](https://docs.godotengine.org/en/stable/classes/class_displayserver.html#class-displayserver-method-window-set-mode) to toggle it at runtime.

3. Call the required methods anywhere in your project:
   - To change status bar color
   ```
     SystemBarColorChanger.set_status_bar_color(color)
   ```
   - To change navigation bar color
   ```
     SystemBarColorChanger.set_navigation_bar_color(color)
   ```
   - To enable translucent system bars
   ```
      SystemBarColorChanger.set_translucent_system_bars(true)
   ```
   - To disable translucent system bars
   ```
      SystemBarColorChanger.set_translucent_system_bars(false)
   ```

---
## Demo Project
***You can try this plugin using demo project: [Demo Project](demo)***

https://github.com/user-attachments/assets/7e87834b-de21-4dec-9b8a-60a2d0b95beb

## Credits
**Developed By: Anish [syntaxerror247](https://github.com/syntaxerror247)**
