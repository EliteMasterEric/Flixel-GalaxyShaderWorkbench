# GalaxyShader-001-Base.exe
- **hxcpp**: haxelib `4.2.1`
- **hxcpp-debug-server**: haxelib `1.2.4`
- **lime**: haxelib `8.0.0`
- **openfl**: haxelib `9.2.0`
- **flixel**: haxelib `5.0.2`
- Shader extends FlxShader and provides fragment source via annotation
- I don't think a version is specified in this version

# GalaxyShader-002-UpdateOpenFL.exe
## Changes
- **openfl**: git `MasterEric/openfl bugfix/shader-fixes`
- **flixel**: git `MasterEric/flixel bugfix/glsl-300-shader`
- Fixes and improvement to GraphicsShader used
- Used default glVersion (`100` on desktop)

# GalaxyShader-003-ForceGLSL-100.exe
- Specifically specified `#version 100`
Other similarly named ForceGLSL builds are simply using different GLSL versions.
NOTE: `321` is a control, it should display an "unsupported version" error on ALL computers.