package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var backgroundImage:FlxSprite;
	var nebulaShader:NebulaShader;
	var shaderVersionText:FlxText;

	public override function create()
	{
		super.create();

		writeDriverInfo();

		backgroundImage = new FlxSprite(0, 0);

		// Make the image solid pink, width and height of the screen.
		// We shouldn't see this since we're going to replace it with a shader.
		backgroundImage.makeGraphic(Std.int(FlxG.width), Std.int(FlxG.height), 0xFFFF00FF);

		// Create the shader.
		nebulaShader = new NebulaShader();

		// var aaPixelShader = new AAPixelShader();
		// var gradientShader = new GradientShader();

		// Set the shader on the image.
		backgroundImage.shader = nebulaShader;
		// backgroundImage.shader = aaPixelShader;
		// backgroundImage.shader = gradientShader;

		var textSize:Int = #if android 24 #else 8 #end;
		shaderVersionText = new FlxText(0, 0, FlxG.width, "", textSize);

		// Add the image to the state.
		add(backgroundImage);
		add(shaderVersionText);
	}

	function writeDriverInfo()
	{
		#if sys
		trace('System functions available.');

		trace('FlxG: ${FlxG}');
		if (FlxG == null)
		{
			trace('FlxG is null. Cannot log driver info.');
			return;
		}

		trace('FlxG.stage: ${FlxG.stage}');
		if (FlxG.stage == null)
		{
			trace('FlxG.stage is null. Cannot log driver info.');
			return;
		}

		trace('FlxG.stage.context3D: ${FlxG.stage.context3D}');
		if (FlxG.stage.context3D == null)
		{
			trace('FlxG.stage.context3D is null. Cannot log driver info.');
			return;
		}

		trace('FlxG.stage.context3D.driverInfo: ${FlxG.stage.context3D.driverInfo}');
		if (FlxG.stage.context3D.driverInfo == null)
		{
			trace('FlxG.stage.context3D.driverInfo is null. Cannot log driver info.');
			return;
		}

		trace('Logging driver info...');
		sys.io.File.saveContent('driverInfo.txt', FlxG.stage.context3D.driverInfo);
		#end
	}

	public override function update(elapsed:Float)
	{
		super.update(elapsed);

		// Update the shader.
		nebulaShader.update(elapsed);

		shaderVersionText.text = "Shader version: " + nebulaShader.glVersion;
		if (FlxG != null && FlxG.stage != null && FlxG.stage.context3D != null)
		{
			shaderVersionText.text += "\nDriver info: " + FlxG.stage.context3D.driverInfo;
		}
		else
		{
			shaderVersionText.text += "\nContext3D not available.";
		}

		#if !android
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.resetState();
		}
		#end
	}
}
