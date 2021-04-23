void pause() {

  // gif
  image(bg[f], 0, 0, width, height);
  f += 1;
  if (f == Frames) {
    f = 0;
  }

  // pause
  textFont(font);
  textSize(120);
  fill(medPink);
  text("PAUSE!", 377, (height/2)-93);

  fill(white);
  textSize(120);
  text("PAUSE!", 380, (height/2)-100);

  // start button
  noStroke();
  fill(white);
  tactileRect(275, 380, 225, 85);
  rect(275, 380, 225, 85, 100);
  fill(medPink);
  textSize(45);
  text("resume", 385, 415);
}

void pauseClicks() {
  if (mouseX > 275 && mouseX < 500 && mouseY > 380 && mouseY < 465) {
    mode = GAME;
  }
}
