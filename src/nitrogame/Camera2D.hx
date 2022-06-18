package nitrogame;
using h2d.Scene;
using h2d.Camera;
using Settings;

var cam: h2d.Camera;
var camW: Int;
var camH: Int;
var s2d: h2d.Scene;

function initCamera(scene: h2d.Scene) {
  s2d = scene;
  cam = s2d.camera;
  cam.setAnchor(0.5, 0.5);
}

function updateSize() {
  camW = Std.int(cam.viewportWidth / 2);
  camH = Std.int(cam.viewportHeight / 2);
}

function letterbox() {
  s2d.scaleMode = LetterBox(Settings.REF_WIDTH, Settings.REF_HEIGHT, true);
  updateSize();
}

function resize() {
  // TODO: Support more viewport modes.
  letterbox();
}