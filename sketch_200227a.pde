import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Boundary> boundalyList;
ArrayList<Character> characterList;
ArrayList<String> mojiList;

void setup() {

  size(720, 720);

  PFont font = createFont("ＭＳ Ｐゴシック", 30, true);
  textFont(font);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -25);

  boundalyList = new ArrayList<Boundary>();
  characterList = new ArrayList<Character>();
  mojiList = new ArrayList<String>();

  boundalyList.add(new Boundary(width * 0.5, height - 50, 250, 25));

  mojiList.add("(*•ω•*)");
  mojiList.add("( ´;ω;` )");
  mojiList.add("ヾ(*´∀｀*)ﾉ");
  mojiList.add("ヾ(*ΦωΦ)ﾉ");
  mojiList.add("( • ̀ω•́ )ゞ");
}

void draw() {

  background(239);

  this.box2d.step();

  if (random(1) < 0.05) {

    Character character = new Character(random(width * 0.5 - 50, width * 0.5 + 50), 100);
    characterList.add(character);
  }

  for (Boundary boundary : boundalyList) {

    boundary.display();
  }

  for (Character character : characterList) {

    character.display();
  }

  for (int i = characterList.size() - 1; i >= 0; i -= 1) {

    if (characterList.get(i).death()) {

      characterList.remove(i);
    }
  }
}
