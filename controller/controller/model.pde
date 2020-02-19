abstract class CelestialBody {
  private Position position;
  private float diameter;
  private float rotationAngle = 0;
  private float translationAngle = 0;
  private float rotationFrequency;
  private float translationFrequency;
  private float axisTilt;

  // Non-translatable celestial bodies
  public CelestialBody(float diameter, float rotationFrequency, float axisTilt) {
    this.diameter = diameter;
    this.rotationFrequency = rotationFrequency;
    this.axisTilt = axisTilt;
  }

  // Translatable celest bodies
  public CelestialBody(float initialAngle, float diameter, float rotationFrequency, float translationFrequency, float axisTilt) {
    translationAngle = initialAngle % 360;
    this.diameter = diameter;
    this.rotationFrequency = rotationFrequency;
    this.translationFrequency = translationFrequency;
    this.axisTilt = axisTilt;
  }
}

class Star extends CelestialBody {
  ArrayList<Planet> planets = new ArrayList<Planet>();

  public Star(float diameter, float rotationFrequency, float axisTilt) {
    super(diameter, rotationFrequency, axisTilt);
  }

  void display() {
    // Display the star
    beginShape();
    PShape star = createShape(SPHERE, super.diameter);
    endShape();
    rotateY(radians(super.rotationAngle));
    super.rotationAngle = (super.rotationAngle + super.rotationFrequency) % 360;
    shape(star);

    // Display the star´s planets
    for (Planet planet : planets) {
      planet.display(this);
    }
  }

  float getDiameter() {
    return super.diameter;
  }
}

class Planet extends CelestialBody {
  ArrayList<Satellite> children = new ArrayList<Satellite>();
  float distanceToStar;

  public Planet(float initialAngle, float diameter, float rotationFrequency, float translationFrequency, float axisTilt, float distanceToStar) {
    super(initialAngle, diameter, rotationFrequency, translationFrequency, axisTilt);
    this.distanceToStar = distanceToStar;
  }

  void display(Star parent) {
    pushMatrix();
    beginShape();
    PShape planet = createShape(SPHERE, super.diameter);
    endShape();
    float distance = distanceToStar + parent.getDiameter() + super.diameter/2;
    translate(distance * cos(radians(super.translationAngle)), 0, distance * sin(radians(super.translationAngle)));
    rotateY(radians(super.rotationAngle));
    super.rotationAngle = (super.rotationAngle + super.rotationFrequency) % 360;
    super.translationAngle = (super.translationAngle + super.translationFrequency) % 360;
    shape(planet);
    popMatrix();
  }
}

class Satellite extends CelestialBody {
  float distanceToPlanet;

  public Satellite(float initialAngle, float diameter, float rotationFrequency, float translationFrequency, float axisTilt, float distanceToPlanet) {
    super(initialAngle, diameter, rotationFrequency, translationFrequency, axisTilt);
    this.distanceToPlanet = distanceToPlanet;
  }

  void display() {
  }
}
