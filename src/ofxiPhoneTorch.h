/*
 *	ofxiPhoneTorch.h
 *	openframeworks.cc
 *	
 *	Ken Frederick
 *	ken.frederick@gmx.de
 *
 *	http://cargocollective.com/kenfrederick/
 *	http://kenfrederick.blogspot.com/
 *
 *	wrapper for toggling the iphone 4 "camera flash"/torch
 *	with some help: http://stackoverflow.com/questions/3190034/turn-on-torch-flash-on-iphone-4/3367424#3367424
 *
 *	Copyright 2011 Ken Frederick. All rights reserved.
 *	
 */



//-----------------------------------------------------------------------------
//includes
//-----------------------------------------------------------------------------
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ofMain.h"

@interface ofxiPhoneTorchDelegate : NSObject {
	AVCaptureSession 	* TorchSession;
	BOOL							bState;
}

@property (nonatomic, retain) AVCaptureSession *TorchSession;

- (id) init;
- (void) toggleOn;
- (void) toggleOff;
- (BOOL) state;

@end


class ofxiPhoneTorch {
protected:
	//-----------------------------------------------------------------------------
	//properties
	//-----------------------------------------------------------------------------
	ofxiPhoneTorchDelegate * flashlight;

    
    
public:
	//-----------------------------------------------------------------------------
	//constructor
	//-----------------------------------------------------------------------------
	ofxiPhoneTorch();


	//-----------------------------------------------------------------------------
	//deconstructor
	//-----------------------------------------------------------------------------
	~ofxiPhoneTorch();
	
    
	//-----------------------------------------------------------------------------
	//methods
	//-----------------------------------------------------------------------------
	void toggle(bool val);
	bool state();
};