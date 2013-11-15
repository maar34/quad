import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

class OscSend {

  void OscSend() {
  }
  // ID, X, Y, Vel, Acel
  void sendBlobPosition(int idB, float xB, float yB, float motionSpeed, float motionAccel) {
    OscMessage myMessage = new OscMessage("/updateBlob");
    myMessage.add(idB);
    myMessage.add(xB);
    myMessage.add(yB);
    myMessage.add(motionSpeed);
    myMessage.add(motionAccel);
    oscP5.send(myMessage, myRemoteLocation);
  }
  // ID, X, Y
  void sendAddBlob(int idB, float xB, float yB) {
    OscMessage myMessage = new OscMessage("/addBlob");
    myMessage.add(idB);
    myMessage.add(xB);
    myMessage.add(yB);
    myMessage.add(1);
    oscP5.send(myMessage, myRemoteLocation);
  }
  // ID, X, Y
  void sendRemoveBlob(int idB, float xB, float yB) {
    OscMessage myMessage = new OscMessage("/removeBlob");
    myMessage.add(idB);
    myMessage.add(xB);
    myMessage.add(yB);
    myMessage.add(0);
    oscP5.send(myMessage, myRemoteLocation);
  }
  // ID, X, Y, ANGULO
  void sendFidPosition(int idF, float xF, float yF, float angleF, float speedF, float accelF) {
    OscMessage myMessage = new OscMessage("/updateFid");
    myMessage.add(idF);
    myMessage.add(xF);
    myMessage.add(yF); 
    myMessage.add(angleF); 
    myMessage.add(speedF); 
    myMessage.add(accelF); 
    oscP5.send(myMessage, myRemoteLocation);
  }
  // ID, 1, shapeType
  void sendAddFid(int idF) {
    OscMessage myMessage = new OscMessage("/addFid");
    myMessage.add(idF);
    myMessage.add(fiducials.shapeType(idF));
    oscP5.send(myMessage, myRemoteLocation);
  }

  // ID, 0, shapeType
  void sendRemoveFid(int idF) {
    OscMessage myMessage = new OscMessage("/removeFid");
    myMessage.add(idF);
    myMessage.add(fiducials.shapeType(idF));
    oscP5.send(myMessage, myRemoteLocation);
  }



  void auraState(int _channel, float _xB, float _yB) {
    OscMessage myMessage = new OscMessage("/auraState");
    myMessage.add( _channel);
    myMessage.add( _xB);
    myMessage.add( _yB);
    oscP5.send(myMessage, myRemoteLocation);
  }

  void auraAdd(int _channel) {
    OscMessage myMessage = new OscMessage("/auraAdd");
    myMessage.add( _channel);
    oscP5.send(myMessage, myRemoteLocation);
  }
  void auraRemove(int _channel) {
    OscMessage myMessage = new OscMessage("/auraRemove");
    myMessage.add( _channel);
    oscP5.send(myMessage, myRemoteLocation);
  }


  void loToHi(int _group, boolean _state, int _fid1, int _fid2) {
    OscMessage myMessage = new OscMessage("/loToHi");
    myMessage.add( _group);
    myMessage.add( _state);
    //   myMessage.add( _fid1);
    //   myMessage.add( _fid2);

    oscP5.send(myMessage, myRemoteLocation);
  }

  void sendBank(int _bank) {
    OscMessage myMessage = new OscMessage("/bank");
    myMessage.add( _bank);

    oscP5.send(myMessage, myRemoteLocation);
  }
  void fxLevel(int _objID, int _fxID, float _argumentValue, float _angleValue) {
    OscMessage myMessage = new OscMessage("/setFX");
    myMessage.add( _objID);
    // myMessage.add( _fxID);
    myMessage.add( _argumentValue);
    myMessage.add( _angleValue);

    oscP5.send(myMessage, myRemoteLocation);
  }
}

