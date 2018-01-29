package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flash.geom.Point;
import flixel.system.FlxSound;
import flixel.math.FlxRandom;
import flixel.math.FlxVector;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;

class Player extends FlxSprite
{
  public static var gravity:Float = 800;

  public var justHurt:Bool = false;

  var speed:Point;
  var terminalVelocity:Float = 200;

  var elapsed:Float = 0;

  public function new(X:Float=0,Y:Float=0) {
    super();
    x = X;
    y = Y;
    // loadGraphic("assets/images/player/player.png", true, 12, 12);

    visible = false;

    setFacingFlip(FlxObject.LEFT, true, false);
    setFacingFlip(FlxObject.RIGHT, false, false);
  }

  public function init():Void {
    Reg.player = this;
    health = 100;
  }

  private function start():Void {
    acceleration.y = gravity;
    visible = true;
    solid = true;
    alive = true;
  }

  public override function hurt(damage:Float):Void {
    if(justHurt && damage < 100) return;

    FlxG.camera.flash(0xccff1472, 0.5, null, true);
    FlxG.camera.shake(0.005, 0.2);

    justHurt = true;
    FlxSpriteUtil.flicker(this, 0.6, 0.04, true, true, function(flicker) {
      justHurt = false;
    });
    // FlxG.sound.play("assets/sounds/player/hurt.wav");

    super.hurt(damage);
  }

  override public function update(elapsed:Float):Void {
    this.elapsed = elapsed;

    if(alive && Reg.started) {
      // do stuff
    }

    super.update(elapsed);
  }

  public override function kill():Void {
    visible = false;
    alive = false;
    solid = false;
    exists = false;
    acceleration.y = acceleration.x = velocity.x = velocity.y = 0;
    // FlxG.sound.play("assets/sounds/player/die.wav");
  }
}
