void gameover() {
  music.pause();
  // gif
  image(gameover[f2], 0, 0, width, height);
  f2 += 1;
  if (f2 == Frames2) {
    f2 = 0;
  }

  if (lives <= 0) {
    textFont(font);
    textSize(120);
    fill(neonPink);
    textSize(120);
    text("YOU LOST!", 380, (height/2)-50);
  } else if (score == n*100) {
    textFont(font);
    textSize(120);
    fill(neonPink);
    textSize(120);
    text("YOU WON!", 380, (height/2)-50);
  }

  // back 
  noStroke();
  fill(white);
  tactileRect(275, 380, 225, 85);
  rect(275, 380, 225, 85, 100);
  fill(medPink);
  textSize(56);
  text("back", 382, 415);
}

void reset() {
  score = 0;
  lives = 3;
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
    i += 1;
    win.rewind();
  }
  bx = width/2;
  by = height*3/4;
  px = width/2;
  py = height;
  timer = 100;
}

void gameOverClicks() {
  if (mouseX > 275 && mouseX < 500 && mouseY > 380 && mouseY < 465) {
    mode = INTRO;
    reset();
  }
}
