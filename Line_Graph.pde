class Line_Graph {
  Table t;
  Line_Graph(Table _t) {
    this.t = _t;
  }
  
  void display(int x0) {
    //displays the graph
    fill(0);
    textAlign(CENTER);
    textSize(30);
    //title
    text("Australian Relative Wool Prices",width/2,40);
    //x-axis
    text("Time",425,720);
    //y-axis
    pushMatrix();
    translate(30,375);
    rotate(-PI/2);
    translate(-30,-375);
    text("Value",30,375);
    popMatrix();
    line(100,100,100,650);
    line(100,650,750,650);
    textSize(20);
    textAlign(LEFT);
    //interactivity instructions
    if (idx<284||x0<284) {
      text("Use the Left and Right arrow keys to navigate or",20,760);
      text("press Space. Press Space again to pause and navigate.",20,780);
    }
    textSize(12);
    textAlign(CENTER);
    //displays values on the y-axis
    float valRange=0;
    for (int i=650;i>=100;i-=55) {
      text(valRange,80,i);
      valRange+=0.05;
    }
    //displays values on the x-axis
    int counter=100;
    for (int j=x0;j<x0+26;j++) {
      text(j,counter,662);
      counter+=26;
    }
    //retrieves and graphs values from the table
    for (int q=x0;q<x0+25;q++) {
      TableRow r = t.getRow(q);
      fill(0);
      int time = r.getInt("time");
      time = time*26-26*x0+100;
      float value = r.getFloat("value");
      value = value*(-1100)+650;
      ellipse(time, value,3,3);
      int index = r.getInt("index");
      if (index>1) {
        TableRow prevRow = t.getRow(index-2);
        int time2 = prevRow.getInt("time");
        time2 = time2*26-26*x0+100;
        float value2 = prevRow.getFloat("value");
        value2 = value2*(-1100)+650;
        line(time2,value2,time,value);
      }  
    }
  }
  
  void animation() {
    frameRate(20);
    //displays the end of the graph and prompts user for restart of animation
    if (idx == 284 || pause == true) {
      textSize(20);
      textAlign(LEFT);
      text("Press Space to restart animation.", 20,760);
      display(idx);
    } 
    //updates the idx to display the next value to the right
    if (idx<284 && pause == false) {
      display(idx);
      idx+=1;
    }
  }
}
