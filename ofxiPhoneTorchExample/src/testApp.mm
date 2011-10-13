#include "testApp.h"



//-----------------------------------------------------------------------------
//methods
//-----------------------------------------------------------------------------
void testApp::setup() {	
	/** 
	 *	required iphone initialization
	 *	register touch events
	 */
	ofRegisterTouchEvents(this);
	ofxiPhoneAlerts.addListener(this);
	ofxAccelerometer.setup();
	
    // orientation
	//ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_PORTRAIT);
	//ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);

	ofBackground(0,0,0);
	ofSetFrameRate(30);


    /**
     * ofxiPhoneTorch
     */
    flashlight.toggle(false);  //set torch to off

}



//-----------------------------------------------------------------------------
void testApp::update() {
}



//-----------------------------------------------------------------------------
void testApp::draw() {
}



//-----------------------------------------------------------------------------
void testApp::exit() {
}



//-----------------------------------------------------------------------------
//events
//-----------------------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){
    flashlight.toggle(true);  //on finger up turn torch on
}
void testApp::touchMoved(ofTouchEventArgs &touch){
}
void testApp::touchUp(ofTouchEventArgs &touch){
    flashlight.toggle(false);  //on finger up turn torch off
}
void testApp::touchDoubleTap(ofTouchEventArgs &touch){
}



//-----------------------------------------------------------------------------
void testApp::lostFocus() {
}



//-----------------------------------------------------------------------------
void testApp::gotFocus() {
}



//-----------------------------------------------------------------------------
void testApp::gotMemoryWarning() {
	cout << "MemoryWarning()" << endl;
}



//-----------------------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){
}



//-----------------------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs& args){
}

