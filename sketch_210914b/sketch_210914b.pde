class Block{
  int x, y;
  int mn = 4;
  int size;
  boolean hover = false, press = false;
  Block(int _x, int _y, int _size){
    size = _size;
    x    = _x;
    y    = _y;
  }
  
  void draw(){
    //ellipseMode(CORNER);
    //int mn = 4; // magic number
    int nx = x * size + size/4 + (y%2==0 ? size/2 : 0 ) + size / 2 + mn,
        ny = y * size + size/2 + size/3*2 - mn * y; // 4 * y → magic number
    
    fill( press ? color( 120, 20, 0 ) :hover ? color( 255, 0, 0 ) : color( 255 ) );
    //noStroke();
    pushMatrix();
    translate( nx, ny );
    rotate( PI * 0.5 );
    polygon( 0, 0, size*0.6, 6);
    popMatrix();
    //circle( nx, ny, size );
  }
  boolean overtop( int tx, int ty, boolean _pressed ){
    int nx = x * size + size/4 + (y%2==0 ? size/2 : 0 ) + size /2 + mn,
        ny = y * size + size/2 + size /2 - mn * y;
    int vx = ( tx-nx ) * ( tx-nx ),
        vy = ( ty-ny ) * ( ty-ny );
    hover = sqrt( vx + vy ) <= size/2;
    press = hover && _pressed;
    return hover;
  }
};
Block board[];
void setup(){
  size( 500, 500 );
  int edge = 10;
  board = new Block[edge*edge];
  for( int x = 0 ; x < edge ; x++ ){
    for( int y = 0 ; y < edge ; y++ ){
      board[ x * edge + y ] = new Block( x, y, width/(edge+1) );
    }
  }
  
  ellipseMode(CORNER);
}

void draw(){
  background( 255 );
  for( int x = 0 ; x < 10 ; x++ ){
    for( int y = 0 ; y < 10 ; y++ ){
      Block b = board[ x * 10 + y ];
      b.draw();
      boolean ontop = b.overtop( mouseX, mouseY, mousePressed );
    }
  }
}


void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
