arduino-processing-webcam
=========================

an online webcam using arduino and processing

Server:
  The server recieves camera orientations from clients and sends the orientations to a serial port and to all of the clients.
  
Client:
  The client takes inputs from the user via a GUI and sends them to the server. Each point on the grid corisponds to the latitude/longitude of the camera. A dot on the grid will show the most recent orintation recived from the server or the users requsted orentation.

How to run:
  1. Download and install processing https://www.processing.org/
  2. Open and run server.pde or client.pde with processing
