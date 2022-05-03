package;
import sys.io.File;
import sys.FileSystem;
using StringTools;
import cpp.NativeFile;

typedef WeekFile = {
  var songs:Array<String>; // used on FreeplayState.hx and StorymenuState.hx
  var fpchars:Array<String>; // the icon of freeplay
  // week shit
  var weekchars:Array<String>; // used on StorymenuState.hx
  var weekFile:String; // WeekFile
  var weekBackground:String;
  var startUnlocked:Bool;
  var weekName:String;
}

class WeekShit {

  public static var orden:String = 'tutorial\nweek 1';
  public static var ordenSplitted:Array<String>;
  public static var songs:Array<Dynamic>;
  public static var fpchars:Array<Dynamic>;
  public static var weekchars:Array<Dynamic>;
  public static var weekFile:Array<String>;
  public static var weekBackground:Array<String>;
  public static var startUnlocked:Array<Bool>;
  public static var weekName:Array<String>;
  public static var weekBefore:Array<String>;
  public static function start(){
  
  songs = [];
  fpchars = [];
  fpchars = [];
  weekchars = [];
  weekFile = [];
  weekBackground = [];
  startUnlocked = [];
  weekName = [];
  weekBefore = [];
  
    ordenSplitted = CoolUtil.coolTextFile("assets/weeks/weekList.txt");
    for (i in 0...ordenSplitted.length){
      var s:WeekFile = haxe.Json.parse(sys.io.File.getContent("assets/weeks/" + ordenSplitted[i] + '.json'));
        songs.push(s.songs);
        fpchars.push(s.fpchars);
        weekchars.push(s.weekchars);
        weekFile.push(s.weekFile);
        weekBackground.push(s.weekBackground);
        startUnlocked.push(s.startUnlocked);
        weekName.push(s.weekName);
        if (ordenSplitted[i -1] != null)
            weekBefore.push(ordenSplitted[i -1]);
        else
            weekBefore.push(ordenSplitted[i]);
    }
      
  }
} 
