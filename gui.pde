/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void panel4_Click1(GPanel source, GEvent event) { //_CODE_:panel4:963415:
  //println("panel4 - GPanel event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:panel4:963415:

public void checkbox1_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox1:419813:
  //println("checkbox1 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if(checkbox1.isSelected())
  {
    initLeapMotion();
    LEAPMOTION_EN = true;
    if(checkbox2.isSelected()) {checkbox2.setSelected(false); exitCamera(); CAMERA_EN = false;}
  }
  else {LEAPMOTION_EN = false;}
} //_CODE_:checkbox1:419813:

public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:dropList1:788203:
  //println("dropList1 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  int i = dropList1.getSelectedIndex();
  myPort.clear();
  myPort.stop();
  myPort = new Serial(this, Serial.list()[i], 9600);
  myPort.bufferUntil('\n');
} //_CODE_:dropList1:788203:

public void dropList2_click1(GDropList source, GEvent event) { //_CODE_:dropList2:984071:
  //println("dropList2 - GDropList event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:dropList2:984071:

public void checkbox2_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox2:428528:
  //println("checkbox2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if(checkbox2.isSelected())
  {
    initCamera();
    CAMERA_EN = true;
    if(checkbox1.isSelected()) {checkbox1.setSelected(false);LEAPMOTION_EN = false;}
  }
  else {CAMERA_EN = false; exitCamera();}
} //_CODE_:checkbox2:428528:

