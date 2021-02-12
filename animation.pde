//"Welcome to Miami!" Animation 
//By: Luna Mejia

//variables:
PImage foreground;
PImage boatPicture;
PImage shootingStarPicture;
PFont font;
Star[] s;
int n_stars= 8;
float boat_x=50, boat_y=570;
float text_size=30;
float star_x, star_y;
void setup() {
  size(700, 700); //sets window size

  boat_x=50;
  boat_y=570;

  foreground = loadImage("skyline.jpg"); //miami skyline background image
  foreground.resize(width, 0);

  boatPicture = loadImage("boat.png");// boat image
  boatPicture.resize(180, 0);

  shootingStarPicture = loadImage("shootingstar.png");//shooting star image
  shootingStarPicture.resize(150, 0);

  star_x = random(550, 700); //shooting star random range of x value coordinates
  star_y = random(0, 400); // shooting star random range of y value coordinates 

  s= new Star[n_stars];//uses arrays to create multiple stars with different shapes and speeds
  s[0]= new Star(100, 50, 0.05, 5, -0.001, 20, 10); 
  s[1]= new Star(200, 150, 0.05, 7, 0.003, 30, 15);
  s[2]= new Star(350, 60, 0.05, 5, 0.001, 35, 15);
  s[3]= new Star(435, 250, 0.07, 9, -0.005, 55, 30);
  s[4]= new Star(550, 70, 0.05, 5, 0.001, 25, 10);
  s[5]= new Star(630, 250, 0.05, 5, 0.001, 35, 15);
  s[6]= new Star(650, 60, 0.05, 5, -0.003, 14, 7);
  s[7]= new Star(75, 230, 0.07, 5, 0.001, 14, 7);

  font =createFont("BroadwayD.ttf", 60); //sets the font to a variable
}


void draw() {
  background(#060725); //background color

  image(foreground, 0, height-foreground.height);

  boat_x = boat_x +2.0; // sets speed 
  boat_y =40 * cos(boat_x/45) + 550; //boat moves up and down using this function

  image (boatPicture, boat_x, boat_y);

  star_x = -4 + star_x; //sets the speed
  star_y = 2 + star_y;

  image (shootingStarPicture, star_x, star_y); //movement of shooting star
  for (int i=0; i< n_stars; i++)
    s[i].show();

  if (boat_x > width) { //once the boat is past the width, the text shows up

    textSize(text_size);
    fill(#F519CD);
    textAlign(CENTER); 
    textFont(font);
    text("Welcome to Miami!", width/2, height/2); //text 
  }
}

void keyPressed() //if spacebar is clicked, the program will restart
{
  if (key==' ') {
    setup ();
  }
}
