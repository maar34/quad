  

Logic logic;
Fiducials fiducials;
Amb amb;
Obj obj;
Fx fx;
Bank bank;
OscSend oscSend;
Voronoi myVoronoi;
Vor vor;
MPolygon myRegions[];
Blobs blobs;
Paleta paleta;


float [][] points;
float[][] myEdges;

float noiseVal;
float noiseScale=0.01;
float equilibrium;
float hueBack, alphaBack;// = equilibrium*140+220;

color backgroundColor;
color backgroundColor2;

boolean proyectorScreen = true; 

void setup () {

  // canvas / system draw

  size(800,600);

 // frame.setAlwaysOnTop(true); 
  noCursor();
  smooth();
  frameRate(24);
  colorMode(HSB, 360, 100, 100, 100);
  ellipseMode(CENTER);
  rectMode(CENTER);
  strokeWeight(1.3);

  // tuio receive
  tuioClient = new TuioProcessing(this);

  // OSC send
  oscP5 = new OscP5(this,12001); // puerto a recibir mensajes
  myRemoteLocation = new NetAddress("127.0.0.1",10001); // puerto a enviar mensajes
  oscP5.plug(this,"setObjLevel","/setObjLevel");
  oscP5.plug(this,"setAmbLevel","/setAmbLevel");
  oscP5.plug(this,"setFxLevel","/setFxLevel");
  oscP5.plug(this,"setProgramData","/programData");
  // Logic
  logic = new Logic();
  logic.initGroup ();


  // fiducials
  fiducials = new Fiducials();
  fiducials.initCounter();
  oscSend = new OscSend();
  amb = new Amb();
  obj = new Obj();
  fx = new Fx();  
  bank = new Bank();
  obj.initColor();
  amb.initColor();
  fx.initColor();
  bank.Bank();
  // blobs
  blobs = new Blobs();
  blobs.initColor();
  // Voronois Setup
  vor = new Vor();
  vor.initMesh();
  vor.initPoints();
  vor.draw();
  // Paleta
  paleta = new Paleta( "1.png" );
  background (0);
  //equilibrium = 200;
}



void draw() {

  if (proyectorScreen) {
    frame.setLocation( screen.width, 0 );
  }
  else {
    frame.setLocation( screen.width-width, 0 );
  }

  // Noise Draw
  /*  if (equilibrium  > .5) {
   strokeWeight(4);
   for(int x = 0; x < 150; x++) {
   noiseDetail(8,0.65);
   noiseVal=noise( random (200) * noiseScale, random (255) * noiseScale);
   stroke( noiseVal* 255);
   
   pushMatrix();
   translate (random (width), random (height));
   //rotate (radians ((x%360)));
   point(x, x);
   popMatrix();
   strokeWeight(1);
   }
   }*/

  /*backgroundColor = color ( 147, 98, 39, equilibrium);
  backgroundColor2 = color ( 155, 100);
  backgroundColor = blendColor(backgroundColor2, backgroundColor, OVERLAY);
  */
  //println (equilibrium);

  if (bank.state) bank.draw();

  hueBack = map (equilibrium, 0, 1, 210, 360);
  alphaBack = map (equilibrium, 0, 1, 60, 2);

  if (hueBack>280 && hueBack<352) hueBack = 352;

  backgroundColor = color ( hueBack, 99, 50, alphaBack);
  fill( backgroundColor);
  
  rectMode(CORNER);
  rect(0,0,width,height);
  rectMode(CENTER);
  // Voronois Drawing

  voronoiDraw();
  fiducials.draw();
  blobs.draw();

}
void voronoiDraw() {
  Vector tuioObjectList = tuioClient.getTuioObjects();  
  for (int i=0;i<tuioObjectList.size();i++) {
    TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
    vor.draw();
    if (tobj.getSymbolID()<points.length) {
      myRegions[ tobj.getSymbolID()].draw(this); // draw this shape//R
    }
  }
}


void init() {  
  frame.removeNotify();
  frame.setUndecorated(true); 
  frame.addNotify();
  super.init();
}  

