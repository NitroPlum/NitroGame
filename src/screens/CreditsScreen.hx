package screens;

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

class CreditsScreen extends nitrogame.BaseScreen {
    var credits: Flow;
    var totalOffset: Float;
    var bounds: Bounds;

    public function new(?parent: Object) {
        super(defaultParent);
        credits = new Flow(this);
        credits.setPosition(-camW, camH);
        setup();
    }

    function setup() {
        //credits.debug = true;
        credits.layout = Vertical;
        credits.horizontalAlign = Middle;
        credits.colWidth = Settings.REF_WIDTH;
        
        creditsBlock("Design", ["NitroPlum", "Cozimo"]);
        creditsBlock("Audio", ["Cozimo"]);
        creditsBlock("Code", ["NitroPlum"]);
        creditsBlock("Art", ["NitroPlum"]);
        creditsBlock("Story", ["NitroPlum", "A Ghost"]);
        credits.addSpacing(10);

        var thanks = new Text(menuFont, credits);
        thanks.text = "Thanks For Playing!";
        thanks.textColor = 0xB721EE;

        bounds = new Bounds();
        credits.getSize(bounds);
    }

    inline function creditsBlock(workType: String, names: Array<String>) {
        var work = new Text(menuFont, credits);
        work.text = workType;
        work.textColor = 0xB721EE;

        for (name in names) {
            var newName = new Text(menuFont, credits);
            newName.text = name;
        }

        credits.addSpacing(10);
    }

    override function update(_dt: Float) {
        totalOffset -= 10 * _dt;
        credits.setPosition(credits.x, camH + totalOffset);

        if(totalOffset <= -bounds.height * 2) {
            trace("-- Credits Complete --");
            onCreditsComplete();
        }
    }

    function onCreditsComplete() {
        changeScreen(GameScreen.Start);
    }
}