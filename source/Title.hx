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

import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;

class Title extends FlxEffectSprite {
  public var wave:FlxWaveEffect;

  public function new(text:String):Void {
    var title = createTitleText(text);
    super(title);

    scrollFactor.x = scrollFactor.y = 0;
    x = FlxG.width / 2 - title.width / 2;
    y = FlxG.height / 3 - title.height / 2;

    wave = new FlxWaveEffect(FlxWaveMode.ALL, 2, 0.5, 2, 10, FlxWaveDirection.VERTICAL);
    effects = [wave];
  }

  function createTitleText(text:String) {
    var font = FlxBitmapFont.fromXNA(
      "assets/images/fonts/alphabetXNA4x.png",
      "abcdefghijklmnopqrstuvwxyz? ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      0xff33ff33
    );

    var title = new FlxBitmapText(font);
    title.text = text;
    title.letterSpacing = -1;
    title.color = 0xffe7f2f8;

    return title;
  }
}
