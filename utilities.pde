void tactileRect(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    strokeWeight(3);
    stroke(medPink);
    fill(lightPink);
  } else {
    noStroke();
    fill(white);
  }
}

void circleTactile(int x, int y, int r) { 
  if (dist(x, y, mouseX, mouseY) < r) { 
    strokeWeight(3);
    stroke(medPink);
    fill(lightPink);
  } else {
    noStroke();
    fill(white);
  }
}
