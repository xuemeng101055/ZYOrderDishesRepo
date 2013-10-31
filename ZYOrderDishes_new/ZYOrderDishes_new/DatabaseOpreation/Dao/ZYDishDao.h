//
//  ZYDishDao.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-31.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDishDao : NSObject

+ (NSArray *)getDishesWith:(NSString *)groupId kindName:(NSString *)kindName;

@end
