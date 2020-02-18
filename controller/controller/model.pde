interface Displayable {
  void display();
}

interface Rotable {
  void doRotation();
}

interface Translatable {
  void doTranslation();
}

abstract class CelestialBody implements Rotable, Translatable, Displayable {
  private Position position;
  private Dimension dimension;
  private Rotation rotation;
  private Translation translation;

  public CelestialBody(Position position, Dimension dimension, Rotation rotation, Translation translation) {
    this.position = position;
    this.dimension = dimension;
    this.rotation = rotation;
    this.translation = translation;
  }
}

class Star extends CelestialBody {
  private ArrayList<Planet> children = new ArrayList<Planet>();

  public Star(Position position, Dimension dimension, Rotation rotation, Translation translation) {
    super(position, dimension, rotation, translation);
  }

  void display() {
    beginShape();
    PShape body = createShape(SPHERE, super.dimension.getWidth());
    endShape();
    pushMatrix();
    translate(super.position.getX(), super.position.getY());
    rotateY(super.rotation.getY());
    shape(body);
    popMatrix();
  }

  void doRotation() {
  }

  void doTranslation() {
  }
}

class Planet extends CelestialBody {
  private ArrayList<Satellite> children = new ArrayList<Satellite>();

  public Planet(Position position, Dimension dimension, Rotation rotation, Translation translation) {
    super(position, dimension, rotation, translation);
  }

  void display() {
  }

  void doRotation() {
  }

  void doTranslation() {
  }
}

class Satellite extends CelestialBody {
  public Satellite(Position position, Dimension dimension, Rotation rotation, Translation translation) {
    super(position, dimension, rotation, translation);
  }

  void display() {
  }

  void doRotation() {
  }

  void doTranslation() {
  }
}
