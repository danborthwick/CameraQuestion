//
//  VectorGeometry.m
//  CameraQuestion
//
//  Created by Dan Borthwick on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VectorGeometry.h"

@implementation VectorGeometry

+ (CGPoint) translate:(CGPoint const)point by:(CGSize const)translation
{
    return CGPointMake(point.x + translation.width, point.y + translation.height);
}

+ (CGSize) vectorFrom:(CGPoint const)from to:(CGPoint const)to
{
    return CGSizeMake(to.x - from.x, to.y - from.y);
}

+ (CGSize) normalTo:(CGSize const)vector
{
    return CGSizeMake(vector.height, -vector.width);
}

+ (CGSize) negativeOf:(CGSize const)vector
{
    return CGSizeMake(-vector.width, -vector.height);
}

+ (float) magnitudeOf:(CGSize const)vector
{
    return sqrtf((vector.width * vector.width) + (vector.height * vector.height));
}

+ (CGSize) unitVectorInDirectionOf:(CGSize const)vector
{
    float magnitude = [VectorGeometry magnitudeOf:vector];
    return CGSizeMake(vector.width / magnitude, vector.height / magnitude);
}

+ (CGSize) scale:(CGSize const)vector by:(float)scalar
{
    return CGSizeMake(vector.width * scalar, vector.height * scalar);
}

@end
