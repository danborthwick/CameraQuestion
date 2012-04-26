//
//  CameraModel.h
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CameraModel : NSObject

- (float) fieldOfViewInRadians;
- (void) setFieldOfViewTo:(float)fieldOfViewInRadians;

- (const CGPoint) position;
- (const CGPoint) lookAtPoint;

- (void) moveTo:(const CGPoint)position;
- (void) lookAt:(const CGPoint)target;

@end
