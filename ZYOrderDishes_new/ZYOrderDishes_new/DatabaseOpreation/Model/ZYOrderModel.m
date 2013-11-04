//
//  ZYOrderModel.m
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-11-1.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYOrderModel.h"

@implementation ZYOrderModel

@synthesize orderID = _orderID;
@synthesize dishName = _dishName;
@synthesize dishPrice = _dishPrice;
@synthesize kind = _kind;
@synthesize menuNum = _menuNum;
@synthesize remark = _remark;

- (void)dealloc
{
    [_orderID release];
    [_dishName release];
    [_dishPrice release];
    [_kind release];
    [_menuNum release];
    [_remark release];
    
    [super dealloc];
}


@end
