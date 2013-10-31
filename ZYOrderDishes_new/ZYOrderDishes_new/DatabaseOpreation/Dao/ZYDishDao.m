//
//  ZYDishDao.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-31.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYDishDao.h"
#import "ZYDatabaseUitl.h"
#import "ZYDishModel.h"

@implementation ZYDishDao

+ (NSArray *)getDishesWith:(NSString *)groupId kindName:(NSString *)kindName
{
    FMDatabase *db = [ZYDatabaseUitl getDataBase];
    
    if (![db open]) {
        return nil;
    }
    
    [db setShouldCacheStatements:YES];
    
    if (![db tableExists:@"menuTable"]) {
        return nil;
    }
    
    NSMutableArray *dishesArray = [[NSMutableArray alloc] init];
    
    FMResultSet *dataRs = [db executeQuery:@"select *from menuTable where [groupID] = ? and [iKind] = ?",groupId,kindName];
    
    while ([dataRs next]) {
        ZYDishModel *dishesModel = [[ZYDishModel alloc] init];
        
        
        dishesModel.dishID = [NSString stringWithFormat:@"%d",[dataRs intForColumn:@"id"]];
        dishesModel.groupID = [NSString stringWithFormat:@"%d",[dataRs intForColumn:@"groupID"]];
        dishesModel.kind = [dataRs stringForColumn:@"iKind"];
        dishesModel.name = [dataRs stringForColumn:@"name"];
        dishesModel.price = [NSString stringWithFormat:@"%d",[dataRs intForColumn:@"price"]];
        dishesModel.unit = [dataRs stringForColumn:@"unit"];
        dishesModel.detail = [dataRs stringForColumn:@"detail"];
        dishesModel.picName = [dataRs stringForColumn:@"picName"];
        [dishesArray addObject:dishesModel];
        [dishesModel release];
    }
    
    [dataRs close];
    [db close];
    return [dishesArray autorelease];
    
    
}

@end
