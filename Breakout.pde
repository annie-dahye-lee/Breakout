// Annie Lee
// 1-4
// Breakout

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// variables

// mode framework
final int INTRO = 1;
final int GAME  = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;
int mode = INTRO; 

// gif
PImage[] bg;
int Frames;
int f;

PImage[] gameover;
int Frames2;
int f2;

// font
PFont font;

// sound fx 
Minim minim;
AudioPlayer win, lose, paddle, point, wall, music;

// colors
color background = #F4CFDF;
color white = #ffffff;
color medPink = #F26B7A;
color lightPink = #FFE6EE;
color neonPink = #FF0092;

color red = #FF6663;
color orange = #FEB144;
color yellow  = #FDFD97;
color green = #93DFB8;
color blue = #3FB8AF;
color violet = #B179DB;

// paddle 
float px;
float py;
float pd;

// ball 
float bx;
float by;
float bd;
float bvx;
float bvy;

// bricks
int[] x;
int[] y;
int brickd;
int n;
int tempx, tempy;
boolean[] alive;

// movement 
boolean Lkey, Rkey;

// scoring
int timer;
int lives;
int score;

void setup() {
  size(800, 600);

  // text font
  font = createFont("cheri.liney.ttf", 100);

  //  gif
  Frames = 9;
  bg = new PImage[Frames];
  int currentPic = 0;
  while (currentPic < Frames) {
    bg[currentPic] = loadImage("frame_"+currentPic+"_delay-0.08s.gif");
    currentPic += 1;
  }

  Frames2 = 4;
  gameover = new PImage[Frames2];
  int currentPic2 = 0;
  while (currentPic2 < Frames2) {
    gameover[currentPic2] = loadImage("frame_"+currentPic2+"_delay-0.3s.gif");
    currentPic2 += 1;
  }

  // paddle variables
  px = width/2;
  py = height;
  pd = 150;

  //ball variables
  bx = width/2;
  by = height*5 /7;
  bd = 30;
  bvx = 7;
  bvy = -6;

  //bricks
  n = 90;
  brickd = 40;
  tempx = 50;
  tempy = 100;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  int i = 0;
  while (i < n) {
    alive[i] = true;
    x[i] = tempx;
    y[i] = tempy;
    tempx = tempx + 50;
    if (tempx >= width) {
      tempx = 50;
      tempy = tempy + 50;
    }
    i = i + 1;
  }

  //scoring
  timer = 100;
  lives = 3;
  score = 0;

  //movement keys
  Lkey = Rkey = false;

  //sound fx
  minim = new Minim(this);
  music = minim.loadFile("music.mov");
  point = minim.loadFile("rightpaddle.wav");
  paddle = minim.loadFile("leftpaddle.wav");
  wall = minim.loadFile("wall.wav");
  win = minim.loadFile("win.mov");
  lose = minim.loadFile("gameover.mov");
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {  
    pause();
  }
}
