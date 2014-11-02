import processing.net.*;
Client client;
int x, y = 0;
byte[] buffer = new byte[256];
PFont f;

void refreshGraphics(){
    background(255);
    textFont(f, 12);
    fill(0);
    textAlign(CENTER);
    for(int i = 0; i < 16; i++){
      text(nf(i*2.0/15.0, 1, 2)+"pi", i*(width*0.8)/15.0+width*0.1, height*0.92);
      text(nf(2.0-i*2.0/15.0, 1, 2)+"pi", width*0.05, i*(height*0.8)/15.0+height*0.1);
      line(i*(width*0.8)/15.0+width*0.1, height*0.1, i*(width*0.8)/15.0+width*0.1, height*0.9);
      line(width*0.1, i*(height*0.8)/15.0+height*0.1, width*0.9, i*(height*0.8)/15.0+height*0.1);
    }
    text(nf(x*2.0/15.0, 1, 2) + "pi, " + nf(y*2.0/15.0, 1, 2) + "pi", width/2.0, height*0.05);
    ellipse(x*(width*0.8)/15.0+width*0.1, y*(height*0.8)/15.0+height*0.1, 10, 10);
}

void setup(){
  size(1000, 1000);//the size of the window
  client = new Client(this, "2601:9:6580:da:1958:5110:441d:82d8", 5204);//the ip and port
  f = createFont("Arial", 16, true);
  refreshGraphics();
}

void draw(){
  if(client.available() > 0){
    int n = client.readBytes(buffer);
    if(n > 0){
      client.clear();
      x = (buffer[n-1] >> 4) & 0x0F;
      y = buffer[n-1] & 0x0F;
      refreshGraphics();
    }
  }
}

void mousePressed(){ 
  byte a = (byte)(round((mouseX-width*0.1)*15.0/(width*0.8))<<4 | round((mouseY-height*0.1)*15.0/(height*0.8)));
  client.write(a);
  x = (a >> 4) & 0x0F;//need to mask to get rid of signs
  y = a & 0x0F;
  refreshGraphics();
}
