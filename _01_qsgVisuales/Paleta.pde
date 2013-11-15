class Paleta{

  PImage imagen;

  Paleta( String nombre ){
    imagen = loadImage( nombre );
  }

  color devolverPixel( float x , float y , float alfa ){
    colorMode(HSB);
    color este = devolverPixel(x,y);
    float tinte = hue( este );
    float saturacion = saturation( este );
    float brillo = brightness( este );
    color devolver = color(tinte,saturacion,brillo,alfa);
    return devolver;
  }

  color devolverPixel( float x , float y ){
    int xx = int( map(x,0,width,0,imagen.width));
    int yy = int( map(y,0,height,0,imagen.height));
    xx = int(constrain(xx,0,imagen.width-1));
    yy = int(constrain(yy,0,imagen.height-1));

    color este = imagen.get(xx,yy);
    return este;    
  }

  void dibujar(){
    image( imagen , 0 , 0 );
  }

}


