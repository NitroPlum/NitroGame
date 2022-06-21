package;

enum GameScreen {
  Splash;
  Start;
  Play;
  Credits;
}

var screen = GameScreen.Splash;
var currentScreen: nitrogame.BaseScreen = null;

function initGame() {

}

function newGame() {
  currentScreen = new PlayScreen();
}

// This is just an Int as a placeholder
inline function continueGame(gameSave: Int) {
  // load data and start from specified level
} 

inline function changeScreen(gs: GameScreen, ?gameSave: Int) {
  if(currentScreen != null ) currentScreen.remove();
  screen = gs;

  switch screen {
    case GameScreen.Splash:
      currentScreen = new screens.SplashScreen();

    case GameScreen.Start:
      currentScreen = new screens.StartScreen();
    
    case GameScreen.Credits:
      currentScreen = new screens.CreditsScreen();

    case GameScreen.Play: {
      if(gameSave != null)
        continueGame(gameSave);
      else {
        newGame();
      }
    }

    case _:
  }
}

function update(dt:Float) {
    currentScreen.update(dt);
}