class Boundary {

  Body body;
  float x, y, w, h;

  Boundary(float x, float y, float w, float h) {

    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.STATIC;
    bodyDef.position.set(box2d.coordPixelsToWorld(this.x, this.y));
    body = box2d.createBody(bodyDef);

    PolygonShape polygonShape = new PolygonShape();
    float box2dWidth = box2d.scalarPixelsToWorld(this.w * 0.5);
    float box2dHeight = box2d.scalarPixelsToWorld(this.h * 0.5);
    polygonShape.setAsBox(box2dWidth, box2dHeight);

    body.createFixture(polygonShape, 1);
  }

  void display() {

    fill(39);
    stroke(239);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h);
  }
}
