class Obj extends Fiducials {
  // objType=  0 = n , 1 = x, 2 = y;
  color xFill, yFill, nFill;	
  color xStroke, yStroke, nStroke;	
  color xAuraFill, yAuraFill, nAuraFill;
  color objLevel[] ;	
  float objLevelF[] ;	
  color xAuraStroke, yAuraStroke, nAuraStroke;	
  color fxChange = color (360, 99,99);


  void Obj () {
  }

  void draw(int idF, float xF, float yF, float angleF) {

    xFill =     paleta.devolverPixel( 40, 80, 40 );
    yFill =     paleta.devolverPixel( 40, 100, 40 );
    nFill =     paleta.devolverPixel( 500, 400, 40 );

    switch (getObjType (idF)) {

    case 0:
      xDraw( idF, xF, yF, angleF);
      break;    
    case 1:
      yDraw( idF, xF, yF, angleF);
      break;
    case 2:
      nDraw( idF, xF, yF, angleF);
      break;
    }
  }

  void nDraw (int idF, float xF, float yF, float angleF) {
    stroke(255);

    color nAdd = blendColor(backgroundColor2, nFill, OVERLAY);
    //  color nfill =  getFxChange();
    fill(objLevel[idF]);
    pushMatrix();
    translate(xF, yF);
    rotate(angleF);
    ellipse (0,0,auraSize,auraSize);
    fill(nAdd);
    ellipse (0,0,auraSize-10,auraSize-10);
    fill (255);
 //   rect(0,0,objSize,objSize);
    popMatrix();
  //  fill(0);
  //  text(""+idF, xF, yF);
  }

  void xDraw (int idF, float xF, float yF, float angleF) {
    stroke(255);

    color xAdd = blendColor(backgroundColor2, xFill, OVERLAY);
    fill(objLevel[idF]);
    pushMatrix();
    translate(xF, yF);
    rotate(angleF);
    ellipse (0,0,auraSize,auraSize);
    fill(xAdd);
    ellipse (0,0,auraSize-10,auraSize-10);
    fill (255);
 //   rect(0,0,objSize,objSize);
    popMatrix();
   // fill(0);
   // text(""+idF, xF, yF);
  }

  void yDraw (int idF, float xF, float yF, float angleF) {
    stroke(255);

    color yAdd = blendColor(backgroundColor2, yFill, OVERLAY);
    fill(objLevel[idF]);
    pushMatrix();
    translate(xF, yF);
    rotate(angleF);
    ellipse (0,0,auraSize,auraSize);
    fill(yAdd);
    ellipse (0,0,auraSize-10,auraSize-10);
 //   fill (255);
 //   rect(0,0,objSize,objSize);
    popMatrix();
 //   fill(0);
 //   text(""+idF, xF, yF);
  }
  void objFxDraw () {
    color fxBack =  color (200, 80, 90, 70);
    backgroundColor = blendColor(backgroundColor,fxBack, ADD);
  }

  void initColor () {
    objLevel = new color[logic.totalShape0];
    for (int i = 0; i< objLevel.length; i++) {
      objLevel[i] = color (150, 99, 90, 50);
    }
        objLevelF = new float[logic.totalShape0];
    for (int i = 0; i< objLevelF.length; i++) {
      objLevelF[i] =  0;
    }
  }

  int getObjType (int _idF) {

    if ( _idF <  (logic.totalShape0/3)) {
      return  0;
    } 
    else {
      if ( _idF <  ((logic.totalShape0/3)*2)) {
        return 1;
      }
      else {
        return 2;
      }
    }
  }
}

