class Fx extends Fiducials {

  color fxFill;
  color fxStroke = color (255);
  color fxAuraFill, fxAuraStroke;
  int auraFxSize = fiducials.auraSize*2;
  color fxLevel[] ;	
  void Fx() {
  }

  void draw(int idF, float xF, float yF, float angleF) {
    fxFill =     paleta.devolverPixel( 200, 200, 5 );
    //  color fxAdd = blendColor(backgroundColor, fxFill, OVERLAY);
    stroke(fxStroke);
   // fxFill =  blendColor( fxFill,fxLevel[idF%4], BURN);
  //  fill (fxFill);  
      fill(fxLevel[idF%4]);
    pushMatrix();
    translate(xF, yF);
    rotate(angleF);
    rect (0,0,auraSize,auraSize);




    rect (0,0,auraSize-20,auraSize-20);
    //fill (fxFill);
    //rect(0,0,objSize,objSize);
    //  fxAdd = blendColor(backgroundColor, fxFill, DODGE);
    //fill (fxFill);
    //rect(0,0,objSize+10,objSize+10);

    popMatrix();
    // fill(255);
    // text(""+idF, xF, yF);
  }
  void initColor () {
    fxLevel = new color[logic.totalShape2];
    for (int i = 0; i< fxLevel.length; i++) {
      fxLevel[i] = color (150, 99, 90, 50);
    }
  }

  void drawAmount (float _xF1,float  _yF1,float  _xF2, float  yF2) {
    stroke (fxStroke);

    line (_xF1, _yF1, _xF2, yF2);
    strokeWeight(2);
  }
}

