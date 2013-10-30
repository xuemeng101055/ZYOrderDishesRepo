//
//  ZYDatabaseUitl.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMResultSet.h"

@interface ZYDatabaseUitl : NSObject

+ (NSString *)getDataBasePath;
+ (FMDatabase *)getDataBase;

@end
