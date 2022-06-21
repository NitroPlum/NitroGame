package;

import nitrogame.Assets.menuFont;
import Game.GameScreen;
import Game.changeScreen;
import h2d.col.Bounds;
import nitrogame.Camera2D.camW;
import nitrogame.Camera2D.camH;
import h2d.Text;
import h2d.Flow;
import h2d.Object;
import nitrogame.Globals;
import Settings;

class PlayScreen extends nitrogame.BaseScreen {

  // Define gamemodes
  // Separate module for defining level types and how to load
  // Facilitate transitions between level types  

  public function new(?parent: Object) {
    super(defaultParent);
  }

  public function loadLevel() {

  }

  override function update(_dt: Float) {
  }
}