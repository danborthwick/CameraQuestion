//
//  CameraFovPinchController.h
//  CameraQuestion
//
//  Created by Dan Borthwick on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WorldController.h"

@interface CameraFieldOfViewController : WorldController<UIGestureRecognizerDelegate>

-(void)handlePinchEvent:(UIPinchGestureRecognizer*)recognizer;

@end
