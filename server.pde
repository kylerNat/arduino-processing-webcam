import processing.net.*;
import processing.serial.*;
Server server;
Serial serial_port;
byte data;

void setup(){
  server = new Server(this, 5204);//the port
  println(Serial.list());
  serial_port = new Serial(this, Serial.list()[0], 9600);//the serial port and baud rate
  serial_port.write((byte)0);
}

void draw(){
  Client client = server.available();
  if(client != null){
    data = (byte)client.readChar();
    server.write(data);
    serial_port.write(data);
  }
}