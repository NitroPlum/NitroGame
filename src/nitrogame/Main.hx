package nitrogame;

import h2d.Layers;
using nitrogame.Camera2D;
using nitrogame.Layers;
using nitrogame.Assets;
using hxd.Window;
using hxd.App;
using Settings;
using Game;

class Main extends hxd.App {
  override function init() {
    hxd.Res.initEmbed();

    Globals.s2d = s2d;
    Layers.initLayers(s2d);
    Camera2D.initCamera(s2d);
  
    Assets.loadFonts();
  
    // Need to support more robust featureset to support 
    // loading saved configs after first run
    var win = Window.getInstance();
    win.vsync = true;
    win.resize(Settings.REF_WIDTH * 2, Settings.REF_HEIGHT * 2);
    win.title = Settings.GAME_NAME;
  
    Game.initGame();
  }

  override function update(dt:Float) {
    Layers.defaultLayer.ysort(0);
    Game.update(dt);
  }
  
  override function onResize() {
    Camera2D.resize();
  }

  static function main() {
    new Main();
  }
}