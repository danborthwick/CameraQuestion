//
//  CameraController.h
//  CameraQuestion
//
//  Created by Dan Borthwick on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CameraModel.h"

@interface CameraController : NSObject

- (void)updateCamera:(CameraModel*)camera forPoleWithPosition:(const CGPoint)polePosition andAvatarWithPosition:(const CGPoint)avatarPosition;

@end
