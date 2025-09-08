int x; // x of ball
int y; // y of ball
int count; // speed of ball

void setup() {
  size(500, 500);
  start_ball();
}

void draw() {
  background(255);

  draw_player(mouseX);

  ellipse(x, y, 20, 20); //ball
  y = y+count; //fall

  if (y + 10 >= 450 - 30 && y < 450 && abs(x - mouseX) < 20) { //if ball is >= top of player and y < bottom of player and distance from ball to player mouse is less than diameter of the ball
    start_ball(); //start new ball
  }

  if (y > height) { //if the ball falls off the screen
    return; // end game
  }
}

void start_ball() {            //ball start falling
  x = int(random(50, 450));    // random x of ball when start falling
  y = 0;                       // y of ball when start falling
  count = int(random(5, 10));  //random speed of ball
}

void draw_player(int playerx) { // rectangle
  line(playerx - 20, 450 - 30, playerx + 20, 450 - 30);
  line(playerx - 20, 450, playerx + 20, 450);
  line(playerx - 20, 450 - 30, playerx - 20, 450);
  line(playerx + 20, 450 - 30, playerx + 20, 450);
}
