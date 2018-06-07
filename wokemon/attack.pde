class Attack {
  void displayChar() {
    healthbar=loadImage("/Users/ivandelgado/Desktop/wokemon/"+EnemyHealth+"per.png");
    healthbar2=loadImage("/Users/ivandelgado/Desktop/wokemon/"+WokemonHealth+"per.png");
    textSize(40);
    background(100, 30, 40);
    text(enemyName, 60, 90);
    image(Enemy, 400, 75, 600, 400);
    image(healthbar, 50, 100, 500, 300);
    if (Imagex>=-150) {
      image(Character1, Imagex, 300, 600, 400);
    }
    if (Imagex<=-150&&animationover==true) {
      text(wokemonName, 370, 450);
      image(healthbar2, 360, 460, 500, 300);
      image(wokemon, wokemonX,wokemonY, 600, 400);
    } else {
    }
    if(attackNum==1){
      EnemyHealth-=20;
    }
  }
  void displayOptions() {
    if(attackNum>0){
      UsedTurn=true;
      player=minim.loadFile("/Users/ivandelgado/Desktop/wokemon/Music"+attackNum+".mp3",2048);
      if(player.isPlaying()==true){
        return;
      }else{
        attackNum=0;
      }
    }
    menu=loadImage("/Users/ivandelgado/Desktop/wokemon/Menu"+menunum+".png");
    if (menunum==2||menunum==3) {
      image(menu, 100, 0);
      if (mousePressed==true) {
        if (mouseX>=355) {
          menunum=2;
        }
        if (mouseX<=354) {
          menunum=3;
        }
      }
    } else if (menunum==1) {
      image(menu, 100, 530, 800, 300);
    } else {
      image(menu, 100, 530, 1000, 400);
    }
    if (animationover==true) {
      if(UsedTurn==true){
        return;
      }
      if (mousePressed==true) {
        if (menunum>=1) {
          if (menunum==1) {
            if (mouseX>=106&&mouseX<=350) {
              if (mouseY>=536&&mouseY<=610) {
                attackNum=1;
                if(player.isPlaying()==false){
                  player.play();
                }
              }
            }
            if (mouseX>=355&&mouseX<=585) {
              if (mouseY>=536&&mouseY<=610) {
                attackNum=2;
                player.play();
              }
            }
            if (mouseX>=106&&mouseX<=350) {
              if (mouseY>=620&&mouseY<=695) {
                 attackNum=3;
                 player.play();
              }
            }
            if (mouseX>=355&&mouseX<=585) {
              if (mouseY>=620&&mouseY<=695) {
                 attackNum=4;
                 player.play();
              }
            }
          }
        } else {
          if (mouseX>=106&&mouseX<=350) {
            if (mouseY>=536&&mouseY<=610) {
              menunum=1;
            }
          }
          if (mouseX>=355&&mouseX<=585) {
            if (mouseY>=536&&mouseY<=610) {
              menunum=4;
            }
          }
          if (mouseX>=106&&mouseX<=350) {
            if (mouseY>=620&&mouseY<=695) {
              catchWoke=true;
            }
          }
          if (mouseX>=355&&mouseX<=585) {
            if (mouseY>=620&&mouseY<=695) {
              menunum=2;
            }
          }
        }
      }
    }
  }
  void animation() {
    if (Imagex<=-150&&animationover==false) {
      image(pokeball, pokeballX, pokeballY, 300, 200);
      pokeballX+=3;
      if (pokeballY<=300) {
        arch=true;
      }
      if (arch==true) {
        pokeballY+=7;
      } else if (arch==false) {
        pokeballY-=7;
      }
      if (pokeballX>=120) {
        animationover=true;
      }
    }
    Imagex-=10;
  }
}