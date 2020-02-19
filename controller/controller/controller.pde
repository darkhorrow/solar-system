Star star;

void setup() {
  size(1024, 768, P3D);
  star = new Star(new Position(width/2, height/2, 0), 100, 0.25, 0);
  star.planets.add(new Planet(new Position(0, 0, 0), 55, 0.5, 1, 0, 100));
}

void draw() {
  background(100);
  lights();
  translate(width/2, height/2);
  star.display();
}
