class Position {
  private float x;
  private float y;
  private float z;

  public Position(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getZ() {
    return z;
  }
}

class Dimension {
  private float width;
  private float height;

  public Dimension(float w, float h) {
    this.width = w;
    this.height = h;
  }

  public float getWidth() {
    return this.width;
  }

  public float getHeight() {
    return this.height;
  }
}

class Translation {
  private float x;
  private float y;

  public Translation(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }
}

class Rotation {
  private float x = -1;
  private float y = -1;
  private float rateX, rateY;

  public Rotation(float rateX, float rateY) {
    this.rateX = rateX;
    this.rateY = rateY;
  }

  public float getX() {
    x+=rateX;
    return radians(x);
  }

  public float getY() {
    y+=rateY;
    return radians(y);
  }
}
