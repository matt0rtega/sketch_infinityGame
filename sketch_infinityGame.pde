
int time = 1000;

String words = "";
int enteredNumber = 30;

PFont font;
PVector loc;

//Steps of the game
int chapter = 0;

String[] chapter1_words = {"Okay", 
                           "Rules of the Game:", 
                           "Look for numbers hidden in \n the patterns  presented by \n the Infinity Boxes or the Paintings.", 
                           "Type one number at a time here.",
                           "See the projection changing.",
                           "Look for another number \n and type within 2 minutes \n after projection changing has started.",
                           "Find all the numbers and you win the prize.",
                           "If you don't find them in time, Game Over.",
                           "Ready to start? Press Y for yes."
                           };
                           
String[] chapter3_words = {"Projection 1", 
                           "Finishing"
                           };

int selector = 0;

void setup(){
  size(500, 500, P2D);
  
  font = loadFont("HelveticaNeue.vlw");
  
  words = "Do you want to play the infinity game? \n Press Y for yes.";
  
  loc = new PVector(width/2, height/2);
  
  textFont(font, 24);
  fill(0);
  textAlign(CENTER);
}

void draw(){
  background(255);

  switch (chapter){
    case 0:
    chapter0();
    break;
    case 1:
    chapter1();
    break;
    case 2:
    chapter2();
    break;
    case 3:
    chapter3();
    break;
    case 4:
    chapter4();
    break;
  }
}  

void chapter0(){
  text(words, loc.x, loc.y);
}


void chapter1(){
  
  if(selector < chapter1_words.length){
    int offset = (int)textWidth(chapter1_words[selector]) * 10;
    words = chapter1_words[selector];
    selector += 1;
    delay(1000 + offset);
    println(offset);
  }
  
  
  text(words, loc.x, loc.y);
  
  //println(selector);
  
}

void chapter2(){
  text("Enter a number", loc.x, loc.y - 56);
  text(words, loc.x, loc.y);
}

void chapter3(){
  
  if (frameCount % 100 == 0){
    words = "";
    chapter = 2;
    println("blip");
  }
  
  println(frameCount);
  text(words, loc.x, loc.y);
}

void chapter4(){
  
  if (frameCount % 100 == 0){
    restart();
  }
  
  text(words, loc.x, loc.y);
}

void keyPressed(){

  // Beginning of the game
  if (key == 'y' || key == 'Y'){
    words = "";
    chapter++;
    println(chapter);
  }
  
  switch(chapter){
    case 0:
    // Code here
    break;
    case 1:
      selector = 0;
    break;
    case 2:
      // Key Input for Chapter 2
      if ('0' <= key && key <= '9' && chapter == 2){
              // Concat key strokes
            words = words + key;
      }
    break;
    case 3:
      if (chapter == 3){
        selector = 0;
      }
    break;
  }
  
  // Enter input for Chapter 2
  if (keyCode == ENTER){
    enteredNumber = int(words);
    
    checkCodes(enteredNumber); 
  }
}


void checkCodes(int enteredNumber){
  
  switch (enteredNumber){
    case 321:
      frameCount = 0;
      println("Success!");
      words = "Projection 1";
      chapter = 3;
    break;
    case 13:
      frameCount = 0;
      println("Success!");
      words = "Projection 2";
      chapter = 3;
    break;
    case 14:
      frameCount = 0;
      println("Success!");
      words = "Projection 3";
      chapter = 3;
    break;
    case 250:
      frameCount = 0;
      println("Success!");
      words = "Projection 4";
      chapter = 3;
    break;
    default:
      frameCount = 0;
      words = "Game over!";
      println("Game over!");
      chapter = 4;
    break;
  }
  
}

void restart(){
  words = "Do you want to play the infinity game? \n Press Y for yes.";
  chapter = 0;
}