class Logic {


  int shapeType = 1; 
  int totalShape0 = 12; // 0-3
  int totalShape1 = 4;// 4-15
  int totalShape2 = 4;//15-19
  boolean fxState;

  int aura;
  int auraID=-1;
  int [][] auraCounter; // objID , blobNum, auraID

  int oldID1, oldID2 = 0;

  int [] groupState;

  PVector v1, v2;

  boolean  horizontal, vertical, horizontalG, verticalG;

  void Logic() {
  }


  int shapeType(int idF) {
    // Asignacion de shapeType dependiendo de fiducial ID;
    if (idF < totalShape0 ) {
      shapeType = 0;
    }
    else {
      if (idF >= totalShape0 && idF < totalShape0+totalShape1) {
        shapeType = 1;
      }
      else {

        shapeType = 2;
      }
    }
    return shapeType;
  }



  ///////////////----------------------/////////////////////

  boolean auraON(  float xB, float yB, float _xF, float _yF) {
    // Asignacion de shapeType dependiendo de fiducial ID;
    horizontal = false;
    vertical = false;
    if (xB < _xF+(fiducials.auraSize/2) && xB > _xF-(fiducials.auraSize/2) ) {
      horizontal = true;
    }
    if (yB < _yF+(fiducials.auraSize/2) && yB > _yF-(fiducials.auraSize/2)) {
      vertical = true;
    }
    if (vertical && horizontal) {
      return true;
    }
    else {
      return  false;
    }
  }

  int groupArea(  float _xF1, float _yF1, float _xF2, float _yF2) {
    // Asignacion de shapeType dependiendo de fiducial ID;
    horizontalG = false;
    verticalG = false;
    if (_xF1 < _xF2+(fiducials.auraSize*.75) && _xF1 > _xF2-(fiducials.auraSize*.75) ) {
      horizontalG = true;
    }
    if (_yF1 < _yF2+(fiducials.auraSize*.75) && _yF1 > _yF2-(fiducials.auraSize*.75)) {
      verticalG = true;
    }
    if (verticalG && horizontalG) {
      return 1;
    }
    else {
      return  -1;
    }
  }

  ///////////////----------------------/////////////////////

  void groupCheckIn (int _idF1, float _xF1, float _yF1) {

    //  amb.groupState1 =false;
    Vector tuioObjectList = tuioClient.getTuioObjects();
    for (int i=0; i< tuioObjectList.size(); i++) {
      TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
      if ( tobj.getSymbolID() != _idF1 && shapeType(tobj.getSymbolID())==1) {

        if (amb.getAmbType(tobj.getSymbolID()) != amb.getAmbType(_idF1)) {

          if ( groupArea ( _xF1, _yF1, tobj.getScreenX(width), tobj.getScreenY(height)) == 1) {


            if ( groupState[0] == -1  ) {

              groupState[0] = _idF1*tobj.getSymbolID();

              oscSend.loToHi ( 1, true, _idF1, tobj.getSymbolID() );
              oscSend.sendRemoveFid(_idF1);
              oscSend.sendRemoveFid( tobj.getSymbolID());

              amb.idG1 = _idF1;
              amb.idG2 = tobj.getSymbolID();

            }  

   /*         if (tobj.getSymbolID() == amb.idG1 || tobj.getSymbolID()== amb.idG2 ) {

              amb.xG1= _xF1;
              amb.yG1=_yF1;
              amb.xG2=  tobj.getScreenX(width);
              amb.yG2=tobj.getScreenY(height); 
             // println("2"+" "+_xF1);
            }*/


            if ( groupState[1] == -1 && groupState[0] != _idF1*tobj.getSymbolID()) {

              groupState[1] = _idF1*tobj.getSymbolID();
              oscSend.loToHi ( 2, true, _idF1, tobj.getSymbolID());
              oscSend.sendRemoveFid(_idF1);
              oscSend.sendRemoveFid( tobj.getSymbolID());

              amb.idG3 = _idF1;
              amb.idG4 = tobj.getSymbolID();
              

            }

          /*  if (tobj.getSymbolID()== amb.idG3 ||tobj.getSymbolID()== amb.idG4 ) {

              amb.xG3= _xF1;
              amb.yG3=_yF1;
              amb.xG4= tobj.getScreenX(width);
              amb.yG4= tobj.getScreenY(height);
            }*/

            oldID1 = groupState[0];
            oldID2 = groupState[1];
          } 
          else {
            if ( groupState[0] != -1 && groupState[0] == _idF1*tobj.getSymbolID() ) {
              oscSend.loToHi ( 1, false, _idF1, tobj.getSymbolID() );
              oscSend.sendAddFid(_idF1);
              oscSend.sendAddFid( tobj.getSymbolID());
              groupState[0] = -1;
              amb.idG1 = 0;
              amb.idG2 = 0;
            }
            if ( groupState[1] != -1 && groupState[1] == _idF1*tobj.getSymbolID() ) {
              oscSend.loToHi ( 2, false, _idF1, tobj.getSymbolID());
              oscSend.sendAddFid(_idF1);
              oscSend.sendAddFid( tobj.getSymbolID());
              groupState[1] = -1;
              amb.idG3 = 0;
              amb.idG4 = 0;
            }
          }
        }
      }
    }
  }
  void groupCheckOut (int _idF1, float _xF1, float _yF1) {

    Vector tuioObjectList = tuioClient.getTuioObjects();
    for (int i=0; i< tuioObjectList.size(); i++) {
      TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
      if ( tobj.getSymbolID() != _idF1 && shapeType(tobj.getSymbolID())==1) {

        if (amb.getAmbType(tobj.getSymbolID()) != amb.getAmbType(_idF1)) {


          if ( groupState[0] != -1 && groupState[0] == _idF1*tobj.getSymbolID() ) {
            oscSend.loToHi ( 1, false, _idF1, tobj.getSymbolID() );
            //oscSend.sendAddFid(_idF1);
            if (groupState[0] ==-1) {
              oscSend.sendAddFid( tobj.getSymbolID());
            }
            groupState[0] = -1;
              amb.idG1 = 0;
              amb.idG2 = 0;
          }
          if ( groupState[1] != -1 && groupState[1] == _idF1*tobj.getSymbolID() ) {
            oscSend.loToHi ( 2, false, _idF1, tobj.getSymbolID());
            //oscSend.sendAddFid(_idF1);
            if (groupState[1] ==-1) {

              oscSend.sendAddFid( tobj.getSymbolID());
            }
            groupState[1] = -1;
              amb.idG3 = 0;
              amb.idG4 = 0;
          }
        }
      }
    }
  }