public void slider1_change1(GSlider source, GEvent event) { //_CODE_:slider1:888414:
  UPDATE_EN = true;
  //println("slider1 - GSlider event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:slider1:888414:

public void knob1_turn1(GKnob source, GEvent event) { //_CODE_:knob1:959975:
  UPDATE_EN = true;
  //println("knob1 - GKnob event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:knob1:959975:

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:548450:
  UPDATE_EN = true;
  //println("button1 - GButton event occured " + System.currentTimeMillis()%10000000 );
  if(suctionCup == 0x01)
  {
    button1.setText("Release");
    button1.setTextBold();
    suctionCup = 0x02;
  }
  else
  {
    button1.setText("Catch");
    button1.setTextBold();
    suctionCup = 0x01;
  }
} //_CODE_:button1:548450:

public void slider2d2_change1(GSlider2D source, GEvent event) { //_CODE_:slider2d2:263094:
  UPDATE_EN = true;

  //println("slider2d2 - GSlider2D event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:slider2d2:263094:

public void imgButton1_click1(GImageButton source, GEvent event) { //_CODE_:imgButton1:244790:
  //println("imgButton1 - GImageButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgButton1:244790:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:944556:
    reset();
    setUIPos(0,0,0,0);
    button1.setText("Release");
    button1.setTextBold();
    suctionCup = 0x02;
    
  //println("button3 - GButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:button3:944556:

public void imgButton2_click1(GImageButton source, GEvent event) { //_CODE_:imgButton2:367980:
  //println("imgButton2 - GImageButton event occured " + System.currentTimeMillis()%10000000 );
} //_CODE_:imgButton2:367980:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("uArm Control Panel");
  panel4 = new GPanel(this, 665, 260, 320, 230, "Setting");
  panel4.setText("Setting");
  panel4.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  panel4.setOpaque(true);
  panel4.addEventHandler(this, "panel4_Click1");
  checkbox1 = new GCheckbox(this, 11, 125, 150, 25);
  checkbox1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox1.setText(" Leap Motion Control");
  checkbox1.setTextBold();
  checkbox1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  checkbox1.setOpaque(false);
  checkbox1.addEventHandler(this, "checkbox1_clicked1");
  //Leap motion Gesture control
  checkbox_gesture_lock = new GCheckbox(this, 170, 125, 150, 25);
  checkbox_gesture_lock.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_gesture_lock.setText(" Circle Gesture Lock");
  checkbox_gesture_lock.setTextBold();
  checkbox_gesture_lock.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  checkbox_gesture_lock.setOpaque(false);
  checkbox_gesture_lock.addEventHandler(this, "checkbox_gesture_lock_clicked");
  panel4.addControl(checkbox_gesture_lock);
  //leap motion Gesture control
  dropList1 = new GDropList(this, 10, 35, 300, 210, 10);
  dropList1.setItems(loadStrings("list_788203"), 0);
  dropList1.addEventHandler(this, "dropList1_click1");
  dropList2 = new GDropList(this, 10, 70, 300, 66, 3);
  dropList2.setItems(loadStrings("list_984071"), 0);
  dropList2.addEventHandler(this, "dropList2_click1");
  checkbox2 = new GCheckbox(this, 11, 150, 300, 25);
  checkbox2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox2.setText(" Camera Control (Test)");
  checkbox2.setTextBold();
  checkbox2.setOpaque(false);
  checkbox2.addEventHandler(this, "checkbox2_clicked1");
  panel4.addControl(checkbox1);
  panel4.addControl(dropList1);
  panel4.addControl(dropList2);
  panel4.addControl(checkbox2);
  slider1 = new GSlider(this, 85, 90, 350, 80, 20.0);
  slider1.setShowValue(true);
  slider1.setShowLimits(true);
  slider1.setTextOrientation(G4P.ORIENT_LEFT);
  slider1.setRotation(PI/2, GControlMode.CORNER);
  slider1.setLimits(0, 150, -180);
  slider1.setEasing(8.0);
  slider1.setNumberFormat(G4P.INTEGER, 0);
  slider1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "slider1_change1");
  knob1 = new GKnob(this, 725, 52, 200, 200, 0.8);
  knob1.setTurnRange(180, 0);
  knob1.setTurnMode(GKnob.CTRL_ANGULAR);
  knob1.setShowArcOnly(true);
  knob1.setOverArcOnly(true);
  knob1.setIncludeOverBezel(false);
  knob1.setShowTrack(false);
  knob1.setLimits(0.0, -90.0, 90.0);
  knob1.setShowTicks(true);
  knob1.setEasing(10.0);
  knob1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  knob1.setOpaque(false);
  knob1.addEventHandler(this, "knob1_turn1");
  button1 = new GButton(this, 735, 190, 180, 50);
  button1.setText("Release");
  button1.setTextBold();
  button1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  button1.addEventHandler(this, "button1_click1");
  label1 = new GLabel(this, 509, 32, 164, 22);
  label1.setTextAlign(GAlign.LEFT, GAlign.TOP);
  label1.setText("Notice: Polar coordinates");
  label1.setTextBold();
  label1.setOpaque(false);
  slider2d2 = new GSlider2D(this, 85, 50, 520, 390);
  slider2d2.setLimitsX(0.0, -90.0, 90.0);
  slider2d2.setLimitsY(210.0, 210.0, 0.0);
  slider2d2.setNumberFormat(G4P.INTEGER, 0);
  slider2d2.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  slider2d2.setOpaque(true);
  slider2d2.addEventHandler(this, "slider2d2_change1");
  imgButton1 = new GImageButton(this, 85, 20, 160, 18, new String[] { "logo.png", "logo.png", "logo.png" } );
  imgButton1.addEventHandler(this, "imgButton1_click1");
  button3 = new GButton(this, 935, 20, 40, 30);
  button3.setText("Reset");
  button3.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  button3.addEventHandler(this, "button3_click1");
  imgButton2 = new GImageButton(this, 25, 12, 40, 40, new String[] { "LOGO-50.png", "LOGO-50.png", "LOGO-50.png" } );
  imgButton2.addEventHandler(this, "imgButton2_click1");
  label2 = new GLabel(this, 275, 32, 65, 20);
  label2.setText("Rotation:");
  label2.setTextBold();
  label2.setOpaque(false);
  label3 = new GLabel(this, 385, 32, 65, 20);
  label3.setText("Stretch:");
  label3.setTextBold();
  label3.setOpaque(false);
  label4 = new GLabel(this, 335, 32, 40, 20);
  label4.setText("0");
  label4.setTextBold();
  label4.setOpaque(false);
  label5 = new GLabel(this, 440, 32, 40, 20);
  label5.setText("0");
  label5.setTextBold();
  label5.setOpaque(false);
  label6 = new GLabel(this, 765, 32, 80, 20);
  label6.setText("Hand Angle: ");
  label6.setTextBold();
  label6.setOpaque(false);
  label7 = new GLabel(this, 845, 32, 50, 20);
  label7.setText("0");
  label7.setTextBold();
  label7.setOpaque(false);
  label8 = new GLabel(this, 785, 172, 80, 20);
  label8.setText("Grab");
  label8.setTextBold();
  label8.setOpaque(false);
  label9 = new GLabel(this, 12, 65, 65, 20);
  label9.setText("Height:");
  label9.setTextBold();
  label9.setOpaque(false);
  
  // socket version
  tf_ip_port = new GLabel(this,10, 100, 300, 20);
  panel4.addControl(tf_ip_port);
  tf_ip_port.setText(ip+":"+port);
  tf_ip_port.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  // tf_ip_port.setEnabled(false);
  cb_socket = new GCheckbox(this, 11, 175, 300, 25);
  cb_socket.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  cb_socket.setText(" Network Transfer");
  cb_socket.setTextBold();
  cb_socket.setOpaque(false);
  cb_socket.addEventHandler(this, "cb_socket_clicked");
   panel4.addControl(cb_socket);
   
   // myo control
   
  checkbox_myo = new GCheckbox(this, 11, 200, 300, 25);
  checkbox_myo.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox_myo.setText(" Myo Control");
  checkbox_myo.setTextBold();
  checkbox_myo.setOpaque(false);
  checkbox_myo.addEventHandler(this, "checkbox_myo_clicked");
   panel4.addControl(checkbox_myo);
   

   
  
}

GLabel tf_ip_port;
GCheckbox  cb_socket;

//leap motion Gesture Lock
 public void checkbox_gesture_lock_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox2:428528:
  //println("checkbox2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if(checkbox_gesture_lock.isSelected())
  {
      GESTURE_LOCK = true;
      RESET_ARM = false;
  }
  else {
      GESTURE_LOCK = false;
  }
}   
//leap motion Gesture Lock

