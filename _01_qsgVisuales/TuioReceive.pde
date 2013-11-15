import TUIO.*;
TuioProcessing tuioClient;



void addTuioObject(TuioObject tobj) {
  if (tobj.getSymbolID( )< logic.totalShape0+logic.totalShape1+logic.totalShape2) {
    oscSend.sendAddFid(tobj.getSymbolID());
    
  }
    if (tobj.getSymbolID() == 18) {
    bank.checkIn (tobj.getScreenY(height));
    bank.state= true;
  }

  //  fiducials.fidCheck(tobj.getSymbolID());
}
void updateTuioObject (TuioObject tobj) {

  if (tobj.getSymbolID()< logic.totalShape0+logic.totalShape1+logic.totalShape2) {

    if (logic.shapeType(tobj.getSymbolID())==1) {
      logic.groupCheckIn ( tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height) );
    }

    if (logic.shapeType(tobj.getSymbolID())==2) {
      logic.fxFidCheck ( tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height), tobj.getMotionSpeed() );
    }
    oscSend.sendFidPosition( tobj.getSymbolID(), tobj.getX(), tobj.getY(), tobj.getAngle(), tobj.getMotionSpeed(), tobj.getMotionAccel());
    fiducials.fidCheck(  tobj.getSymbolID(), tobj.getX(), tobj.getY());
    if (myRegions==null) return;
    if (tobj.getSymbolID()<points.length) {
      points[tobj.getSymbolID()][0]=tobj.getScreenX(width);
      points[tobj.getSymbolID()][1]=tobj.getScreenY(height);
      vor.initMesh();
    }
  }
    if (tobj.getSymbolID() == 18) {
    bank.checkIn (tobj.getScreenY(height));
    bank.state= true;
  }
}

void removeTuioObject(TuioObject tobj) {
  oscSend.sendRemoveFid(tobj.getSymbolID());
  logic.groupCheckOut ( tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height) );

  if (tobj.getSymbolID() == 18) bank.state = false;
  
}

void addTuioCursor(TuioCursor tcur) {

  blobs.setBlobID (tcur.getCursorID());
  blobs.setBlobX (tcur.getScreenX(width));
  blobs.setBlobY (tcur.getScreenY(height));
  oscSend.sendAddBlob(tcur.getCursorID(), tcur.getX(), tcur.getY());
  Vector tuioCursorList = tuioClient.getTuioCursors();

  fiducials.auraCheckIn ((tcur.getCursorID()), (tcur.getScreenX(width)), tcur.getScreenY(height));
  logic.blobCheckIn(tcur.getCursorID());
  blobs.blobColorIn(tcur.getCursorID());
}
void updateTuioCursor (TuioCursor tcur) {
  oscSend.sendBlobPosition(tcur.getCursorID(), tcur.getX(), tcur.getY(), tcur.getMotionSpeed(), tcur.getMotionAccel());
  logic.blobCheck(tcur.getCursorID(), tcur.getX(), tcur.getY());
}


void removeTuioCursor(TuioCursor tcur) {
  oscSend.sendRemoveBlob(tcur.getCursorID(), tcur.getX(), tcur.getY());
  logic.blobCheckOut(tcur.getCursorID());

  fiducials.auraCheckOut (tcur.getCursorID());
}

void refresh(TuioTime bundleTime) {
  redraw();
}

