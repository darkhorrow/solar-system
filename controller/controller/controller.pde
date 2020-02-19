Star star;

void setup() {
  size(1024, 768, P3D);
  star = new Star(100, 0.25, 0);
  star.planets.add(new Planet(50, 55, 0.5, 1, 0, 100));
  star.planets.add(new Planet(100, 40, 0.5, 0.5, 0, 200));
  star.planets.add(new Planet(150, 30, 0.5, 2, 0, 150));
  star.planets.add(new Planet(200, 55, 0.5, 1, 0, 300));
  star.planets.add(new Planet(250, 70, 0.5, 0.3, 0, 120));
  star.planets.add(new Planet(300, 80, 0.5, 0.1, 0, 100));
  star.planets.add(new Planet(350, 55, 0.5, 1, 0, 200));
}

void draw() {
  background(100);
  lights();
  translate(width/2, height/2);
  star.display();
}
