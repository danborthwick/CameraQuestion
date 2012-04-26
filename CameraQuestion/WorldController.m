//
//  WorldController.m
//  CameraQuestion
//
//  Created by Dan Borthwick on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WorldController.h"

@implementation WorldController

@synthesize mView;
@synthesize mWorldModel;

-(id)initWithView:(UIView *)view andModel:(WorldModel*)worldModel;
{
    self = [super init];
    if (self)
    {
        self.mView = view;
        self.mWorldModel = worldModel;
    }
    return self;
}

@end
