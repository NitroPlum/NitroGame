package nitrogame;

var defaultDebugFont : h2d.Font;
var menuFont: h2d.Font;

function loadFonts() {
  defaultDebugFont = hxd.res.DefaultFont.get();
  menuFont = hxd.Res.fonts.monogram.toFont();
}