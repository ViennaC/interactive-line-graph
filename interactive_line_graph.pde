Table t;
Line_Graph l;
int x0=1;
int idx=1;
boolean animate = false;
boolean pause = false;
void setup() {
  size(750,800);
  background(255);
  //Australian Relative Wool Prices
  t = loadTable("wool.csv", "header"); 
  l = new Line_Graph(t);
}

void draw() {
  background(255);
  //displays graph
  if (animate==false) {
    frameRate(60);
    l.display(x0);
  } 
  //animates graph
  if (animate==true) {
    l.animation();
  }
}

void keyPressed() {
  //navigates to the right of the graph
  if (keyCode == RIGHT && x0<284) {
    x0+=1;
  } 
  //navigates to the left of the graph
  if (keyCode == LEFT && x0>1) {
    x0-=1;
  } 
  //continous movement or pausing of the graph animation
  if (key == ' ') {
      //continuous movement to the right of the graph
      if (animate == false) {
        animate = true;
        pause = false;
        idx=x0;
      } 
      //pauses or restarts the graph from the beginning
      else if (animate == true) {
        //restarts at the beginning of the graph
        if (idx==284) {
          idx=1;
          x0=1;
          animate = true;
          pause = false;
        } 
        //pauses the graph at the current position
        else {
        pause = true;
        animate = false;
        x0=idx;
        }
      }
  }
}
