class Blobs {

  float xoff = 0;
  float yoff = 0; //punto central
  float ratio = 40;

  int blobType;

  int idB;
  float xB, yB;

  int auraB = -1; // numero de blob que activa el aura. 

  boolean horizontal ;
  boolean vertical  ;
  color blobStroke;
  color blobFill [];
  float m;
  float  amp [];
  int tmpAuraID[];
  void Blobs() {
  }

  void draw() {


    Vector tuioCursorList = tuioClient.getTuioCursors();
    for (int i=0;i<tuioCursorList.size();i++) {
      TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
      Vector pointList = tcur.getPath();
      idB = tcur.getCursorID();
      xB = tcur.getScreenX(width);
      yB =  tcur.getScreenY(height);

      blobColorCheck(idB);
      blobStroke = 0;

      
      float angle= radians(frameCount%360*10); 
      xB = xB+ratio*cos(angle)+ random (0, 10);
      yB = yB+ratio*sin(angle)+ random (0, 10);

      pushMatrix();      
      translate (xB, yB);
      noStroke ();
      fill (blobFill[idB  ]);
            amp[idB] = map (amp[idB], 0, 1, 40, .1);
      ellipse (0, 0, 10+amp[idB], 10+amp[idB]);
      //rotate (radians(20));

      popMatrix();
    }
  }

  void setBlobID(int idB) {
    idB = idB;
  }

  void setBlobX(float xB) {
    xB = xB;
  }

  void setBlobY(float yB) {
    yB = yB;
  }
  int getBlobID() {
    return idB;
  }

  float getBlobX() {
    return xB;
  }

  float getBlobY() {
    return yB;
  }
  void initColor () {
    blobFill = new color[20];
    amp = new float[20];
    tmpAuraID = new int[20];

    for (int i=0;i<20;i++) {
      blobFill [i]=0;
      amp [i] = 0;
      tmpAuraID[i] = 0;
    }
  }

  void blobColorIn(int _idB) {

    if (fiducials.auraID != -1) {
      blobFill [_idB] = obj.objLevel[fiducials.auraID];
      tmpAuraID [_idB] = fiducials.auraID;
      amp [_idB] =  (obj.objLevelF[fiducials.auraID]/200) ;
    } 
    else {

      blobFill [_idB] = obj.objLevel[fiducials.auraID];
      tmpAuraID [_idB] = fiducials.auraID;
      amp [_idB] =  (obj.objLevelF[fiducials.auraID]/200) ;
   }
  }
  void blobColorCheck(int _idB) {

    if (fiducials.auraID != -1) {
      blobFill [_idB] = obj.objLevel[tmpAuraID [_idB]];
      amp [_idB] =  (obj.objLevelF[tmpAuraID [_idB]]/200) ;
    } 
    else {

      blobFill [_idB] = obj.objLevel[tmpAuraID [_idB]];
      amp [_idB] =  (obj.objLevelF[tmpAuraID [_idB]]/200) ;
     }
  }
}

