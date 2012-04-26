//
//  AvatarDragController.h
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WorldController.h"

@interface AvatarDragController : WorldController<UIGestureRecognizerDelegate>

-(void)handlePanEvent:(UIPanGestureRecognizer*)recognizer;

@end
