void game() {
  background(background);
  pauseButton();
  scoreboard();
  ball();
  paddle();
  bricks();

  timer -= 1;
}

void ball() {
  fill(medPink);
  strokeWeight(2);
  noStroke();
  circle(bx, by, bd);
  timer -=1;
  if (timer <= 0) {
    bx = bx + bvx;
    by = by + bvy;
  }

  // bouncing off paddle
  if (dist(bx, by, px, py) <= bd/2 + pd/2) {
    bvx = (bx-px) / 12;
    bvy = (by-py) / 12;
    paddle.rewind();
    paddle.play();
  }

  // bouncing off walls
  if (bx < bd/2 || bx > width-bd/2) {
    bvx *= -1;
    wall.rewind();
    wall.play();
  }

  if (by < bd/2) {
    bvy *= -1;
    wall.rewind();
    wall.play();
  }

  //lives
  if (by > height+15) {
    lives-=1;
    timer = 100;
    bx = width/2;
    by = height*3/4;
    px = width/2;
    py = height;
  }
}

void paddle() {
  if (Lkey == true) px -= 10;
  if (Rkey == true) px += 10;
  if (px < pd/2) px = pd/2;
  if (px > width-(pd/2)) px = width-(pd/2);

  fill(255);
  strokeWeight(2);
  stroke(medPink);
  circle(px, py, pd);
}

void scoreboard() {
  fill(medPink);
  textSize(30);
  text("Score: " + score, 100, 20);
  text("Lives:  " + lives, 290, 20);

  if (score == n*100 || lives <= 0) {
    mode = GAMEOVER;
  }
}

void bricks() { 
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBricks(i);
    }
    i += 1;
  }
  if (score == n*100) {
    mode = GAMEOVER;
    win.play();
    win.rewind();
  }

  if (lives <= 0) {
    mode = GAMEOVER;
    lose.play();
    lose.rewind();
  }
}

void manageBricks(int i) {
  if (y[i] == 100) fill(red);
  if (y[i] == 150) fill(orange);
  if (y[i] == 200) fill(yellow);
  if (y[i] == 250) fill(green);
  if (y[i] == 300) fill(blue);
  if (y[i] == 350) fill(violet);

  stroke(white);
  circle(x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i]) <= bd/2 + brickd/2) {
    bvx = (bx-x[i])/5;
    bvy = (by-y[i])/5;
    point.play();
    alive[i] = false;
    score += 100;
    point.pause();
    point.rewind();
  }
}

void pauseButton() {
  fill(white);
  circleTactile(768, 30, 60);
  circle(768, 30, 60);

  textAlign(CENTER, CENTER);
  stroke(medPink);
  strokeWeight(7);
  line(760, 20, 760, 40);
  line(775, 20, 775, 40);
}


void gameClicks() {
  if (dist(770, 30, mouseX, mouseY) < 30) {
    mode = PAUSE;
  }
}
