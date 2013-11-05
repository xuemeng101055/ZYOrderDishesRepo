//
//  ZYProManager.m
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-11-5.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYProManager.h"

static ZYProManager *manager = nil;

@implementation ZYProManager

+ (ZYProManager *)getSingletonManager
{
    @synchronized (self) {
        if(manager == nil){
            manager = [[ZYProManager alloc] init];
        }
    }
    return manager;
}

+ (id) allocWithZone:(NSZone *)zone
{
    @synchronized (self) {
        if (manager == nil) {
            manager = [super allocWithZone:zone];
            return manager;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (unsigned) retainCount
{
    return UINT_MAX;
}

- (oneway void) release
{
    
}

- (id) autorelease
{
    return self;
}

- (id)init
{
    @synchronized(self) {
        [super init];
        return self;
    }
}

@end