//
//  ZYOrderModel.h
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-11-1.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYOrderModel : NSObject
{
    NSString *_orderID;
    NSString *_dishName;
    NSString *_dishPrice;
    NSString *_kind;
    NSString *_menuNum;
    NSString *_remark;
}

@property(nonatomic,copy) NSString *orderID;
@property(nonatomic,copy) NSString *dishName;
@property(nonatomic,copy) NSString *dishPrice;
@property(nonatomic,copy) NSString *kind;
@property(nonatomic,copy) NSString *menuNum;
@property(nonatomic,copy) NSString *remark;

@end
