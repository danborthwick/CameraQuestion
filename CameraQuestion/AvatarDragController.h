//
//  AvatarDragController.h
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WorldModel.h"

@interface AvatarDragController : NSObject<UIGestureRecognizerDelegate>

-(id)initWithView:(UIView *)view andModel:(WorldModel*)worldModel;
-(void)handlePanEvent:(UIPanGestureRecognizer*)recognizer;

@end
