PFont fuente;
PImage personaje, fondo, ufo, titulo;
float posX[];
float posY[];
float distancia = 0;
int estado[];
int puntaje = 0;
int tiempo = 0;
float velocidad[];
boolean entrar=false;
float perX=500;
float perY=600;
boolean disparar=false;
float inicioX = 0;
float inicioY = 0;
float finX=0;
float finY=0;

void setup(){
  size(1000, 700);
  fuente = loadFont("BernardMT-Condensed-30.vlw");
  personaje = loadImage("personaje.png");
  fondo = loadImage("fondo.png");
  ufo = loadImage("ufo.png");
  titulo = loadImage("titulo.png");
  posX = new float[15];
  posY = new float[15];
  estado = new int[100];
  velocidad = new float[100];
  
  //vida enemigos
  for(int i=0; i<15; i++){
    posX[i] = random(0, 1000); 
    posY[i] = random(0, 100);
    estado[i] = 1; //estado de vida 0=vivo 1=muerto
    velocidad[i] = random(0, 2);
  }
  
  inicioX = perX;
  inicioY = perY;
}

void draw(){
  if(entrar==false){
  background(titulo);
  if(mousePressed){
    entrar=true;
    }
  }
  else if(entrar == true){
    //estado de enemigos
   background(fondo);
  for(int i=0; i<15; i++){
    if(estado[i]==1){
      fill(255, 15, 0);
      image(ufo, posX[i], posY[i], 100, 100);
      posY[i] = posY[i] + velocidad[i];
    }
  }
  
  //matar enemigos
  /*for(int i=0; i<100; i++){
    if(mousePressed){
      distancia = dist(mouseX, mouseY, posX[i], posY[i]);//dibuja un radio dento del rando del mousen en X y Y
      if (distancia < 50){
        estado[i] = 0;
      }   
    } 
  }*/
  
  //puntaje
  textFont(fuente, 30);
  fill(0, 0, 0);
  text("UFO´s muertos:" +puntaje, 10, 50);
  puntaje = 0;
  for(int i=0; i<15; i++){
    if(estado[i]==0){
      puntaje++;
    }
  }
  
  //contador
  tiempo = millis()/1000;
  text("Tiempo:" +tiempo, 10, 80);
  
  //personaje
  image(personaje, perX, perY, 100, 100);
  if(keyPressed && key==CODED){
    
    if(keyCode == LEFT && perX>=0){
      perX = perX -10;
    }
    else if(keyCode == RIGHT && perX<=900){
      perX = perX+10;
    }
    else if(keyCode == UP && perY>=0){
      perY = perY-10;
    }
    else if(keyCode == DOWN && perY<=600){
      perY = perY+10;
    }
    
   
  }   
  
   if(mousePressed && !disparar){
    disparar=true;
    finX=perX;
    
    }
  if(disparar){
    inicioY-=10;
    println(perX);
    rect(finX+50,inicioY,5,50);
    for(int i =0;i<15;i++){
    if(finX >= posX[i]-50 && finX <= posX[i]+50 && inicioY>=posY[i]-50 && inicioY<=posY[i]+100){
      estado[i]=0;
    }
    
  }
    if(inicioY<=0){
    inicioX=perX;
    inicioY=perY;
    disparar=false;}
  }
  }
  
}