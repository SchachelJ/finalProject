ArrayList<Seatile> seas = new ArrayList();

 
void setup() {
  size(1060, 550);
  textSize(18);
  for (int i=0; i<10; i++) {
    for (int j=0; j<10; j++) {
      seas.add(new Seatile(20+50*i, 20+50*j, false) );
      seas.add(new Seatile(540+50*i, 20+50*j, true) );
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
  boolean has_ship;
  boolean hidden;
  boolean clicked;
  int x, y;
  Seatile(int ix, int iy, boolean ihidden) {
    hidden = ihidden;
    has_ship = hidden && random(1)<.2;//false;
    clicked = false;
    x = ix;
    y = iy;
  }
  void draw() {
    pushMatrix();
    translate(x, y);
    fill(45, 117, 212);
    stroke(0, 0, 255);
    rect(0, 0, 50, 50);
    // An draw other symbols.
    if ( !has_ship && clicked ) {
      fill(255);
      stroke(0);
      ellipse(25, 25, 30, 30);
    }
    if ( !hidden && has_ship ) {
      fill(128);
      stroke(0);
      rect(5, 5, 40, 40);
    }
    if ( has_ship && clicked ) {
      fill(255, 0, 0);
      stroke(0);
      ellipse(25, 25, 30, 30);
    }
    popMatrix();
  }
  void click() {
    if ( mouseX > x && mouseX < x+50 && mouseY > y && mouseY < y+50 ) {
      if( ship_place_state && !hidden ){
        has_ship = !has_ship;
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
