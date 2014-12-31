import processing.net.*;
import processing.serial.*;
Server server;
Serial serial_port;
byte data;
boolean sent = false;

void setup(){
  server = new Server(this, 5206);//the port
  //println(Serial.list()); //For debug purposes only
  serial_port = new Serial(this, Serial.list()[0], 9600);//the serial port and baud rate
  serial_port.write((byte)0);
}

void draw(){
  Client client = server.available();
  if(client != null){
    data = (byte)client.readChar();
    println(data);
    server.write(data);
    serial_port.write(data);
  }
  if((millis()/1000)%2==1){
    if(!sent){
      server.write(data);
      sent = true;
    }
  }
  else{
    sent = false;
  }
}
