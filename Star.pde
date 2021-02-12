class Star {

  static final float or_red=225, or_green=170, or_blue=0;
  static final float light_red=255, light_green=250, light_blue=100;

  float c_mult=0.05;
  float color_sp;
  float rot =0;
  float x, y;
  float turn_sp;
  int npoints;
  float radius1, radius2;
  Star (float _x, float _y, float _colorsp, int _npoints, float _turnsp, float _r1, float _r2) {
    x=_x;
    y=_y;

    c_mult= 0;
    color_sp =_colorsp;
    rot=0;
    turn_sp=_turnsp;
    radius1=_r1;
    radius2 = _r2;
    npoints = _npoints;
  }

  void show() {


    c_mult=(c_mult + color_sp) % 1;

    rot = rot+ turn_sp;
    fill (or_red *c_mult +light_red * (1-c_mult), 
      or_green *c_mult + light_green * (1-c_mult), 
      or_blue *c_mult + light_blue * (1-c_mult));
    //star (width/2,height/2, 100, 40, 5, rot);

    float angle=TWO_PI/npoints;
    float halfAngle =angle/2.0;
    float rotation = map(rot, 0, 1, 0, TWO_PI);
    beginShape(); //lines 40 - 49 are modified from an example reference
    //draws the star shape:
    for (float a=-HALF_PI + rotation; a< TWO_PI - HALF_PI + rotation; a+=angle) {
      float sx = x + cos(a) * radius1;
      float sy = y + sin(a) * radius1;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius2;
      sy = y + sin(a+halfAngle) * radius2;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
