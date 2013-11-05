//
//  ZYProManager.h
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-11-5.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYProManager : NSObject
{
    NSMutableArray *_tempOrderArray;
}
@property (nonatomic, retain)NSMutableArray *tempOrderArray;

+ (ZYProManager *)getSingletonManager;

@end
