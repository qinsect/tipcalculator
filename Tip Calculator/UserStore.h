//
//  UserStore.h
//  Tip Calculator
//
//  Created by Yanfeng Ma on 9/12/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserStore : NSObject

+(UserStore*) sharedUserStore;
-(float) getRate;
-(void) saveRate:(NSInteger) idx;
-(NSInteger) getIdx;

@end
