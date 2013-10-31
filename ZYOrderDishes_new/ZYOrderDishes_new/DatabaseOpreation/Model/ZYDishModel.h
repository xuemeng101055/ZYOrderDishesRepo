//
//  ZYDishModel.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-31.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDishModel : NSObject
{
    NSString *_dishID;
    NSString *_groupID;
    NSString *_kind;
    NSString *_name;
    NSString *_price;
    NSString *_unit;
    NSString *_detail;
    NSString *_picName;
}

@property (nonatomic,copy) NSString *dishID;
@property (nonatomic,copy) NSString *groupID;
@property (nonatomic,copy) NSString *kind;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *unit;
@property (nonatomic,copy) NSString *detail;
@property (nonatomic,copy) NSString *picName;

@end
