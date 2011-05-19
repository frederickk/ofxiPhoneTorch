/*
 *	ofxiPhoneTorch.mm
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
#include "ofxiPhoneTorch.h"
#import <AVFoundation/AVFoundation.h>



/**
 *	Objective-C class implementations
 */

@implementation ofxiPhoneTorchDelegate
@synthesize TorchSession;

//-----------------------------------------------------------------------------
//setup
//-----------------------------------------------------------------------------
- (id) init {
	
	if ((self = [super init])) {
		
		Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
		if (captureDeviceClass != nil) {
			NSLog(@"initializing ofxiPhoneTorch");
			AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
			
			if ([device hasTorch] && [device hasFlash]){
				if (device.torchMode == AVCaptureTorchModeOff) {
					
					AVCaptureDeviceInput *flashInput = [AVCaptureDeviceInput deviceInputWithDevice:device error: nil];
					AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
					AVCaptureSession *session = [[AVCaptureSession alloc] init];
					
					[session beginConfiguration];
					[device lockForConfiguration:nil];
					
					[session addInput:flashInput];
					[session addOutput:output];
					
					[device unlockForConfiguration];
					
					[output release];
					
					[session commitConfiguration];
					[session startRunning];
					
					[self setTorchSession:session];
					[session release];
				}
			} //end if hasTorch/hasFlash
			
		}
	}
	
	return self;
}


- (void) dealloc {
	[TorchSession release];
	[super dealloc];
}

//-----------------------------------------------------------------------------
//methods
//-----------------------------------------------------------------------------
- (void) toggleOn {
	bState = YES;
	AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	
	if (device.torchMode == AVCaptureTorchModeOff) {
		NSLog(@"ofxiPhoneTorch ON");
		[device lockForConfiguration:nil];
		[device setTorchMode:AVCaptureTorchModeOn];
		[device setFlashMode:AVCaptureFlashModeOn];
		[device unlockForConfiguration];
	}
}	 

- (void) toggleOff {
	bState = NO;
	AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	
	if (device.torchMode == AVCaptureTorchModeOn) {
		NSLog(@"ofxiPhoneTorch OFF");
		[device lockForConfiguration:nil];
		[device setTorchMode:AVCaptureTorchModeOff];
		[device setFlashMode:AVCaptureFlashModeOff];
		[device unlockForConfiguration];
	}
}	 

//-----------------------------------------------------------------------------
- (BOOL) state {
	return bState;
}

@end



/**
 *	C++ class implementations
 */

//-----------------------------------------------------------------------------
//constructor
//-----------------------------------------------------------------------------
ofxiPhoneTorch::ofxiPhoneTorch() {
	flashlight = [[ofxiPhoneTorchDelegate alloc]init];
}


//-----------------------------------------------------------------------------
//deconstructor
//-----------------------------------------------------------------------------
ofxiPhoneTorch::~ofxiPhoneTorch() {
	[flashlight release];
}


//-----------------------------------------------------------------------------
//methods
//-----------------------------------------------------------------------------
void ofxiPhoneTorch::toggle(bool val) {
	if(val) {
		[flashlight toggleOn];
	} else {
		[flashlight toggleOff];
	}
}

bool ofxiPhoneTorch::state() {
	return [flashlight state];
}

