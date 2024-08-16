use <deps.link/erhannisScad/misc.scad>
//use <asdf/gears/shapes.scad>
use <deps.link/scadFluidics/common.scad>
//use <deps.link/BOSL/nema_steppers.scad>
//use <deps.link/BOSL/joiners.scad>
//use <deps.link/getriebe/Getriebe.scad>
use <deps.link/BOSL/shapes.scad>
//use <dep/BOSL/shapes.scad>

$fn = 60;
BIG = 1000;

BD = 11;
SD = 1.2;
HEIGHT = BD*1.5;

SPACE_X = 20;
SPACE_Y_SHORT = 20;
SPACE_Y_TALL = 30;
SPACE_Y_BACK = BD*1.5;
THICK = 4;
LESS_THICK = 0.75;

union() {
  SPACE_Y = SPACE_Y_TALL;
  cmirror([0,1,0]) ty(SPACE_Y_BACK+5) {
    linear_extrude(height=HEIGHT) {
      channel([0,0],[0,SPACE_Y],d=THICK,cap="circle");
      channel([0,0],[SPACE_X,0],d=THICK,cap="circle");
    }
    difference() {
      linear_extrude(height=HEIGHT*3.2) {
        channel([SPACE_X,0],[SPACE_X,-SPACE_Y_BACK],d=THICK,cap="circle");
      }
      ctranslate([0,0,HEIGHT*2]) tz(HEIGHT/2) ty(-SPACE_Y_BACK/2) tx(THICK/2-LESS_THICK) rz(90) {
        teardrop(d=BD, h=SPACE_X*2);
        rx(90) cylinder(d=SD,h=BIG,center=true);
      }
    }
  }
}

union() {
  SPACE_Y = 10;
  tx(SPACE_X+10) cmirror([0,1,0]) ty(SPACE_Y_BACK+5) {
    linear_extrude(height=HEIGHT) {
      channel([0,0],[0,SPACE_Y],d=THICK,cap="circle");
      channel([0,0],[SPACE_X,0],d=THICK,cap="circle");
    }
    difference() {
      linear_extrude(height=HEIGHT*3.2) {
        channel([SPACE_X,0],[SPACE_X,-SPACE_Y_BACK],d=THICK,cap="circle");
      }
      ctranslate([0,0,HEIGHT*2]) tz(HEIGHT/2) ty(-SPACE_Y_BACK/2) tx(THICK/2-LESS_THICK) rz(90) {
        teardrop(d=BD, h=SPACE_X*2);
        rx(90) cylinder(d=SD,h=BIG,center=true);
      }
    }
  }
}