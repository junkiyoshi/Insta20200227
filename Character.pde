class Character {

  Body body;
  int mojiIndex = 0;

  Character(float x, float y) {

    this.mojiIndex = (int)random(mojiList.size());

    BodyDef bodyDef = new BodyDef();
    bodyDef.type = BodyType.DYNAMIC;

    bodyDef.position = box2d.coordPixelsToWorld(x, y);
    this.body = box2d.world.createBody(bodyDef);

    PolygonShape polygonShape = new PolygonShape();
    polygonShape.setAsBox(box2d.scalarPixelsToWorld(textWidth(mojiList.get(this.mojiIndex)) * 0.5), box2d.scalarPixelsToWorld(16));

    FixtureDef fixtureDef = new FixtureDef();
    fixtureDef.shape = polygonShape;
    fixtureDef.density = 1;
    fixtureDef.friction = 0.3;
    fixtureDef.restitution = 0.5;

    this.body.createFixture(fixtureDef);
  }

  void display() {

    Vec2 position = box2d.getBodyPixelCoord(this.body);
    float angle = this.body.getAngle();

    pushMatrix();

    translate(position.x, position.y);
    rotate(-angle);

    fill(39);
    textAlign(CENTER, CENTER);
    text(mojiList.get(this.mojiIndex), 0, 0);

    popMatrix();
  }

  Boolean death() {

    return box2d.getBodyPixelCoord(this.body).y > height + 30;
  }
}
