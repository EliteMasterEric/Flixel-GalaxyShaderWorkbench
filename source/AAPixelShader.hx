package;

import flixel.system.FlxAssets.FlxShader;

class AAPixelShader extends flixel.system.FlxAssets.FlxShader
{
	// @:glVersion("300 es")
	@:glExtensions([{name: "GL_OES_standard_derivatives", behavior: "require"}])
	@:glFragmentSource('
#pragma header

vec4 texture2DAA(sampler2D tex, vec2 uv) {
	vec2 texsize = openfl_TextureSize;
	vec2 uv_texspace = uv*texsize;
	vec2 seam = floor(uv_texspace+.5);
	uv_texspace = (uv_texspace-seam)/fwidth(uv_texspace)+seam;
	uv_texspace = clamp(uv_texspace, seam-.5, seam+.5);
	return texture2D(tex, uv_texspace/texsize);
}

void main()
{
	
	vec2 uv = openfl_TextureCoordv;
	vec2 fragCoord = uv * openfl_TextureSize;
	
	gl_FragColor = texture2DAA(bitmap, uv);
}')
	public function new()
	{
		super();

		var exts = openfl.Lib.application.window.context.webgl.getSupportedExtensions();
		lime.utils.Log.info('exts = $exts');
	}
}
