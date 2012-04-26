//
//  CameraRenderer.h
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "CameraModel.h"

@interface CameraRenderer : NSObject

- (void) drawCamera:(const CameraModel*)camera toContext:(CGContextRef)context;

@end
