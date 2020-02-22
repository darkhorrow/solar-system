Star star;
float ZOOM = 1;
float MX;
float MY;
float RX = -PI/6;
float RY = PI/3;
PImage bgImage;

void setup() {
  size(1024, 768, P3D);
  bgImage = loadImage("data/bg.jpg");
  MX = width/2;
  MY = height/2;
  star = new Star(100, 0.25, "data/sun.jpg");
  Planet pl1 = new Planet(200, 40, 0.5, 1, 100, "data/planet2.jpg");
  pl1.satellites.add(new Satellite(0, 5, 0.5, 3, 10, "data/satellite1.jpg"));
  star.planets.add(pl1);
  star.planets.add(new Planet(45, 30, 0.5, 0.5, 200, "data/planet4.jpg"));
  star.planets.add(new Planet(90, 20, 0.5, 1, 300, "data/planet3.jpg"));
  star.planets.add(new Planet(0, 50, 0.5, 1, 400, "data/planet1.jpg"));
  star.planets.add(new Planet(10, 40, 0.5, 0.5, 500, "data/planet5.jpg"));
}

void draw() {
  background(bgImage.get(constrain(int(MX), 0, width/4), constrain(int(MY), 0, height/2), width, height));
  lights();
  noStroke();
  translate(MX, MY, ZOOM);
  rotateX(RX);
  rotateY(RY);
  star.display();
}

void keyPressed() {
  if (keyCode == 'R') {
    ZOOM = 1;
  }
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
