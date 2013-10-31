//
//  ZYDishGroupModel.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-31.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYDishGroupModel : NSObject
{
    NSString *_kind;
    NSString *_name;
    NSString *_groupId;
    
}

@property (nonatomic, copy)NSString *kind;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *groupId;
@end
