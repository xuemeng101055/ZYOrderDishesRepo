//
//  ZYDishGroupModel.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-31.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYDishGroupModel.h"

@implementation ZYDishGroupModel
@synthesize kind = _kind;
@synthesize name = _name;
@synthesize groupId = _groupId;

- (void)dealloc
{
    
    [_kind release];
    [_name release];
    [_groupId release];
    [super dealloc];
}

@end
