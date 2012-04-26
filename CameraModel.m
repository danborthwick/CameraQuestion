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
    float mFieldOfViewInRadians;
}

@end

@implementation CameraModel

- (id) init
{
    self = [super init];
    if (self)
    {
        mFieldOfViewInRadians = M_PI_2;
    }
    return self;
}

- (float) fieldOfViewInRadians
{
    return mFieldOfViewInRadians;
}

- (void) setFieldOfViewTo:(float)fieldOfViewInRadians
{
    mFieldOfViewInRadians = fieldOfViewInRadians;
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
