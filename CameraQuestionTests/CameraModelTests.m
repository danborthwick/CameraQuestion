//
//  CameraModelTests.m
//  CameraQuestion
//
//  Created by Dan Borthwick on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraModelTests.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#include "CameraModel.h"

@implementation CameraModelTests

CameraModel* camera;

- (void)setUp
{
    [super setUp];
    camera = [CameraModel new];
}

- (void)tearDown
{
    camera = NULL;
    [super tearDown];
}

- (void)testWhenMovedToAPoint_thenPositionIsSamePoint
{
    [camera moveTo:CGPointMake(3, 4)];
    
    assertThatFloat([camera position].x, equalToFloat(3));
    assertThatFloat([camera position].y, equalToFloat(4));
}

- (void)testWhenLookingAtAPoint_thenLookAtIsSamePoint
{
    [camera lookAt:CGPointMake(6, 7)];
    
    assertThatFloat([camera lookAtPoint].x, equalToFloat(6));
    assertThatFloat([camera lookAtPoint].y, equalToFloat(7));
}

@end
