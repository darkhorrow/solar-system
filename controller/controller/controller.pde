Star star;
float ZOOM = 1;
float MX;
float MY;
float RX = -PI/6;
float RY = PI/3;

void setup() {
  size(1024, 768, P3D);
  MX = width/2;
  MY = height/2;
  star = new Star(100, 0.25);
  star.planets.add(new Planet(0.5, 10, 0.5, 1, 100));
  star.planets.add(new Planet(1.2, 12, 0.5, 0.5, 200));
  star.planets.add(new Planet(1.27, 20, 0.5, 2, 150));
  star.planets.add(new Planet(0.67, 60, 0.5, 1, 300));
  star.planets.add(new Planet(14.3, 5, 0.5, 0.3, 120));
  star.planets.add(new Planet(12, 2, 0.5, 0.1, 100));
  star.planets.add(new Planet(5.1, 24, 0.5, 1, 200));
  star.planets.add(new Planet(4.9, 9, 0.5, 1, 200));
  star.planets.add(new Planet(0.24, 55, 0.5, 1, 200));
}

void draw() {
  background(100);
  lights();
  translate(MX, MY, ZOOM);
  rotateX(RX);
  rotateY(RY);
  star.display();
}

void mouseWheel(MouseEvent event) {
  ZOOM += event.getCount() * 100;
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    MX = mouseX;
    MY = mouseY;
  } else if (mouseButton == RIGHT) {
    RY += radians(mouseX - pmouseX);
  }
}
