package;

import Controls.Control;
import sys.FileSystem;
import sys.io.File;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class ResultSubState extends MusicBeatSubstate 
{
	var pauseMusic:FlxSound;
	
	var rank:FlxSprite = new FlxSprite(-200, 730);
	var ranking:String = "A+";
	
	public function new(x:Float, y:Float)
	{
		super();
		
		pauseMusic = new FlxSound().loadEmbedded(Paths.music('breakfast'), true, true);
		pauseMusic.volume = 0;
		pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));

		FlxG.sound.list.add(pauseMusic);
		
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);
		
		rank = new FlxSprite(-20, 40).loadGraphic(Paths.image('rankings/' + Ratings.GenerateLetterRank(PlayState.accuracy, true)));
		rank.scrollFactor.set();
		add(rank);
		rank.antialiasing = true;
		rank.setGraphicSize(0, 450);
		rank.updateHitbox();
		rank.screenCenter();
		
		var press:FlxText = new FlxText(20, 15, 0, "Press ANY to continue.", 32);
		press.scrollFactor.set();
		press.setFormat(Paths.font("vcr.ttf"), 32);
		press.setBorderStyle(OUTLINE, 0xFF000000, 5, 1);
		press.updateHitbox();
		add(press);
		
		FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
		
		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
		
		if (PlayState.SONG.validScore)
		{
			#if !switch
			PlayState.misses = 0;
			PlayState.sicks = 0;
			PlayState.goods = 0;
			PlayState.bads = 0;
			PlayState.shits = 0;
			PlayState.accuracy = 0.00;
			#end
		}
		
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.ANY)
		{
			PlayState.isStoryMode = true;
			PlayState.storyDifficulty = PlayState.storyDifficulty;
			if (PlayState.storyPlaylist.length <= 0 && PlayState.isStoryMode == true)
			{	FlxG.sound.playMusic(Paths.music('freakyMenu'));
				FlxG.switchState(new StoryMenuState());
			} else if (PlayState.storyPlaylist.length > 0 && PlayState.isStoryMode == true)
			{	LoadingState.loadAndSwitchState(new PlayState()); }
			
			// Freeplay Mode
			if (PlayState.isStoryMode == false)
			{	FlxG.sound.playMusic(Paths.music('freakyMenu'));
				FlxG.switchState(new FreeplayState());
			}
			
		}
	}
	
}