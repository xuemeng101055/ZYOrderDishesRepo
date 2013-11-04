//
//  ZYOrderDao.h
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-11-1.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYOrderModel.h"
@interface ZYOrderDao : NSObject

//操作插入，更新操作
+ (BOOL)updateOrAddDishes:(ZYOrderModel *)orderModel;


+ (NSArray *)getAllOrder;
@end
