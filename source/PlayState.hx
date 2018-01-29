package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxRandom;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.math.FlxPoint;
import flixel.addons.display.FlxBackdrop;

class PlayState extends FlxState
{
  var player:Player;
  var title:TitleGroup;

  var level:Room;
  var hud:HUD;

  var gameOver:Bool = false;

  override public function create():Void {
    super.create();

    bgColor = 0xff62acda;
    FlxG.timeScale = 1;
    Reg.random = new FlxRandom();

    FlxG.camera.flash(0xffffffff, 1);

    Reg.started = false;

    var background = new FlxBackdrop("assets/images/background.png");
    background.velocity.x = -20;
    background.velocity.y = -20;
    background.scale.x = background.scale.y = 2;
    background.color = 0xffb0d0e5;
    add(background);

    level = new Room("assets/tilemaps/level.tmx");
    //add(level.backgroundTiles);

    player = new Player(0, 0);
    player.x = FlxG.width/2 - player.width/2;
    player.y = 80;
    player.init();
    add(player);

    hud = new HUD();
    hud.exists = false;
    add(hud);

    title = new TitleGroup();
    title.scrollFactor.x = title.scrollFactor.y = 0;
    add(title);

    //DEBUGGER
    //FlxG.debugger.drawDebug = true;
  }

  override public function destroy():Void {
    super.destroy();
  }

  override public function update(elapsed:Float):Void {
    super.update(elapsed);
    level.collideWithLevel(player);

    if (FlxG.mouse.justPressed) {
      startGame();
    }
  }

  function startGame():Void {
    title.startGame();
    FlxG.sound.play("assets/sounds/menuselect.ogg");
  }

  private function recordHighScores():Void {
    if (Reg.hardMode) {
      if (FlxG.save.data.hardHighScore == null) FlxG.save.data.hardHighScore = 0;
      if (Reg.score > FlxG.save.data.hardHighScore) FlxG.save.data.hardHighScore = Reg.score;
    } else {
      if (FlxG.save.data.highScore == null) FlxG.save.data.highScore = 0;
      if (Reg.score > FlxG.save.data.highScore) FlxG.save.data.highScore = Reg.score;
    }
  }
}
