//
//  WorldController.h
//  CameraQuestion
//
//  Created by Dan Borthwick on 26/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WorldModel.h"

@interface WorldController : NSObject

@property (retain) UIView* mView;
@property (retain) WorldModel* mWorldModel;

-(id)initWithView:(UIView *)view andModel:(WorldModel*)worldModel;

@end
