//
//  CameraRenderer.m
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraRenderer.h"

#import "VectorGeometry.h"

const CGFloat cGrey[4] = {0.7f, 0.7f, 0.7f, 1.0f};
const CGFloat cGreen[4] = {0.0f, 1.0f, 0.0f, 1.0f};
const CGFloat cBlack[4] = {0.0f, 0.0f, 0.0f, 1.0f};

@implementation CameraRenderer

- (void)drawLineOfSightOfCamera:(const CameraModel *)camera toContext:(CGContextRef)context
{
    CGContextSetStrokeColor(context, cGreen);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, [camera position].x, [camera position].y);
    CGContextAddLineToPoint(context, [camera lookAtPoint].x, [camera lookAtPoint].y);
    CGContextStrokePath(context);
}

- (void) drawViewFrustumOfCamera:(const CameraModel*)camera toContext:(CGContextRef)context
{
    CGSize lineOfSight = [VectorGeometry vectorFrom:[camera position] to:[camera lookAtPoint]];
    CGSize unitNormalTolineOfSight = [VectorGeometry unitVectorInDirectionOf:[VectorGeometry normalTo:lineOfSight]];
    float distanceFromCameraToLookAt = [VectorGeometry magnitudeOf:lineOfSight];
    float distanceFromLookAtPointToFrustumVertex = distanceFromCameraToLookAt * tanf([camera fieldOfViewInRadians] / 2);
    CGSize lookAtPointToLeftFrustumVertex = [VectorGeometry scale:unitNormalTolineOfSight by:distanceFromLookAtPointToFrustumVertex];
                                      
    
    CGPoint leftFrustumVertex = [VectorGeometry translate:[camera lookAtPoint] by:lookAtPointToLeftFrustumVertex];
    CGPoint rightFrustumVertex = [VectorGeometry translate:[camera lookAtPoint] by:[VectorGeometry negativeOf:lookAtPointToLeftFrustumVertex]];
    
    CGContextSetStrokeColor(context, cBlack);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, leftFrustumVertex.x, leftFrustumVertex.y);
    CGContextAddLineToPoint(context, [camera position].x, [camera position].y);
    CGContextAddLineToPoint(context, rightFrustumVertex.x, rightFrustumVertex.y);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColor(context, cGrey);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, leftFrustumVertex.x, leftFrustumVertex.y);
    CGContextAddLineToPoint(context, rightFrustumVertex.x, rightFrustumVertex.y);
    CGContextStrokePath(context);
}

- (void) drawCamera:(CameraModel const*)camera toContext:(CGContextRef)context
{
    [self drawLineOfSightOfCamera:camera toContext:context];
    [self drawViewFrustumOfCamera:camera toContext:context];
}

@end
