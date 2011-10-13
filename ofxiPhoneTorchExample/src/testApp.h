#pragma once



//-----------------------------------------------------------------------------
//includes
//-----------------------------------------------------------------------------
#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"

//addons
#include "ofxiPhoneTorch.h"


class testApp : public ofxiPhoneApp {
public:
	//-----------------------------------------------------------------------------
	//properties
	//-----------------------------------------------------------------------------
	ofxiPhoneTorch flashlight;

	
    //-----------------------------------------------------------------------------
	//methods
	//-----------------------------------------------------------------------------
	void setup();
	void update();
	void draw();
	void exit();
	

    //-----------------------------------------------------------------------------
	//events
	//-----------------------------------------------------------------------------
    void touchDown(ofTouchEventArgs &touch);
	void touchMoved(ofTouchEventArgs &touch);
	void touchUp(ofTouchEventArgs &touch);
	void touchDoubleTap(ofTouchEventArgs &touch);
	void touchCancelled(ofTouchEventArgs &touch);

	void lostFocus();
	void gotFocus();
	void gotMemoryWarning();
	void deviceOrientationChanged(int newOrientation);

};