public void cb_socket_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox2:428528:
  //println("checkbox2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if(cb_socket.isSelected())
  {
    String name = JOptionPane.showInputDialog(
        null, 
        "Please input IP and port format like 192.168.1.1:8888", 
        "Require IP address & port", 
        JOptionPane.WARNING_MESSAGE
    );
    if(name != null){
      String str_ip_port[] = name.split(":");
      String ip_split = str_ip_port[0];
      String str_port_split = str_ip_port[1];
      ip = ip_split;
      port = Integer.parseInt(str_port_split);
      client.init(ip,port);
      tf_ip_port.setText(ip+":"+port);
      SOCKET_EN = true;
    }
  }
  else {SOCKET_EN = false; }
}

//myo control
public void checkbox_myo_clicked(GCheckbox source, GEvent event) { //_CODE_:checkbox2:428528:
  //println("checkbox2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if(checkbox_myo.isSelected())
  {
      initMyo();
      MYO_EN = true;
      MYO_LOCKED = true;
  }
  else {
   MYO_EN = false;
   myo.lock();
   myo = null;
  }
} 

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  // println("e=" + e);
//  int v = map(-40,40,1,10);
  float v = slider1.getValueF();
  // println("v=" + v);
  slider1.setValue(v - e);
}
boolean hasCLICKED;
void mouseClicked(){
  if(mouseX >=85 && mouseX <=600 && mouseY >=50 && mouseY <= 430){ 
      hasCLICKED = !hasCLICKED;
  }
}

void mouseMoved() {
  // slider2d2 = new GSlider2D(this, 85, 50, 520, 390);
  // if(mouseX >=85 && mouseX <=520 && mouseY >=50 && mouseY <= 390){ 
    // println("MOVED");
      if(hasCLICKED){
    float valueX = map(mouseX,85,600,-90,90);
    float valueY = map(mouseY,50,430,210,0);
        slider2d2.setValueX(valueX);
        slider2d2.setValueY(valueY);
        // println("ValueX: " + slider2d2.getValueXI());
        // println("ValueY: " + slider2d2.getValueYI());
      }
  }
// }

// Variable declarations 
// autogenerated do not edit
GPanel panel4; 
GCheckbox checkbox1; 
//Leap motion Gesture lock
GCheckbox checkbox_gesture_lock;
GDropList dropList1; 
GDropList dropList2; 
GCheckbox checkbox2; 

GSlider slider1; 
GKnob knob1; 
GButton button1; 
GLabel label1; 
GSlider2D slider2d2; 
GImageButton imgButton1; 
GButton button3; 
GImageButton imgButton2; 
GLabel label2; 
GLabel label3; 
GLabel label4; 
GLabel label5; 
GLabel label6; 
GLabel label7; 
GLabel label8; 
GLabel label9; 

//myo control
GCheckbox checkbox_myo; 
