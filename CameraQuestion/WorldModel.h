//
//  WorldModel.h
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <CoreGraphics/CGGeometry.h>
#import "CameraModel.h"

@interface WorldModel : NSObject

- (id) init;

- (const CameraModel*) camera;
- (const CGPoint) positionOfPole;
- (const CGPoint) positionOfAvatar;

- (void) moveAvatarTo:(const CGPoint)position;
- (void) setCameraFieldOfViewTo:(float)fieldOfView;

@end
