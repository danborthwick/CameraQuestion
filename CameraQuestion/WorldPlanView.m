//
//  WorldPlanView.m
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WorldPlanView.h"

#include "AvatarDragController.h"
#include "CameraFieldOfViewController.h"
#include "CameraRenderer.h"
#include "WorldModel.h"

const int cPoleRadius = 10;

@interface WorldPlanView ()

@property (nonatomic, retain) WorldModel* mModel;
@property (nonatomic, retain) CameraRenderer* mCameraRenderer;
@property (nonatomic, retain) AvatarDragController* mAvatarDragController;
@property (nonatomic, retain) CameraFieldOfViewController* mCameraFieldOfViewController;

- (void) drawPole:(CGContextRef)c;
- (CGRect) boundsForViewOfPoleAt:(CGPoint)position;

- (void) drawAvatar:(CGContextRef)c;
- (CGRect) boundsForViewOfAvatarAt:(CGPoint)position;

@end



@implementation WorldPlanView

@synthesize mModel;
@synthesize mCameraRenderer;
@synthesize mAvatarDragController;
@synthesize mCameraFieldOfViewController;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        mModel = [[WorldModel alloc] init];
        mCameraRenderer = [[CameraRenderer alloc] init];
        
        mAvatarDragController = [[AvatarDragController alloc] initWithView:self andModel:mModel];
        mCameraFieldOfViewController = [[CameraFieldOfViewController alloc] initWithView:self andModel:mModel];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"Drawing world view");
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    [self drawPole:c];
    [self drawAvatar:c];
    [mCameraRenderer drawCamera:[mModel camera] toContext:c];
}

- (void) drawPole:(CGContextRef)c
{
    CGFloat red[4] = {1.0f, 0.0f, 0.0f, 1.0f};
    CGContextSetStrokeColor(c, red);
    CGContextSetFillColor(c, red);
    
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, [self boundsForViewOfPoleAt:[mModel positionOfPole]]);
    CGContextFillPath(c);    
}

- (CGRect) boundsForViewOfPoleAt:(CGPoint)polePosition
{
    return CGRectMake(polePosition.x - cPoleRadius, polePosition.y - cPoleRadius, cPoleRadius * 2, cPoleRadius * 2);
}

- (void) drawAvatar:(CGContextRef)c
{
    CGFloat blue[4] = {0.0f, 0.0f, 1.0f, 1.0f};
    CGContextSetStrokeColor(c, blue);
    CGContextSetFillColor(c, blue);
    
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, [self boundsForViewOfAvatarAt:[mModel positionOfAvatar]]);
    CGContextFillPath(c);    
}

- (CGRect) boundsForViewOfAvatarAt:(CGPoint)position
{
    return CGRectMake(position.x - cPoleRadius, position.y - cPoleRadius, cPoleRadius * 2, cPoleRadius * 2);
}

@end
