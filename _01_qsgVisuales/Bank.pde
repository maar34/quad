class Bank extends Fiducials {
  boolean state;
  color activeBackColor = color (150, 99, 90, 50);
  color inactiveBackColor = color (150, 99, 90, 100);
  color activeLetterColor, inactiveLetterColor;
  boolean ruInferior = false; 
  boolean ruMedio = false; 
  boolean ruSuperior = false;
  float limite1, limite2;


  void Bank() {

    limite1= height/3;
    limite2= (height/3)*2;
  }

  void draw() {

    
    activeBackColor = color ( hueBack, 70, 10, alphaBack-40);
    inactiveBackColor = color ( hueBack, 99, 50, alphaBack);

    stroke(255);    
    fill (255, 0);
    pushMatrix();
    translate (width/2, limite1/2); 

    if (ruSuperior) { 
      fill (activeBackColor);
      rect (0, 0, width, limite1);

      fill (inactiveBackColor);
      rect (0, limite1, width, limite1);
      rect (0, limite2, width, limite1);
    }

    if (ruMedio) { 
      fill (activeBackColor);
      rect (0, limite1, width, limite1);

      fill (inactiveBackColor);
      rect (0, 0, width, limite1);
      rect (0, limite2, width, limite1);
    }

    if (ruInferior) { 
      fill (activeBackColor);
      rect (0, limite2, width, limite1);

      fill (inactiveBackColor);
      rect (0, limite1, width, limite1);
      rect (0, 0, width, limite1);
    }


    popMatrix();
  }

  void checkIn (float _y) {


    if ( _y < limite1) {
      ruInferior = false; 
      ruMedio = false; 
      ruSuperior = true;
      oscSend.sendBank(1);
    }

    if (_y> limite1 && _y<limite2) {
      ruInferior = false; 
      ruMedio = true; 
      ruSuperior = false;
       oscSend.sendBank(2);

    }

    if ( _y > limite2) {
      ruInferior = true; 
      ruMedio = false; 
      ruSuperior = false;
      oscSend.sendBank(3);

    }
  }
}

