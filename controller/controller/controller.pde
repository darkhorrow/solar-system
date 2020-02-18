Star star;

void setup() {
  size(800, 600, P3D);
  star = new Star(new Position(width/2, height/2, 0), new Dimension(100, 100), new Rotation(0.1, 0.1), new Translation(10, 10));
}

void draw() {
  background(100);
  star.display();
}
