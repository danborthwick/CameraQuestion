//
//  CameraModel.m
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraModel.h"

@interface CameraModel ()
{
    CGPoint mPosition;
    CGPoint mLookAtPoint;
}

@end

@implementation CameraModel

- (float) fieldOfViewInRadians
{
    return M_PI_2;
}

- (const CGPoint) position
{
    return mPosition;
}

- (const CGPoint) lookAtPoint
{
    return mLookAtPoint;
}

- (void) moveTo:(const CGPoint)position
{
    mPosition = position;
}

- (void) lookAt:(const CGPoint)lookAtPoint
{
    mLookAtPoint = lookAtPoint;
}

@end
