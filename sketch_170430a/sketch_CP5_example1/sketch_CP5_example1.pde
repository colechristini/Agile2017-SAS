// A Simple Carnivore Client -- print packets in Processing console
//
// Note: requires Carnivore Library for Processing (http://r-s-g.org/carnivore)
//
// + Windows:  first install winpcap (http://winpcap.org)
// + Mac:      first open a Terminal and execute this commmand: sudo chmod 777 /dev/bpf*
//             (must be done each time you reboot your mac)

import org.rsg.carnivore.*;
import org.rsg.lib.Log;

CarnivoreP5 c;
String[] packets = new String(2);
void setup(){

  Log.setDebug(true); // Uncomment for verbose mode
  c = new CarnivoreP5(this);
  //c.setVolumeLimit(4); //limit the output volume (optional)
  //c.setShouldSkipUDP(true); //tcp packets only (optional)
}

void draw(){}

// Called each time a new packet arrives
void packetEvent(CarnivorePacket p){
  packets[1]="(" + p.strTransportProtocol + " packet) " + p.senderSocket() + " > " + p.receiverSocket;
  saveStrings("Packets.txt", packets);
  //println("Payload: " + p.ascii());
  //println("---------------------------\n");
}
