package;

import Section.SwagSection;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import lime.system.System;
#if sys
import flixel.system.FlxSound;
#end
using StringTools;

class CreditsState extends MusicBeatState
{
	public static var currentSongList:Array<String> = [];
	public static var soundTest:Bool = false;
	var vocals:FlxSound;
	var contribut:Array<Array<String>> = [];

	var selector:FlxText;
	var curSelected:Int = 0;
	var usingCategoryScreen:Bool = false;
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;

	override function create()
	{
		contribut = [
		['Block Engine Team'],
		['UesleiDev', 			'uesleidev'],
		['Contornado', 			'contornado']
		];

		/*
			if (FlxG.sound.music != null)
			{
				if (!FlxG.sound.music.playing)
					FlxG.sound.playMusic('assets/music/freakyMenu' + TitleState.soundExt);
			}
		 */

		var isDebug:Bool = false;

		#if debug
		isDebug = true;
		#end

		// LOAD MUSIC

		// LOAD CHARACTERS
		var bg:FlxSprite = new FlxSprite().loadGraphic('assets/images/menuBGGreen.png');
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...contribut.length)
		{
			var optionText:Alphabet = new Alphabet(0, (70 * i) + 40, contribut[i][0], true, false);
			if (contribut[i][0] == 'Block Engine Team'){
				var optionText:Alphabet = new Alphabet(0, (70 * i) + 40, contribut[i][0], true, false);
				optionText.isMenuItem = true;
				optionText.screenCenter(X);
				optionText.targetY = i;
				optionText.x -= 40;
				grpOptions.add(optionText);
			}
			
			if(contribut[i][0] == ''){
				var optionText:Alphabet = new Alphabet(0, (70 * i) + 40, contribut[i][0], true, false);
				grpOptions.remove(optionText);
			}
			
			if (contribut[i][0] != 'Block Engine Team'){
				var optionText:Alphabet = new Alphabet(0, (70 * i) + 40, contribut[i][0], false, false);
				optionText.isMenuItem = true;
				optionText.screenCenter(X);
				optionText.targetY = i;
				optionText.x -= 40;
				grpOptions.add(optionText);
				
				if (contribut[i][1] != null)
				{
					var icon:AttachedSprite = new AttachedSprite(contribut[i][1]);
					icon.xAdd = optionText.width + 10;
					icon.sprTracker = optionText;
					add(icon);
				}
				
			}
		}

		changeSelection();
		
		var swag:Alphabet = new Alphabet(1, 0, "swag");

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);


		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var accepted = controls.ACCEPT;
		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}
		

		if (controls.BACK)
		{
			// main menu or else we are cursed
			FlxG.switchState(new MainMenuState());
				
		}

	}

	function changeSelection(change:Int = 0)
	{

		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = contribut.length - 1;
		if (curSelected >= contribut.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}