public void setup() {
  size(1280, 400);
  background(255);
}

public void draw() {
  strokeWeight(2);
  frontCar();
  //front wheel
  wheel(-260,0,40, 30);
  //back wheel
  wheel(90,0,40, 30);
  outterFrameCar();
  backCar();
  door();
}

public void wheel(int x, int y, int rOut, int rIn ) {
  //front outer wheel
  circle(x,y,rOut);
  //front inner wheel
  circle(x,y,rIn);
}

//front car
public void frontCar() {
  //front
  bressenham(-350, -350, -20, 50);
  //bottom
  bressenham(-350, -295, -20, -20);
  //join bottom
  bressenham(-225, 55, -20, -20);
  //hood
  bressenham(-350, -210, 50, 60);
  //hood join
  bressenham(-210, 80, 60, 60);
}

// outter frame car
public void outterFrameCar() {
  // hood angle
  bressenham(-210, -150, 60, 110);
  // hood join 
  bressenham(-150, 50, 110, 110); 
  // hood angle
  bressenham(80, 50, 60, 110);
}

// backCar
public void backCar() {
  //back hood
  bressenham(80, 160, 60, 60);
  //back 
  bressenham(160, 160, 60, -20);
  // bottom 
  bressenham(160, 125, -20, -20);
}

//door
public void door() {
  //bottom door
  bressenham(-210, 50, -10, -10);
  // straigth line
  bressenham(-210, -210, -10, 60);
  bressenham(-70, -70, -10, 60);
  bressenham(70, 70, 60, 40);
  //windows
  bressenham(-200, -145, 60, 105);
  bressenham(-145, 43, 105, 105);
  bressenham(70, 43, 60, 105);
  bressenham(-65, -65, 60,105);
  bressenham(-75, -75, 60,105);
  handle();
}


// door handle
public void handle() {
  // front handle
  bressenham(-85, -75, 55, 55);
  bressenham(-85, -85, 55, 50);
  bressenham(-75, -75, 55, 50);
  bressenham(-85, -75, 50, 50);
  // back handle
  bressenham(50, 60, 55, 55);
  bressenham(50, 50, 55, 50);
  bressenham(60, 60, 55, 50);
  bressenham(50, 60, 50, 50);
}


// Below this all of algorithm Bressenhamand midpoint for circle

//set point of view in the middle of screen
public void stdPoint(int stdX, int stdY) {
  point(stdX+(width/2), (stdY*-1)+(height/2));
}

// line algorithm using bressenham
public void bressenham (int xa, int xb, int ya, int yb) {
  int dx=xb-xa, dy=yb-ya;
  int dxTemp = abs(dx), dyTemp = abs(dy);
  int duaDy = 2 * dyTemp; 
  int duaDyDx = 2 * (dyTemp-dxTemp);
  int duaDx = 2 * dxTemp; 
  int duaDxDy = 2 * (dxTemp-dyTemp);
  int px = 2 * dyTemp - dxTemp; 
  int py = 2 * dxTemp - dyTemp;
  int x, y, xAkhir, yAkhir;
  
  
  if (dyTemp <= dxTemp) {
    if (dx >= 0) { 
      x = xa; 
      y = ya; 
      xAkhir =xb;
    } else { 
      x = xb; 
      y = yb; 
      xAkhir = xa;
    }
    stdPoint(x, y);   
    while (x < xAkhir) { 
      x++; 
      if (px < 0) { 
        px= px + duaDy;
      } else {
        if ((dx < 0 && dy < 0) || (dx > 0 && dy > 0)) {
          y++;
        } else { 
          y--;
        } 
        px = px + duaDyDx;
      }
      stdPoint (x, y); 
    }
  } else { 
    if (dy >= 0) { 
      x = xa; 
      y = ya; 
      yAkhir=yb;
    } else 
    { 
      x = xb; 
      y = yb; 
      yAkhir = ya;
    }
    stdPoint (x, y); 
    while (y < yAkhir) { 
      y++; 
      if (py < 0) { 
        py = py + duaDx;
      } else {
        if ((dx < 0 && dy < 0) || (dx > 0 && dy > 0)) {
          x++;
        } else { 
          x--;
        } 
        py = py + duaDxDy;
      } 
      stdPoint(x, y); 
    }
  }
    stop();
}

// circle algorithm using midpoint
public void circle(int xTengah, int yTengah, int r) { 
    int P=1-r;
    int x=0;
    int y=r;
 
    plot(xTengah,yTengah,x,y);
    for (x=0; x<y;) {
 
        if (P<0) //jika p lebih kecil dari 0
        {
            x=x+1;
            P=P+2*x+1;
            plot(xTengah,yTengah,x,y);
        }
        else //jika p tidak lebih kecil dari 0
        {
            x=x+1;
            y=y-1;
            P=P+(2*x)-(2*y)+1;
            plot(xTengah,yTengah,x,y);
        }
    }
} 

// reflect all quadrant
public void plot(int xTengah, int yTengah, int x, int y) {
  stdPoint(x+xTengah, y+yTengah); //kuadrant 1
  stdPoint(x+xTengah, -y+yTengah); //kuadrant 2
  stdPoint(-x+xTengah, -y+yTengah); //kuadrant 3
  stdPoint(-x+xTengah, y+yTengah); //kuadrant 4
  stdPoint(y+xTengah, x+yTengah); //kuadrant 5
  stdPoint(y+xTengah, -x+yTengah); //kuadrant 6
  stdPoint(-y+xTengah, x+yTengah); //kuadrant 7
  stdPoint(-y+xTengah, -x+yTengah); //kuadrant 8
}
