class People{
  int countup=0;
  int countdown=0;
  int countleft=0;
  int countright=0;
  void display(){
    image(LILPUMP,300,300,200,100);
  }  
  void displayDrR(){
    image(DrR,mapX+125,mapY+25,200,100);
  }
  void speak(){
    if(numspeech>4){
      return;
    }
    if(mapY>=205){
      speak=true;
    }
    if(speak==true){
      Speech=loadImage("/Users/ivandelgado/Desktop/wokemon/speech"+numspeech+".png");
      image(Speech,50,550,600,100);
      if(mousePressed==true){
        numspeech++;
      }
    }
  }
  void change(boolean up,boolean down,boolean left,boolean right,boolean moving){
        if(moving==false){
          return;
        }
        if(speak==true){
          return;
        }
        if(up==true){
          if(countup%2==0){
            LILPUMP=runup3;  
            countup++;
          }else if(countup%2!=0){
            LILPUMP=runup2;
            countup++;
          }
        }
          if(down==true){
          if(countdown%2==0){
            LILPUMP=rundown3;  
            countdown++;
          }else if(countdown%2!=0){
            LILPUMP=rundown2;
            countdown++;
          }
        }
         if(right==true){
          if(countright%2==0){
            LILPUMP=runright1;  
            countright++;
          }else if(countright%2!=0){
            LILPUMP=runright2;
            countright++;
          } 
         }
        if(left==true){
          if(countleft%2==0){
            LILPUMP=runleft1;  
            countleft++;
          }else if(countleft%2!=0){
            LILPUMP=runleft2;
            countleft++;
          } 
        }
  }
}