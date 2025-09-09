int x; // x of ball
int y; // y of ball
int count; // speed of ball
boolean anime; //to check if the ball is black color

void setup() {
    size(500, 500); //screen size
    start_ball();   //ball begin to fall
}

void draw() {
    background(135, 206, 235); //background sky blue

    draw_player(mouseX); //draw player on mouseX position
  
    if (anime) { //if the ball is black
        fill(0); //fill black
    }
    else {
        fill(255); //fill white
    }
    ellipse(x, y, 20, 20); //ball
    y = y+count; //fall

    if (y + 10 >= 450 - 30 && y < 450 && abs(x - mouseX) < 20) { //if ball is >= top of player and y < bottom of player and distance from ball to player mouse is less than diameter of the ball (can catch)
        if (anime) { //if the ball is black
        end_game();  //end game
        noLoop();    //stop
        }
        else {            //else(ball is white)
            start_ball(); //start new ball
        }
    }
        if (y > height) { //if the ball falls off the screen
            if (anime){   //but the ball is black
                start_ball(); //start new ball
            }
            else { //else(ball is white)
                end_game(); // end game
                noLoop(); //stop
            }
        }
}

void start_ball() {              //ball start falling
    x = int(random(50, 450));    // random x of ball when start falling
    y = 0;                       // y of ball when start falling
    count = int(random(5, 12));  //random speed of ball
    int ball_type = int(random(1, 6)); //random type of ball(white or black)
    anime = (ball_type == 1);    //if type is 1 ball color is black
}

void draw_player(int playerx) { // rectangle
    line(playerx - 20, 450 - 30, playerx + 20, 450 - 30);
    line(playerx - 20, 450, playerx + 20, 450);
    line(playerx - 20, 450 - 30, playerx - 20, 450);
    line(playerx + 20, 450 - 30, playerx + 20, 450);
}

void end_game(){
    background(255,105,97); //red background
    //E
    line(100,100,100,200); // |
    line(100,100,150,100); // -
    line(100,150,150,150); // -
    line(100,200,150,200); // -
    //N
    line(200,100,200,200); // |
    line(200,100,250,200); // \
    line(250,100,250,200); // |
    //D
    line(300,100,300,200); // |
    line(300,100,350,150); // \
    line(300,200,350,150); // /
}
