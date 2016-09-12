//
//  UserStore.m
//  Tip Calculator
//
//  Created by Yanfeng Ma on 9/12/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "UserStore.h"

@implementation UserStore

static NSString* const KEY_RATE = @"v1_user_rate";

-(instancetype) init {
    if (self == [super init]) {
        
    }
    return self;
}

+(UserStore*) sharedUserStore
{
    static UserStore *userStore;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userStore = [[UserStore alloc] init];
    });
    
    return userStore;
}

-(float) getRate {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *ary = @[@0.15, @0.20, @0.25];
    return [ary[[defaults integerForKey:KEY_RATE]] floatValue];
}

-(NSInteger) getIdx {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger integer =  [defaults integerForKey:KEY_RATE];
    return integer;
}

-(void) saveRate:(NSInteger) idx {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:idx forKey:KEY_RATE];
    [defaults synchronize];
}

@end
