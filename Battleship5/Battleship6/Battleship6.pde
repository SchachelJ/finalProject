ArrayList<Seatile> seas = new ArrayList();

 
void setup() {
  size(1060, 550);
  textSize(18);
  for (int i=0; i<10; i++) {
    for (int j=0; j<10; j++) {
      seas.add(new Seatile(20+50*i, 20+50*j, false, i, j) );
      seas.add(new Seatile(540+50*i, 20+50*j, true, i, j) );
    }
  }
  
}
 
void draw() {
  background(0);
  for ( int i = 0; i < seas.size (); i++) {
    seas.get(i).draw();
  }
}
 
void mousePressed() {
  for ( int i = 0; i < seas.size (); i++) {
    seas.get(i).click();
  }
}
 
class Seatile {
  int ship;
  boolean hidden;
  boolean clicked;
  boolean hit;
  int x, y, xg, yg;
  Seatile(int ix, int iy, boolean ihidden, int ixg, int iyg) {
    xg=ixg;
    yg=iyg;
    hidden = ihidden;
    ship = 0;    //hidden && random(1)<.2;//false;
   hit=false;
    clicked = false;
    x = ix;
    y = iy;
    if(((xg==1 && yg==1) || (xg==1 && yg==2)) && hidden){
      ship= 1;
    }
    
    if(((xg==4 && yg==2) || (xg==5 && yg==2) || (xg==6 && yg==2)) && hidden){
      ship= 2;
    }
    
    if(((xg==8 && yg==5) || (xg==8 && yg==6)|| (xg==8 && yg==7)) && hidden){
      ship= 3;
    }
    
    if(((xg==0 && yg==9) || (xg==1 && yg==9)|| (xg==2 && yg==9)|| (xg==3 && yg==9)) && hidden){
      ship= 4;
    }
    
    if(((xg==2 && yg==6) || (xg==3 && yg==6)|| (xg==4 && yg==6)|| (xg==5 && yg==6)|| (xg==6 && yg==6)) && hidden){
      ship= 5;
    }
    
    
  }
  void draw() {
    pushMatrix();
    translate(x, y);
    fill(45, 117, 212);
    stroke(0, 0, 255);
    rect(0, 0, 50, 50);
    // An draw other symbols.
    if ( ship==0 && clicked ) {
      fill(255);
      stroke(0);
      ellipse(25, 25, 30, 30);
    }
    if ( !hidden && ship!=0 ) {
      fill(128);
      stroke(0);
      rect(5, 5, 40, 40);
    }
    if ( ship!=0 && clicked ) {
      hit=true;
      fill(255, 0, 0);
      stroke(0);
      ellipse(25, 25, 30, 30);
      for (int i=0; i<10; i++) {
    for (int j=0; j<10; j++) {
      if(ship==1){
        println("ship1");
      }
       if(ship==2){
        println("ship2");
      }
    }
  }
    }
    popMatrix();
  }
  
  void checkSunkenShips(){
    
  }
  void click() {
    if ( mouseX > x && mouseX < x+50 && mouseY > y && mouseY < y+50 ) {
      if( ship_place_state && !hidden ){
        ship = 1;
      }
      if( hidden && !ship_place_state ){
        clicked = true;
        computers_turn();
      }
    }
  }
}
 
void computers_turn(){
  for(int i = 0; i < seas.size(); i++){
    if( !seas.get(i).hidden && !seas.get(i).clicked ){
      seas.get(i).clicked = true;
      return;
    }
  }
}
 
boolean  ship_place_state = true;
 
void keyPressed(){
  if( ship_place_state && key == ' ' ){
    ship_place_state = false;
    
  }
}
