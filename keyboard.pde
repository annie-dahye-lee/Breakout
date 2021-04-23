void keyPressed() {
  if(keyCode == LEFT) Lkey = true;
  if(keyCode == RIGHT) Rkey = true;
  
}

void keyReleased() {
  if(keyCode == LEFT) Lkey = false;
  if(keyCode == RIGHT) Rkey = false;
}
