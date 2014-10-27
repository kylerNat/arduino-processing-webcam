import processing.net.*;
Client why_an_object;
int x, y = 0;
byte[] buffer = new byte[256];
PFont f;

void refreshGraphics(){
    background(255);
    textFont(f, 12);
    fill(0);
    textAlign(CENTER);
    for(int i = 0; i < 16; i++){
      text(i*180.0/15.0, i*(width*0.8)/15.0+width*0.1, height*0.92);
      text(180.0-i*180.0/15.0, width*0.05, i*(height*0.8)/15.0+height*0.1);
      line(i*(width*0.8)/15.0+width*0.1, height*0.1, i*(width*0.8)/15.0+width*0.1, height*0.9);
      line(width*0.1, i*(height*0.8)/15.0+height*0.1, width*0.9, i*(height*0.8)/15.0+height*0.1);
    }
    text(x*180.0/15.0 + ", " + y*180.0/15.0, width/2.0, height*0.05);
    ellipse(x*(width*0.8)/15.0+width*0.1, -y*(height*0.8)/15.0+height*0.9, 10, 10);
}

void setup(){
  size(1000, 1000);//the size of the window
  why_an_object = new Client(this, "10.0.1.11", 5204);//the ip and port
  f = createFont("Arial", 16, true);
  refreshGraphics();
}

void draw(){
  if(why_an_object.available() > 0){
    int n = why_an_object.readBytes(buffer);
    if(n > 0){
      why_an_object.clear();
      x = (buffer[n-1] >> 4) & 0x0F;
      y = buffer[n-1] & 0x0F;
      refreshGraphics();
    }
  }
}

void mousePressed(){ 
  byte a = (byte)(round((mouseX-width*0.1)*15.0/(width*0.8))<<4 | round((height*0.9-mouseY)*15.0/(height*0.8)));
  why_an_object.write(a);
  x = (a >> 4) & 0x0F;//need to mask to get rid of signs
  y = a & 0x0F;
  refreshGraphics();
}
