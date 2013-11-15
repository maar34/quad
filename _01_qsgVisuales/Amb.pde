class Amb extends Fiducials {

  color loFill, hiFill, loToHiFill, loToHiFill2;
  color ambStroke = color (255);
  color auraStroke;
  color ambLevel[] ;	
  int ambType; // ambType = 0 =loFI, ambType = 1 =hiFI  

  int  idG1, idG2, idG3, idG4;
  float  xG1, xG2, xG3, xG4, yG1, yG2, yG3, yG4;
  // boolean groupON1, groupON2 = false;

  void Amb() {
  }

  void draw(int idF, float xF, float yF, float angleF) {

    //println (groupON1+ " " + groupON2);

    loFill =     paleta.devolverPixel( 10, 80, 40 );
    hiFill =     paleta.devolverPixel( 100, 100, 40 );
    loToHiFill =     paleta.devolverPixel( 200, 800, 40 );
    loToHiFill2 =     paleta.devolverPixel( 400, 100, 40 );
    switch (getAmbType (idF)) {

    case 0:
      loDraw( idF, xF, yF, angleF);
      break;    
    case 1:
      hiDraw( idF, xF, yF, angleF);
      break;
    }

    if (logic.groupState[0] != -1 ) {
      drawGroup1();
    }
    if (logic.groupState[1] != -1 ) {
      drawGroup2();
    }
  if (logic.groupState[1] != -1 || logic.groupState[0] != -1) {

      Vector tuioObjectList = tuioClient.getTuioObjects();
      for (int i=0; i< tuioObjectList.size(); i++) {
        TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);

        if (tobj.getSymbolID()== amb.idG1) {

          xG1= tobj.getScreenX(width);
          yG1= tobj.getScreenY(height);
        }  
        if (tobj.getSymbolID()== amb.idG2) {

          xG2= tobj.getScreenX(width);
          yG2= tobj.getScreenY(height);
        }  
        if (tobj.getSymbolID()== amb.idG3) {

          xG3= tobj.getScreenX(width);
          yG3= tobj.getScreenY(height);
        }  
        if (tobj.getSymbolID()== amb.idG4) {

          xG4= tobj.getScreenX(width);
          yG4= tobj.getScreenY(height);
        }
      }
      //   println("1"+" "+amb.idG1+" "+amb.idG2);

      //   println("2"+" "+amb.idG3+" "+amb.idG4);
    }
  
  }
    void loDraw(int idF, float xF, float yF, float angleF) {

      //color loAdd = blendColor(backgroundColor, loFill, OVERLAY);
      stroke(ambStroke);
      fill(loFill);
      pushMatrix();
      translate(xF, yF);
      rotate(angleF);
      ellipse (0, 0, auraSize, auraSize);
      fill(ambLevel[idF%6]);
      //fill (loFill);
      ellipse(0, 0, auraSize-20, auraSize-20);    

      // rect(0,0,objSize+20,objSize+20);
      popMatrix();
      //    fill(255);
      //    text(""+idF, xF, yF);
    }

    void hiDraw(int idF, float xF, float yF, float angleF) {
      // color hiAdd = blendColor(backgroundColor, hiFill, OVERLAY);
      stroke(ambStroke);
      fill(hiFill);
      pushMatrix();
      translate(xF, yF);
      rotate(angleF);
      ellipse (0, 0, auraSize, auraSize);
      //fill (hiFill);
      fill(ambLevel[idF%6]);
      ellipse(0, 0, auraSize-20, auraSize-20);    

      //rect(0,0,objSize+20,objSize+20);
      popMatrix();          
      //    fill(255);
      //    text(""+idF, xF, yF);
    }


    void drawGroup1() {


      float midX=  xG1+(( xG2- xG1)/2.0);
      float midY= yG1+(( yG2- yG1)/2.0);
      pushMatrix();
      noStroke();
      fill (ambLevel[4]);
      translate(midX, midY);
      //rotate(angleF);
      //println ("mid1="+midX);

      ellipse (0, 0, auraSize*2, auraSize*2);
      popMatrix();
    }

    void drawGroup2() {

      float midX2=  xG3+(( xG4- xG3)/2.0);
      float midY2= yG3+(( yG4- yG3)/2.0);
      pushMatrix();
      noStroke();
      fill (ambLevel[5]);
      translate(midX2, midY2);
      //rotate(angleF);
      //println ("mid2="+midX2);

      ellipse (0, 0, auraSize*2, auraSize*2);
      popMatrix();
    }
    void initColor () {
      ambLevel = new color[logic.totalShape1+2];
      for (int i = 0; i< ambLevel.length; i++) {
        ambLevel[i] = color (150, 99, 90, 50);
      }
    }

    int getAmbType (int _idF) {

      if ( _idF <  (logic.totalShape0+(logic.totalShape1 /2))) {

        return  0;
      } 
      else {
        return 1;
      }
    }
  }

