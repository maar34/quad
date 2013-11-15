class Fiducials extends Logic {

  // shapeType; 0 = obj , 1 = amb, 2 = fx  

  int idF;

  float xF, yF, angleF;

  int objSize = 90;
  int auraSize = objSize*2;

  Fiducials() {


    // inicializamos contador en 0
  }

  void draw () {

    // Read TUIO OBJECT VECTOR

    
    Vector tuioObjectList = tuioClient.getTuioObjects();
    for (int i=0;i<tuioObjectList.size();i++) {

      TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);  // cast / para obtener del objeto generico uno especifico.
    if (tobj.getSymbolID()< logic.totalShape0+logic.totalShape1+logic.totalShape2){ // limitador de fiducial number   
      idF = tobj.getSymbolID();
      angleF =  tobj.getAngle();
      xF = tobj.getScreenX(width);
      yF = tobj.getScreenY(height);

      shapeType(idF);

      if (logic.fxState) {
        obj.objFxDraw ();
      }


      //      pushMatrix();

      //      popMatrix();

      switch (shapeType) {

      case 1:
        amb.draw( idF, xF, yF, angleF);
        break;    
      case 2:
        fx.draw( idF, xF, yF, angleF);
        break;
      case 0:
        obj.draw( idF, xF, yF, angleF);
        break;
      }
    }
  }
  }
  ///////////////----------------------/////////////////////



  void setFidID(int idF) {
    idF = idF;
  }

  void setFidX(float xF) {
    xF = xF;
  }

  void setFidY(float yF) {
    yF = yF;
  }
  void setAngleF(float angleF) {
    angleF = angleF;
  }


  int getFidID() {
    return idF;
  }


  float getFidX() {
    return xF;
  }

  float getFidY() {
    return yF;
  }

  float getAngleF() {
    return angleF;
  }
}
