package;

import flixel.util.FlxSave;
import flixel.FlxCamera;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.group.FlxSpriteGroup;

class Reg {
  public static var enemyGroup:FlxSpriteGroup;

  public static var random:FlxRandom;

  public static var initialized:Bool = false;
  public static var started:Bool = false;
  public static var player:Player;
  public static var score:Int;

  public static var hardMode:Bool = false;

  public static var TAU:Float = 6.28318530718;
}
