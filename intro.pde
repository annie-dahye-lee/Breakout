void intro() {
  music.play();
  
  // gif
  image(bg[f], 0, 0, width, height);
  f += 1;
  if (f == Frames) {
    f = 0;
  }

  // title
  textAlign(LEFT);
  textFont(font);
  textSize(120);
  fill(medPink);
  text("BREAKOUT!", 127, (height/2)-3);

  fill(white);
  textSize(120);
  text("BREAKOUT!", 130, height/2);

  // start button
  noStroke();
  fill(white);
  tactileRect(275, 380, 225, 85);
  rect(275, 380, 225, 85, 100);
  fill(medPink);
  textSize(56);
  text("start", 310, 440);
}

void introClicks() {
  if (mouseX > 275 && mouseX < 500 && mouseY > 380 && mouseY < 465) {
    mode = GAME;
    lives = 3;
    score = 0;
    timer = 100;
  }
}
