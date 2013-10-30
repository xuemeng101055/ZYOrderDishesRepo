//
//  ZYDatabaseUitl.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYDatabaseUitl.h"

@implementation ZYDatabaseUitl
static FMDatabase *db = nil;

+ (NSString *)getDataBasePath
{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    
    //将要移动的路径
    NSString *toPath = [path stringByAppendingPathComponent:@"data.sqlite"];
    return toPath;
}

+ (FMDatabase *)creatOrFindDataBase
{
    NSString *filePath = [ZYDatabaseUitl getDataBasePath];
    db = [[FMDatabase databaseWithPath:filePath]retain];
    return db;
}

+ (FMDatabase *)getDataBase
{
    return [ZYDatabaseUitl creatOrFindDataBase];
}

@end
