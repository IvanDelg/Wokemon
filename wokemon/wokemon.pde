import ddf.minim.*;
AudioPlayer player;
Minim minim;
int playerposX=width/2;
int playerposY=height/2;
PImage runup1;
PImage runup2;
PImage runup3;
PImage runleft1;
PImage runleft2;
PImage runright1;
PImage runright2;
PImage rundown1;
PImage rundown2;
PImage rundown3;
PImage map1;
PImage LILPUMP;
PImage DrR;
PImage Speech;
PImage Character1;
PImage menu;
PImage Enemy;
PImage healthbar;
PImage healthbar2;
PImage wokemon;
PImage pokeball;
PImage DrRFace;
int Imagex=100;
int pokeballX=0;
int pokeballY=450;
int mapX=175;
int mapY=-965;
int drX=350;
int drY=300;
int maptype=0;
int numspeech=1;
int menunum=0;
int attackNum=0;
int wokemonX=100;
int wokemonY=250;
int EnemyHealth=100;
int WokemonHealth=100;
boolean speak=false;
boolean animationover=false;
boolean arch=false;
boolean cheat1=false;
boolean gameover=false;
boolean catchWoke=false;
boolean reachhit=false;
boolean UsedTurn=false;
String enemyName="lilpump";
String wokemonName="6ix9ine";


map Map=new map();
People people=new People();
Attack attack=new Attack();
void setup(){
  minim=new Minim(this);
  player=minim.loadFile("/Users/ivandelgado/Desktop/wokemon/Music1.mp3");
  DrRFace=loadImage("/Users/ivandelgado/Desktop/wokemon/DrRImage.png");
  Character1=loadImage("/Users/ivandelgado/Desktop/wokemon/Character.png");
  menu=loadImage("/Users/ivandelgado/Desktop/wokemon/Menu0.png");
  Enemy=loadImage("/Users/ivandelgado/Desktop/wokemon/Lilpump.png");
  Speech=loadImage("/Users/ivandelgado/Desktop/wokemon/speech1.png");
  DrR=loadImage("/Users/ivandelgado/Desktop/wokemon/DrR.png");
  LILPUMP=loadImage("/Users/ivandelgado/Desktop/wokemon/walkdown2.png");
  map1=loadImage("/Users/ivandelgado/Desktop/wokemon/street.png");
  runup1= loadImage("/Users/ivandelgado/Desktop/wokemon/walkup1.png");
  runup2= loadImage("/Users/ivandelgado/Desktop/wokemon/walkup2.png");
  runup3= loadImage("/Users/ivandelgado/Desktop/wokemon/walkup3.png");
  rundown1= loadImage("/Users/ivandelgado/Desktop/wokemon/walkdown1.png");
  rundown2= loadImage("/Users/ivandelgado/Desktop/wokemon/walkdown2.png");
  rundown3= loadImage("/Users/ivandelgado/Desktop/wokemon/walkdown3.png");
  runright1= loadImage("/Users/ivandelgado/Desktop/wokemon/walkright1.png");
  runright2= loadImage("/Users/ivandelgado/Desktop/wokemon/walkright2.png");
  runleft1= loadImage("/Users/ivandelgado/Desktop/wokemon/walkleft1.png");
  runleft2= loadImage("/Users/ivandelgado/Desktop/wokemon/walkleft2.png");
  pokeball=loadImage("/Users/ivandelgado/Desktop/wokemon/pokeball.png");
  wokemon=loadImage("/Users/ivandelgado/Desktop/wokemon/6ix9ineBack.png");
  Character1=loadImage("/Users/ivandelgado/Desktop/wokemon/Character.png");
  menu=loadImage("/Users/ivandelgado/Desktop/wokemon/Menu0.png");
  Enemy=loadImage("/Users/ivandelgado/Desktop/wokemon/Lilpump.png");
  healthbar=loadImage("/Users/ivandelgado/Desktop/wokemon/100per.png");
  healthbar2=loadImage("/Users/ivandelgado/Desktop/wokemon/100per.png");
  size(700,700);  
  frameRate(30);
}


void draw(){
  background(0);
    if(gameover==true){    
      image(DrRFace,-100,-500,3000,3000);
      return;
    }
    Map.display();
    people.display();
    people.displayDrR();
    people.speak();
    if(numspeech>3){
      attack.displayChar();
      attack.displayOptions();
      attack.animation();
    }
   
}



