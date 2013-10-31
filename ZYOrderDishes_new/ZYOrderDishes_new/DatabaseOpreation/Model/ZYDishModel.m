//
//  ZYDishModel.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-31.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYDishModel.h"

@implementation ZYDishModel
@synthesize dishID = _dishID;
@synthesize groupID = _groupID;
@synthesize kind = _kind;
@synthesize name = _name;
@synthesize price = _price;
@synthesize unit = _unit;
@synthesize detail = _detail;
@synthesize picName = _picName;

- (void)dealloc
{
    [_dishID release];
    [_groupID release];
    [_kind release];
    [_name release];
    [_price release];
    [_unit release];
    [_detail release];
    [_picName release];
    [super dealloc];
}

@end
