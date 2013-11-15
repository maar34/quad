

void setObjLevel(int _objID, float _objLevel) {
  switch (_objID) {
  case 0:
  obj.objLevel[0] =  color (_objLevel, 100, 100, 100);
  obj.objLevelF[0] =  _objLevel;
    break; 
  case 1:
  obj.objLevel[1] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[1] =  _objLevel;
    break;    
  case 2:
  obj.objLevel[2] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[2] =  _objLevel;
  
    break;
  case 3:
  obj.objLevel[3] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[3] =  _objLevel;
    break;
  case 4:
  obj.objLevel[4] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[4] =  _objLevel;
    break;
  case 5:
  obj.objLevel[5] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[5] =  _objLevel;
    break;
  case 6:
  obj.objLevel[6] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[6] =  _objLevel;
    break;
  case 7:
  obj.objLevel[7] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[7] =  _objLevel;
    break;
  case 8:
  obj.objLevel[8] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[8] =  _objLevel;
    break;
  case 9:
  obj.objLevel[9] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[9] =  _objLevel;
    break;
  case 10:
  obj.objLevel[10] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[10] =  _objLevel;
    break;
  case 11:
  obj.objLevel[11] =  color (_objLevel, 100, 100, 100);
   obj.objLevelF[11] =  _objLevel;
    break;
  }
}

void setAmbLevel(int _ambID, float _ambLevel) {
  switch (_ambID) {
  case 0:
  amb.ambLevel[0] =  color (_ambLevel, 100, 100, 100);
    break; 
  case 1:
  amb.ambLevel[1] =  color (_ambLevel, 100, 100, 100);
    break;    
  case 2:
  amb.ambLevel[2] =  color (_ambLevel, 100, 100, 100);
    break;
  case 3:
  amb.ambLevel[3] =  color (_ambLevel, 100, 100, 100);
    break;
  case 4:
  amb.ambLevel[4] =  color (_ambLevel, 100, 100, 40);
    break;
  case 5:
  amb.ambLevel[5] =  color (_ambLevel, 100, 100, 40);
    break;
  }
}

void setFxLevel(int _fxID, float _fxLevel) {
  switch (_fxID) {
  case 0:
  fx.fxLevel[0] =  color (_fxLevel, 100, 100, 100);
    break; 
  case 1:
  fx.fxLevel[1] =  color (_fxLevel, 100, 100, 100);
    break;    
  case 2:
  fx.fxLevel[2] =  color (_fxLevel, 100, 100, 100);
    break;
  case 3:
  fx.fxLevel[3] =  color (_fxLevel, 100, 100, 100);
    break;
  }
}
void setProgramData(float _data) {

  equilibrium = _data;
 
}
void oscEvent(OscMessage theOscMessage) {
  /*if(theOscMessage.isPlugged()==false) {
       println("### received an osc message.");
       println("### addrpattern\t"+theOscMessage.addrPattern());
      println("### typetag\t"+theOscMessage.typetag());
  }*/
}