void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      people.change(true,false,false,false,true); 
      if(move("up")==true)
      mapY+=10;
    }
    if(keyCode==DOWN){
      people.change(false,true,false,false,true);  
      if(move("down")==true)
      mapY-=10;
    }
    if(keyCode==LEFT){
      people.change(false,false,true,false,true); 
      if(move("left")==true)
      mapX+=10;
    }
    if(keyCode==RIGHT){
      people.change(false,false,false,true,true); 
      if(move("right")==true)
      mapX-=10;
    }
    
    if(keyCode==SHIFT){
      if(mapX==55&&mapY==-995){
        System.out.println("You showed them the money, got the lay of the land, and pushed to github so you won");
        gameover=true;
      }
    }
  }  
}
boolean move(String way){
  boolean coolio=true;
  if(speak==true){
    return false;
  }
  if(way.equals("right")){ 
    if(maptype==0){
      if(mapY>=-360&&mapY<=-150){
        if(mapX-10<=275&&mapX>=190){
          coolio=false;
        }else{
        coolio=true;
        }        
      }//car2
      
      if(mapY>=35&&mapY<=235){
        if(mapX-10<=175&&mapX>=175){
          coolio=false;
        }else{
        coolio=true;
        }        
      }//car1
      
      if(mapY>=-745&&mapY<=-545){
        if(mapX-10<=165&&mapX>=165){
          coolio=false;
        }else{
        coolio=true;
        }        
      }//car3
      
      if(coolio==true){
        if(mapY<=305&&mapY>=-1005){
          if(mapX-10<=45){
            coolio=false;
          }else{
            coolio=true;
          }
        }
      }
    }  
  }
  if(way.equals("left")){ 
    if(maptype==0){
      if(mapY>=-360&&mapY<=-150){
        if(mapX+10>=180){
          coolio=false;
        }else{
        coolio=true;
        }        
      }//car2
      
       if(mapY>=35&&mapY<=235){
        if(mapX+10>=75){
          coolio=false;
        }else{
        coolio=true;
        }//car1       
      }
      
      if(mapY>=-745&&mapY<=-545){
        if(mapX+10>=75&&mapX<=75){
          coolio=false;
        }else{
        coolio=true;
        }//car3       
      }
      
      if(coolio==true){
        if(mapY<=305&&mapY>=-1005){
          if(mapX+10>=305){
            coolio=false;
          }else{
            coolio=true;
          }
        }
      }
    }  
  }
  if(way.equals("down")){ 
    if(maptype==0){
      if(mapX>=190&&mapX<=275){
        if(mapY-10<=-150&&mapY>=-350){
          coolio=false;
        }else{
        coolio=true;
        }        
      }//car2
      
      if(mapX>=75&&mapX<=170){//car1
        if(mapY-10<=235&&mapY>=35){
          coolio=false;
        }else{
        coolio=true;
        }        
      }
      if(coolio==true){
        if(mapX>=75&&mapX<=165){//car3
          if(mapY-10<=-545&&mapY>=-745){
            coolio=false;
          }else{
            coolio=true;
          }        
        }//car3
      }
      if(coolio==true){
        if(mapX>=55&&mapX<=290){
          if(mapY-10<=-1005){
            coolio=false;
          }
        } 
      }
    }
  }
  if(way.equals("up")){ 
    if(maptype==0){
      if(mapX>=190&&mapX<=275){
        if(mapY<=-150&&mapY+10>=-360){
          coolio=false;
        }else{
        coolio=true;
       }        
      }//car2
      
      if(mapX>=75&&mapX<=175){
        if(mapY<=235&&mapY+10>=35){
          coolio=false;
        }else{
        coolio=true;
       }        
      }
      if(coolio==true){
        if(mapX>=75&&mapX<=165){   //car3
          if(mapY<=-545&&mapY+10>=-745){
            coolio=false;
          }else{
          coolio=true;
         }        
        }//car3
      }
      
      if(coolio==true){
        if(mapX<=295&&mapX>=55){
          if(mapY+10>=305){
            coolio=false;
          }else{
            coolio=true;
          }
        }
      }
    }  
  }
  return coolio;
}