package screens;

import nitrogame.Assets.menuFont;
import Game.GameScreen;
import Game.changeScreen;
import nitrogame.Camera2D.camW;
import h2d.Text;
import h2d.Flow;
import h2d.Object;
using tweenxcore.Tools;
import nitrogame.Globals;

class SplashScreen extends nitrogame.BaseScreen {
    var splash: Flow;
    var rate: Float = 0;

    public function new(?parent: Object) {
        super(defaultParent);
        splash = new Flow(this);
        splash.setPosition(0 - camW, 0 - 8);
        setup();
    }

    function setup() {
        //splash.debug = true;
        splash.layout = Vertical;
        splash.horizontalAlign = Middle;
        splash.colWidth = Settings.REF_WIDTH;

        var splashText = new Text(menuFont, splash);
        splashText.text = "A NitroPlum Game";
        splashText.textColor = 0xB721EE;
    }

    override function update(_dt: Float) {
        splash.alpha = tweenxcore.Tools.FloatTools.bezier(rate, [0, 1, 1, 0]).lerp(0, 1);
        rate += _dt / 3;

        if(rate > 1) changeScreen(GameScreen.Start);
    }
}