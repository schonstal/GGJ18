import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxBitmapText;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import flixel.text.FlxText.FlxTextAlign;
import flixel.util.FlxSpriteUtil;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class MenuText extends FlxBitmapText {
  public function new(content:String, scale:Bool = true):Void {
#if html5
    var font = FlxBitmapFont.fromXNA(
      "assets/images/fonts/alphabetXNA-WebGL.png",
      "abcdefghijklmnopqrstuvwxyz? ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    );
#else
    var font = FlxBitmapFont.fromXNA(
      "assets/images/fonts/alphabetXNA.png",
      "abcdefghijklmnopqrstuvwxyz? ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      0xff33ff33
    );
#end

    super(font);

    color = 0xffe7f2f8;
    letterSpacing = -1;
    text = content;

    scrollFactor.x = scrollFactor.y = 0;
  }

  public override function update(elapsed:Float):Void {
    super.update(elapsed);
  }
}
