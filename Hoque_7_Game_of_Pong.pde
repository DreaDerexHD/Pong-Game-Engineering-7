int base=40;
int x,y,gameScore=0;
int changeX=-5;
int changeY=-5;
int gameOver=0;
void setup()
{
  size(360, 640);
  x=(int)random(width);
  y=height-base;
}
void draw()
{
  if(gameOver==0)
  {
  background(0); 
  text("SCORE: "+gameScore+"00",width/10,height/10);
  rect(mouseX,height-base,200,base);
  fill(255,0,0);
  ellipse(x,y,30,30);
  x=x+changeX;
  y=y+changeY;
  if(x<0 | x>width)
  {
    changeX=-changeX;
  }
  if(y<0)
  {
    changeY=-changeY;
  }
  if(y>height-base)
  {
    //check whether it is falling inside the rectangle or not
    if(x>mouseX && x<mouseX+200)
    {
      changeY=-changeY; //bounce back
      gameScore++;
    }
    else
    {
      gameOverSplash();
    }
  }
  }
  else
  {
    background(400,100,300);
    text("UH-OH! YOU  LOST!",width/2,height/2);
    text("Click your mouse to try again",width/2,height/2+20);
  }
}
void gameOverSplash()
{
  gameOver=1;
}
void mouseClicked()
{
  changeY=-changeY;
  gameScore=0;
  gameOver=0;
}