//
//  ZYDatabaseDao.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYDatabaseDao.h"
#import "ZYDatabaseUitl.h"

@implementation ZYDatabaseDao

+ (NSArray *)getData:(NSString *)tableName model :(id)aModel
{
  
    
    FMDatabase *db = [ZYDatabaseUitl getDataBase];
    
    if (![db open]) {
        
        return nil;
    }
    
    [db setShouldCacheStatements:YES];
    
    if (![db tableExists:tableName]) {
        return nil;
    }
    
    //接收查询结果数组
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    
    
    FMResultSet *dataRs = [db executeQuery:@"select *from",tableName];
    while ([dataRs next]) {
        
    }
    
    return [array autorelease];
}

@end
