package;

import flixel.system.FlxAssets.FlxShader;

class GradientShader extends FlxShader
{
	// On ShaderToy, [0,0] is the bottom left corner, but in Flixel, it's the top left corner.
	@:glVersion("460")
	@:glFragmentSource("#pragma header
void main() {
  vec2 uv = openfl_TextureCoordv.xy;
    
  // Flip vertically to match ShaderToy.
  uv.y = 1.0 - uv.y;

  vec3 gradientColor = vec3(uv.x, uv.y, -uv.x * uv.y);

  gl_FragColor = vec4(gradientColor, 1.0);
}", true)
	public function new()
	{
		super();
	}
}
