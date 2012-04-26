//
//  AvatarDragController.m
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AvatarDragController.h"

@interface AvatarDragController()
{
    CGPoint mPositionOfAvatarAtStartOfDrag;
}

-(void)setupPanRecognizerWithView:(UIView *)view;
-(void)handlePanBeganEvent:(UIPanGestureRecognizer*)recognizer;
-(void)handlePanChangedEvent:(UIPanGestureRecognizer*)recognizer;

@end

@implementation AvatarDragController

-(id)initWithView:(UIView *)view andModel:(WorldModel*)worldModel;
{
    self = [super initWithView:view andModel:worldModel];
    if (self)
    {
        [self setupPanRecognizerWithView:view];
        mPositionOfAvatarAtStartOfDrag = CGPointZero;
    }
    return self;
}

- (void)setupPanRecognizerWithView:(UIView *)view
{
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanEvent:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [panRecognizer setDelegate:self];
    [view addGestureRecognizer:panRecognizer];
}

-(void)handlePanEvent:(UIPanGestureRecognizer*)recognizer;
{
    switch ([recognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self handlePanBeganEvent:recognizer];
            break;
            
        case UIGestureRecognizerStateChanged:
            [self handlePanChangedEvent:recognizer];
            break;
            
        default:
            break;
    }
}

-(void)handlePanBeganEvent:(UIPanGestureRecognizer*)recognizer
{
    mPositionOfAvatarAtStartOfDrag = [self.mWorldModel positionOfAvatar];
}

-(void)handlePanChangedEvent:(UIPanGestureRecognizer*)recognizer
{
    CGPoint translation = [recognizer translationInView:self.mView];
    NSLog(@"Dragged (%.2f, %.2f)", translation.x, translation.y);
    
    CGPoint newAvatarPosition = CGPointMake(mPositionOfAvatarAtStartOfDrag.x + translation.x, mPositionOfAvatarAtStartOfDrag.y + translation.y);
    [self.mWorldModel moveAvatarTo:newAvatarPosition];
    
    [self.mView setNeedsDisplay];
}

@end
