# Flixel-GalaxyShader

A testing workspace for Flixel shader compatibility issues.

If a specific shader needs a feature introduced in a later language version, you can increase the language version, keeping in mind that most platforms have a very limited range of support (and your only solid choices are `100` and `300 es`). It is recommended that you rewrite the shader if you need a language feature unavailable in `100` or `300 es`.

Galaxy shader via [ShaderToy](https://www.shadertoy.com/view/lty3Rt).

![image](https://user-images.githubusercontent.com/4635334/205238297-769945ba-50a6-407e-81de-c88d4e671657.png)

## Compatibility test results

GLSL Version | Windows (NVIDIA)¹ | Linux² | Firefox³ | Chrome⁴ | Android⁵ | MacOS | Windows (AMD)
---|---|---|---|---|---|---|---
100† | ✅ | ✅ | ✅ | ✅ | ✅ | ? | ?
110 | ✅ | ✅ | ❌ | ❌ | ❌ | ? | ?
120 | ✅ | ✅ | ❌ | ❌ | ❌ | ? | ?
130 | ✅ | ✅ | ❌ | ❌ | ❌ | ? | ?
140 | ✅ | ✅ | ❌ | ❌ | ❌ | ? | ?
150 | ✅ | ✅ | ❌ | ❌ | ❌ | ? | ?
300 es† | ✅ | ✅ | ✅ | ✅ | ✅ | ? | ?
310 es† | ✅ | ✅ | ❌ | ❌ | ✅ | ? | ?
320 es† | ✅ | ✅ | ❌ | ❌ | ❌ | ? | ?
330 | ✅ | ? | ❌ | ❌ | ❌ | ? | ?
400 | ✅ | ? | ❌ | ❌ | ❌ | ? | ?
410 | ✅ | ? | ❌ | ❌ | ❌ | ? | ?
420 | ✅ | ? | ❌ | ❌ | ❌ | ? | ?
430 | ✅ | ? | ❌ | ❌ | ❌ | ? | ?
440 | ✅ | ? | ❌ | ❌ | ❌ | ? | ?
450 | ✅ | ? | ❌ | ❌ | ❌ | ? | ?
460 | ✅ | ✅ | ❌ | ❌ | ❌ | ? | ?
321†† | ❌ | ❌ | ❌ | ❌ | ❌ | ? | ?

✅ - Supported and tested
❌ - Error: `client/version number not supported`
? - Not Tested

¹ Windows 10, with an Nvidia GTX 1070 graphics card. Driver info: `OpenGL Vendor=NVIDIA Corporation Version=4.6.0 NVIDIA 517.48 Renderer=NVIDIA GeForce GTX 1070/PCIe/SSE2 GLSL=4.60 NVIDIA`  
² Manjaro Linux, with an Nvidia MX150 graphics chip. `OpenGL Vendor=Intel Vesrion=4.6 (Compatibility Profile) Mesa 22.1.7 Renderer=Mesa Intel(R) UHD Graphics 620 (KBL GT2) GLSL=4.60`  
³ Firefox v107.0.1 `OpenGL Vendor=Mozilla Version=WebGL 2.0 Renderer=ANGLE (NVIDIA, NVIDIA GeForce GTX 980 Direct3D11 vs_5_0 ps_5_0) GLSL=WebGL GLSL ES3.00`  
⁴ Chrome v107.0.5304.123 `OpenGL Vendor=WebKit Version=WebGL 2.0 (OpenGL ES 3.0 Chromium) Renderer = WebKit WebGL GLSL=WebGL GLSL ES 3.00 (OpenGL ES GLSL ES 3.0 Chromium)`  
⁵ Android 11 (Pixel 4a) via Android Studio emulator `OpenGL Vendor=Google (NVIDIA Corporation) Version.OpenGL ES 3.0 (4.5.0 NVIDIA 517.48) Renderer=Android Emulator OpenGL ES Translator (NVIDIA GeForce GTX 1070/PCIe/SSE2 GLSL=OpenGL ES GLSL ES 3.00`  

† `300`, `310`, `320` all mandate the use of the `es` profile, and `core` (the default) and `compatibility` are not supported. According to the docs, `100` is actually the reference of an `es` version as well.  
†† `321` is a control, it should display an "unsupported version" error on ALL computers. This is to ensure that the shader is not being reverted to a default version under the hood.

## Build Instructions

1. Install [Haxe](https://haxe.org/download/) and [Haxelib](https://lib.haxe.org/documentation/introduction/).
2. `haxelib install hmm`
3. `haxelib run hmm install`
4. `lime test windows` (add `-debug` for improved logging, or replace target platform as desired)
