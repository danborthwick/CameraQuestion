//
//  CameraFieldOfViewController.m
//  CameraQuestion
//
//  Created by Dan Borthwick on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraFieldOfViewController.h"

@interface CameraFieldOfViewController() {
@private
    float mFieldOfViewAtStartOfDrag;
}

-(void)setupPinchRecognizerWithView:(UIView*)view;
-(void)handlePinchBeganEvent:(UIPinchGestureRecognizer*)recognizer;
-(void)handlePinchChangedEvent:(UIPinchGestureRecognizer*)recognizer;

@end

@implementation CameraFieldOfViewController

-(id)initWithView:(UIView *)view andModel:(WorldModel*)worldModel
{
    self = [super initWithView:view andModel:worldModel];
    if (self)
    {
        [self setupPinchRecognizerWithView:view];
        mFieldOfViewAtStartOfDrag = 0.0f;
    }
    return self;
}

-(void)setupPinchRecognizerWithView:(UIView*)view
{
    UIPinchGestureRecognizer* pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchEvent:)];
    [pinchRecognizer setDelegate:self];
    [view addGestureRecognizer:pinchRecognizer];

}

-(void)handlePinchEvent:(UIPinchGestureRecognizer*)recognizer
{
    switch ([recognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self handlePinchBeganEvent:recognizer];
            break;
            
        case UIGestureRecognizerStateChanged:
            [self handlePinchChangedEvent:recognizer];
            break;
            
        default:
            break;
    }
}

-(void)handlePinchBeganEvent:(UIPinchGestureRecognizer*)recognizer
{
    mFieldOfViewAtStartOfDrag = [[self.mWorldModel camera] fieldOfViewInRadians];
}

-(void)handlePinchChangedEvent:(UIPinchGestureRecognizer*)recognizer
{
    float newFieldOfView = mFieldOfViewAtStartOfDrag * [recognizer scale];
    [self.mWorldModel setCameraFieldOfViewTo:newFieldOfView];
    
    [self.mView setNeedsDisplay];
}

@end
