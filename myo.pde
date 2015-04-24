
Myo myo;
boolean MYO_LOCKED = true;
boolean isGesture = false;
int move_type = 0;
static final int MOVE_TYPE_ARM_HEIGHT_UP = 1;
static final int MOVE_TYPE_ARM_HEIGHT_DOWN =2;
int myo_armHeight;
int myo_armRot;
int myo_armStretch;
// byte myo_armGrab;

void initMyo(){
  myo_armHeight = 0;
  myo_armRot = 0;
  myo_armStretch = 0;
  pre_myo_yaw = 100;
  // myo_armGrab = 0x02;  
  myo = new Myo(this);
  myo.setLockingPolicy(Myo.LockingPolicy.NONE);
  
}

  // switch (arm.getType()) {
  // case LEFT:
  //   println("Left arm.");
  //   break;
  // case RIGHT:
  //   println("Right arm.");
  //   break;
  // }

  // if (myo.hasArm()) {
  //   if (myo.isArmLeft()) {
  //     println("Left arm.");
  //   } else {
  //     println("Right arm.");
  //   }
  // }
// }
// 

// int myo_armHeight = 0;


void readMyo(){
  // read Oritentation
   if(!MYO_LOCKED)
    {
      getRotation();
      if((pre_myo_yaw < 10 && myo_yaw > 20) || (pre_myo_yaw > 20 && myo_yaw < 10))
      {

      }
      else{
        // myo_armRot = (int)map(myo_yaw, 0, 360, -90, 90);
  
        myo_armRot = (int)map(constrain(myo_yaw, yaw_offset -90, yaw_offset + 90), yaw_offset -90, yaw_offset + 90, 90, -90);
        // println("myo_yaw" + myo_yaw);
        myo_armStretch = (int)map(constrain(myo_pitch, pitch_offset -45 ,pitch_offset +45), pitch_offset -45, pitch_offset + 45, 0, 210);
        // sendPos(armStretch, armHeight, armRot, 0, grab);
        
        setUIPos(
        myo_armRot,  // min: -90   max: 90
        myo_armHeight,
        myo_armStretch,  // min: 0     max: 210
        0);
        pre_myo_yaw = myo_yaw;
      }

    }
    // use Myo Gesture
     if(isGesture){
          switch(move_type)
          {
            case MOVE_TYPE_ARM_HEIGHT_UP:
              myo_armHeight = constrain(myo_armHeight+3,-80,180);      
              break;
            case MOVE_TYPE_ARM_HEIGHT_DOWN:
              myo_armHeight = constrain(myo_armHeight-3,-80,180);        
              break;          
          }
        }
   
}

void myoOnPose(Myo myo, long timestamp, Pose pose) {
  switch (pose.getType()) {
  case REST:
    if(!MYO_LOCKED)
    {  
      println("Pose: REST");
    }
    isGesture = false;    
    break;
  case FIST:
    if(!MYO_LOCKED)
    {
      println("Pose: FIST");
      if(suctionCup == 0x02)
      {
        suctionCup = 0x01;
        button1.setText("CATCH");
      button1.setText("Catch");
      button1.setTextBold();
      }
      else if(suctionCup == 0x01)
      {
        suctionCup = 0x02;
        button1.setText("RELEASE");
      }
      
    }
    break;
  case FINGERS_SPREAD:
      // println("Pose: FINGERS_SPREAD");
    break;
  case DOUBLE_TAP:
    // println("Pose: DOUBLE_TAP");
    if(MYO_LOCKED){
      getRotation();
      yaw_offset = myo_yaw;
      pitch_offset = myo_pitch;
      println("yaw_offset: " + yaw_offset);
      println("pitch_offset: " + pitch_offset);
      myo.unlock(Myo.Unlock.HOLD);
      MYO_LOCKED = false;
      println("Unlock");
    }else{
      myo.lock();
      MYO_LOCKED = true;
      println("Lock");
    }
    break;
  case WAVE_OUT:
   if(!MYO_LOCKED)
    {

        println("Pose: WAVE_IN");
        getRotation();
        move_type = MOVE_TYPE_ARM_HEIGHT_UP;
        isGesture = true;
    }  
    break;
  case WAVE_IN:
   if(!MYO_LOCKED)
    {   
        println("Pose: WAVE_OUT");
        getRotation();
        move_type = MOVE_TYPE_ARM_HEIGHT_DOWN;
        isGesture = true;
    }    
    break;
  default:
    break;
  }
}

// float myo_roll = 0;
float myo_pitch = 0;
float myo_yaw = 0;
float yaw_offset = 0;
float pitch_offset = 0;
float pre_myo_yaw = 0;

void getRotation(){
        PVector orientation= myo.getOrientation();
        // myo_roll = map(orientation.x, 0, 1, 0, 360);
        myo_pitch = map(orientation.y, 0, 1, 0, 360);
        myo_yaw = map(orientation.z, 0, 1, 0, 360);
        // println("--------------------------");
        // println("roll : " + myo_roll);
        // println("pitch : " + myo_pitch);
        // println("yaw : " + myo_yaw);
}
