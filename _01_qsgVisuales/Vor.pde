import megamu.mesh.*;

class Vor {

  color xVorFill, yVorFill, nVorFill;	
  color vorStroke = color (255);	

  color [] col;

  float[][] regionCoordinates;
  boolean showVoronoi=true;

  int initPoints = 20;
  int currentPoints = initPoints;

  void Vor () {
  }

  void draw() {

    noFill();
    if(myRegions==null) return;

    // draw Voronoi

    //strokeWeight(1);
    noFill();

    for(int i=0; i<myRegions.length; i++) {


        stroke(vorStroke);
        regionCoordinates = myRegions[i].getCoords();
      
    }
  }
    // for(int i=0; i<points.length; i++) {
    //   ellipse (points[i][0],  points[i][1], 30, 30);
    // }


      void initMesh() {
      // is points array is null then initialize it
      if(points==null) initPoints();

      // save the current number of regions, so that
      // we can check if it's the same after the Voronoi
      // has been recalculated.
      int oldlength=0;
      if(myRegions!=null) oldlength=myRegions.length;

      myVoronoi = new Voronoi( points );

      myRegions = myVoronoi.getRegions();

      // if the number of regions is different than
      // before then recalculate the random colors
      col=new int[myRegions.length];
    }



    void initPoints() {
      points = new float[currentPoints][2];

      for(int i=0; i<points.length; i++) {
        if (i<(points.length/4)) {
          points[i][0] += (width/5)*i ; // first point, x
          points[i][1] += -50 ; // first point, y
        } 
        if (i<(points.length/2)) {
          points[i][0] += - 50 ; // first point, x
          points[i][1] += (height/5)*i ; // first point, y
        }
        if (i<(points.length/2)*3) {
          points[i][0] += (width/5)*i ; // first point, x
          points[i][1] += height+50 ; // first point, y
        }
        else {
          points[i][0] += width + 50 ; // first point, x
          points[i][1] += (height/5)*i ; // first point, y
        }
      }
    }
  }

