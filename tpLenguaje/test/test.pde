// importamos la bibliotecas 
import TUIO.*;
import processing.sound.*;
import gab.opencv.*;
import processing.video.*;
//declaramos el objeto tui
TuioProcessing lector;
//declaramos el objeto sonidos
SoundFile miSonido ;
//objeto capture de la camara 
Capture cam;
//variables a testear
int valorColor = 0;
//medidas estandar del vga
int ancho = 640;
int alto =480;
void setup() {
  size(400, 400);
  //inicalizo el objeto tui
  lector = new TuioProcessing(this);
  //array de camaras
  String[] listaDeCamaras = Capture.list();
  printArray(listaDeCamaras);
  //inicializamos el objeto camara 
  int numeroCamara = 1;
  cam = new Capture(this, listaDeCamaras[numeroCamara]);
  //cam = new Capture(this, ancho , alto);
  cam.start();
  //inicializo el sonido
  miSonido = new SoundFile(this, "test.wav");
}

void draw() {
  //pregunta si hay un nuevo fotograma
  if(cam.available()){
    //lee el nuevo fotograma
    cam.read();
  }
}

//funcion que detecta la entrada del elemento
void addTuioObject(TuioObject tobj) {
  //  leo el id del elemento simbolo
  int id = tobj.getSymbolID();
  println(id);
  if (id==1) {
    valorColor=255;
    miSonido.play();
    miSonido.loop();
    image(cam,0,0);
  } else {
    valorColor=0;
    miSonido.stop();
  }
}
