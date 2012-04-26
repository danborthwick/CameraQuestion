//
//  VectorGeometry.h
//  CameraQuestion
//
//  Created by Dan Borthwick on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VectorGeometry : NSObject

+ (CGPoint) translate:(CGPoint const)point by:(CGSize const)translation;

+ (CGSize) vectorFrom:(CGPoint const)from to:(CGPoint const)to;

+ (CGSize) normalTo:(CGSize const)vector;

+ (CGSize) negativeOf:(CGSize const)vector;

+ (float) magnitudeOf:(CGSize const)vector;

+ (CGSize) unitVectorInDirectionOf:(CGSize const)vector;

+ (CGSize) scale:(CGSize const)vector by:(float)scalar;

@end
