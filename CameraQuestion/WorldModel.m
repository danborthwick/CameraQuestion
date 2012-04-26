//
//  WorldModel.m
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WorldModel.h"

#import "CameraController.h"

@interface WorldModel ()
{
    CGPoint mPolePosition;
    CGPoint mAvatarPosition;
}

@property (nonatomic, retain) CameraModel* mCamera;
@property (nonatomic, retain) CameraController* mCameraController;

- (void) setInitialPositions;
- (void) updateCamera;

@end

@implementation WorldModel

@synthesize mCamera;
@synthesize mCameraController;

- (id) init
{
    self = [super init];
    if (self)
    {
        NSLog(@"Initialising world model");
        mCamera = [[CameraModel alloc] init];
        mCameraController = [[CameraController alloc] init];
        [self setInitialPositions];
    }
    return self;
}

- (void) setInitialPositions
{
    mPolePosition.x = 160;
    mPolePosition.y = 240;
    
    [self moveAvatarTo:CGPointMake(120, 240)];
}

- (const CameraModel*) camera
{
    return mCamera;
}

- (const CGPoint) positionOfPole
{
    return mPolePosition;
}

- (const CGPoint) positionOfAvatar
{
    return mAvatarPosition;
}

- (void) moveAvatarTo:(const CGPoint)position
{
    mAvatarPosition = position;
    
    [self updateCamera];
}

- (void) setCameraFieldOfViewTo:(float)fieldOfView
{
    [mCamera setFieldOfViewTo:fieldOfView];
    [self updateCamera];
}


- (void) updateCamera
{
    [mCameraController updateCamera:self.mCamera forPoleWithPosition:mPolePosition andAvatarWithPosition:mAvatarPosition];
}


@end
