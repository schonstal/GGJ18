package;

import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.math.FlxVector;
import flash.display.BlendMode;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.effects.chainable.FlxEffectSprite;

class TitleGroup extends FlxSpriteGroup {
  var title:Title;
  var clickToBegin:MenuText;

  public function new():Void {
    super();

    title = new Title("flag golf");
    add(title);

    clickToBegin = new MenuText("click to start");
    clickToBegin.scale.x = clickToBegin.scale.y = 2;
    clickToBegin.x = FlxG.width / 2 - clickToBegin.width / 2;
    clickToBegin.y = 2 * FlxG.height / 3 - clickToBegin.height / 2;
    add(clickToBegin);
  }

  public function startGame():Void {
    exists = false;
    title.exists = false;
    clickToBegin.exists = false;
  }
}
