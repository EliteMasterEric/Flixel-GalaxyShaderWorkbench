package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxe.CallStack.StackItem;
import haxe.CallStack;
import haxe.io.Path;
import lime.app.Application;
import openfl.Assets;
import openfl.Lib;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.UncaughtErrorEvent;

class Main extends Sprite
{
	public function new()
	{
		super();

		#if sys
		openfl.Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onCrash);
		#end

		addChild(new FlxGame(0, 0, PlayState));
	}

	#if sys
	function onCrash(e:UncaughtErrorEvent):Void
	{
		var errMsg:String = "";
		var path:String;
		var callStack:Array<StackItem> = CallStack.exceptionStack(true);
		var dateNow:String = Date.now().toString();

		dateNow = StringTools.replace(dateNow, " ", "_");
		dateNow = StringTools.replace(dateNow, ":", "'");

		path = "crash/" + "FE_" + dateNow + ".txt";

		for (stackItem in callStack)
		{
			switch (stackItem)
			{
				case FilePos(s, file, line, column):
					errMsg += file + " (line " + line + ")\n";
				default:
					Sys.println(stackItem);
			}
		}

		errMsg += "\nUncaught Error: " + e.error + "\nPlease report this error to the GitHub page: https://github.com/Yoshubs/Forever-Engine";

		if (!sys.FileSystem.exists("crash/"))
			sys.FileSystem.createDirectory("crash/");

		sys.io.File.saveContent(path, errMsg + "\n");

		Sys.println(errMsg);
		Sys.println("Crash dump saved in " + Path.normalize(path));

		var crashDialoguePath:String = "FE-CrashDialog";

		#if windows
		crashDialoguePath += ".exe";
		#end

		if (sys.FileSystem.exists(crashDialoguePath))
		{
			Sys.println("Found crash dialog: " + crashDialoguePath);
			new sys.io.Process(crashDialoguePath, [path]);
		}
		else
		{
			Sys.println("No crash dialog found! Making a simple alert instead...");
			Application.current.window.alert(errMsg, "Error!");
		}

		Sys.exit(1);
	}
	#end
}
