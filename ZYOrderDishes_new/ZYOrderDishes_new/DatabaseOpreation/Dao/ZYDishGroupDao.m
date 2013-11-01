//
//  ZYDishGroupDao.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-31.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYDishGroupDao.h"
#import "ZYDatabaseUitl.h"
#import "ZYDishGroupModel.h"

@implementation ZYDishGroupDao
+ (NSArray *)getAllDishGroup
{
    FMDatabase *db = [ZYDatabaseUitl getDataBase];
    
    if (![db open]) {
        
        return nil;
    }
    
    [db setShouldCacheStatements:YES];
    
    if (![db tableExists:@"groupTable"]) {
        return nil;
    }
    
    //接收查询结果数组
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    FMResultSet *dataRs = [db executeQuery:@"select *from groupTable"];
    
    while ([dataRs next]) {
        ZYDishGroupModel *dishGroup = [[ZYDishGroupModel alloc]  init];
        
        dishGroup.name = [[dataRs stringForColumn:@"name"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        //去除字符串里面的空格
        
        
        dishGroup.kind = [dataRs stringForColumn:@"kind"];
        
        dishGroup.groupId = [NSString stringWithFormat:@"%d",[dataRs intForColumn:@"id"]];
        
        [array addObject:dishGroup];
        
        [dishGroup release];
    }
    
    [dataRs close];
    [db close];
    return [array autorelease];
    
}

@end