  //-------------------------------------------------------------------


  void fxFidCheck (int _idF1, float _xF1, float _yF1, float speed) {

    Vector tuioObjectList = tuioClient.getTuioObjects();
    for (int i=0; i< tuioObjectList.size(); i++) {
      TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i); 
      if ( tobj.getSymbolID() != _idF1 && shapeType(tobj.getSymbolID())!=2 && shapeType(tobj.getSymbolID())!=1) { //si el objeto es diferente a mi y mi grupo (FX)


        v1 = new PVector(tobj.getScreenX(width), tobj.getScreenY(height));
        v2 = new PVector(_xF1, _yF1); 

        float distance = v1.dist(v2);
        float a = PVector.angleBetween(v1, v2);

        distance = map (distance, 0, fx.auraFxSize, 1, 0);

        //  ("estoy aca"+ " "+ _idF1+ " "+ tobj.getSymbolID()+ " "+ distance+ " "+ degrees (a));


        if ( distance > 0 ) {

          oscSend.fxLevel(tobj.getSymbolID(), _idF1, distance, a);  
          stroke (255);
          line (v1.x, v1.y, v2.x, v2.y);
          // bezier (v2.x-20, v2.y, v2.x+20, v2.y, v1.x-20 , v1.y, v1.x+20 , v1.y);
          //fx.drawAmount (  v2.x, v2.y, v1.x , v1.y ) ;
        }

        if ( speed != 0  ) {
          fxState = true;
        }   
        else {
          fxState = false;
        }
      }
    }
  }

  void auraCheckIn (int _idB, float _xB, float _yB) {
    auraID = -1;
    Vector tuioObjectList = tuioClient.getTuioObjects();

    for (int i=0;i<tuioObjectList.size();i++) 
    {
      TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);
      if ( auraON ( _xB, _yB, tobj.getScreenX(width), tobj.getScreenY(height)) &&  (tobj.getSymbolID() < totalShape0) )
      {      
        auraID = tobj.getSymbolID();
        blobs.auraB = _idB;
      }
    }
    if (auraID != -1) {

      if (auraCounter[auraID][0] == -1) {
        auraCounter[auraID][0] = blobs.auraB; 
        //println ((auraID+1)+(auraID*2));
        //  oscSend.auraAdd ((auraID+1)+(auraID*2), _xB/width, _yB/height);
      }
      else {
        if (auraCounter[auraID][1] == -1) {
          auraCounter[auraID][1] = blobs.auraB; 
          //   oscSend.auraAdd ((auraID+2)+(auraID*2), _xB/width, _yB/height);
        }

        else {
          if (auraCounter[auraID][2] == -1) {
            auraCounter[auraID][2] = blobs.auraB; 
            //     oscSend.auraAdd ((auraID+3)+(auraID*2), _xB/width, _yB/height);
          }
        }
      }
      //       println (auraID + " " + blobs.auraB);
    }
  }
  void auraCheckOut (int _idB) {

    for (int i=0;i<totalShape0;i++) {

      if (auraCounter[i][0] == _idB) {
        auraCounter[i][0] = -1;
        //  oscSend.auraRemove ((i+1)+(i*2));
      }
      if (auraCounter[i][1] == _idB) {
        auraCounter[i][1] = -1;
        //  oscSend.auraRemove ((i+2)+(i*2));
      }

      if (auraCounter[i][2] == _idB) {
        auraCounter[i][2] = -1;
        //  oscSend.auraRemove ((i+3)+(i*2));
      }
    }
  }
  ///////////////----------------------/////////////////////



  void fidCheck( int _idF, float _xF, float _yF) {
    //  for (int i=0;i<totalShape0;i++) {

    if (auraCounter[_idF][0] == -1) {
      oscSend.auraState ((_idF+1)+(_idF*2), _xF, _yF);
    }
    if (auraCounter[_idF][1] == -1) {
      oscSend.auraState ((_idF+2)+(_idF*2), _xF, _yF);
    }

    if (auraCounter[_idF][2] == -1) {
      oscSend.auraState ((_idF+3)+(_idF*2), _xF, _yF);
    }

    //  }
  }

  void fidCheck( int _idF) {
    //  for (int i=0;i<totalShape0;i++) {

    if (auraCounter[_idF][0] == -1) {
      oscSend.auraAdd ((_idF+1)+(_idF*2));
    }
    if (auraCounter[_idF][1] == -1) {
      oscSend.auraAdd ((_idF+2)+(_idF*2));
    }

    if (auraCounter[_idF][2] == -1) {
      oscSend.auraAdd ((_idF+3)+(_idF*2));
    }
  }

  void initCounter () {
    auraCounter = new int[totalShape0][3];

    for (int i=0;i<totalShape0;i++) {
      auraCounter[i][0] = -1;
      auraCounter[i][1] = -1; 
      auraCounter[i][2] = -1;
    }
  }

  void initGroup () {
    groupState = new int[2];

    for (int i=0;i<groupState.length;i++) {
      groupState [i] = -1;
    }
  }



  void blobCheck(int _idB, float _xB, float _yB) {
    for (int i=0;i<fiducials.totalShape0;i++) {

      if (fiducials.auraCounter[i][0] == _idB) {
        oscSend.auraState ((fiducials.auraID+1)+(fiducials.auraID*2), _xB, _yB);
      }
      if (fiducials.auraCounter[i][1] == _idB) {
        oscSend.auraState ((fiducials.auraID+2)+(fiducials.auraID*2), _xB, _yB);
      }

      if (fiducials.auraCounter[i][2] == _idB) {
        oscSend.auraState ((fiducials.auraID+3)+(fiducials.auraID*2), _xB, _yB);
      }
    }
  }

  void blobCheckIn(int _idB) {
    for (int i=0;i<fiducials.totalShape0;i++) {

      if (fiducials.auraCounter[i][0] == _idB) {
        oscSend.auraAdd ((fiducials.auraID+1)+(fiducials.auraID*2));
      }
      if (fiducials.auraCounter[i][1] == _idB) {
        oscSend.auraAdd ((fiducials.auraID+2)+(fiducials.auraID*2));
      }

      if (fiducials.auraCounter[i][2] == _idB) {
        oscSend.auraAdd ((fiducials.auraID+3)+(fiducials.auraID*2));
      }
    }
  }

  void blobCheckOut(int _idB) {
    for (int i=0;i<fiducials.totalShape0;i++) {

      if (fiducials.auraCounter[i][0] == _idB) {
        oscSend.auraRemove ((fiducials.auraID+1)+(fiducials.auraID*2));
      }
      if (fiducials.auraCounter[i][1] == _idB) {
        oscSend.auraRemove ((fiducials.auraID+2)+(fiducials.auraID*2));
      }

      if (fiducials.auraCounter[i][2] == _idB) {
        oscSend.auraRemove ((fiducials.auraID+3)+(fiducials.auraID*2));
      }
    }
  }

  void setFxState(boolean _fxState) {
    _fxState = fxState;
  }
}

