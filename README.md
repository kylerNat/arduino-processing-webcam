arduino-processing-webcam
=========================

An online webcam using arduino and processing

Server:
  The server recieves camera orientations from clients and sends the orientations to a serial port and to all of the clients.
  
Client:
  The client takes inputs from the user via a GUI and sends them to the server. The gui consists of a 15x15 grid with the x and y axes marked 0 through 2pi. A dot on the grid will show the most recent orintation recived from the server or the users requsted orentation.

How to run:
  1. Download and install processing https://www.processing.org/
  2. Open and run server.pde or client.pde with processing
