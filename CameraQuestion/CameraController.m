//
//  CameraController.m
//  CameraQuestion
//
//  Created by Dan Borthwick on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraController.h"

#import "VectorGeometry.h"

@interface CameraController()

@end


@implementation CameraController

- (void)updateCamera:(CameraModel*)camera forPoleWithPosition:(const CGPoint)polePosition andAvatarWithPosition:(const CGPoint)avatarPosition
{
    CGSize avatarToPole = [VectorGeometry vectorFrom:avatarPosition to:polePosition];
    float distanceOfAvatarFromPole = [VectorGeometry magnitudeOf:avatarToPole];
    float halfFieldOfView = [camera fieldOfViewInRadians] / 2.0f;
    float distanceOfCameraFromPole = 2 * distanceOfAvatarFromPole / tanf(halfFieldOfView);
    
    CGSize vectorInDirectionFromPoleToCamera = [VectorGeometry normalTo:avatarToPole];
    CGSize unitVectorFromPoleToCamera = [VectorGeometry unitVectorInDirectionOf:vectorInDirectionFromPoleToCamera];
    CGSize poleToCamera = [VectorGeometry scale:unitVectorFromPoleToCamera by:distanceOfCameraFromPole];
    CGPoint cameraPosition = [VectorGeometry translate:polePosition by:poleToCamera];
    
    [camera moveTo:cameraPosition];
    [camera lookAt:polePosition];
}

@end
