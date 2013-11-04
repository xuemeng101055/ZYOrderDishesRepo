//
//  ZYOrderDao.m
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-11-1.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYOrderDao.h"
#import "ZYDatabaseUitl.h"

@implementation ZYOrderDao

+ (BOOL)updateOrAddDishes:(ZYOrderModel *)orderModel
{
    FMDatabase *db = [ZYDatabaseUitl getDataBase];
    
    if (![db open]) {
        return NO;
    }
    
    [db setShouldCacheStatements:YES];
    
    if (![db tableExists:@"orderTable"]) {
        return NO;
    }
    
    FMResultSet *rs = [db executeQuery:@"select *from orderTable where [menuName] = ?",orderModel.dishName];
    
    
    //如果我们的表中已经含有该菜品的内容，只需要更新我们的menunum
    if ([rs next]) {
        //更新操作
        [db executeUpdate:@"update orderTable set [menuNum] = ? where [menuName] = ?",[NSNumber numberWithInt:[rs intForColumn:@"menuNum"] + [orderModel.menuNum intValue]],orderModel.dishName];
        
    }else{
        //插入操作
        [db executeUpdate:@"insert into orderTable (menuName,Price,kind,menuNum,remark) values (?,?,?,?,?) ",orderModel.dishName,orderModel.dishPrice,orderModel.kind,orderModel.menuNum,orderModel.remark];
    }
    [rs close];
    [db close];
    
    return YES;
    
}

+ (NSArray *)getAllOrder
{
	
	FMDatabase *db = [ZYDatabaseUitl getDataBase];
	if (![db open])
	{
		NSLog(@"database could not open");
		return nil;
	}
	
	[db setShouldCacheStatements:YES];
	
	if (![db tableExists:@"orderTable"])
	{
		NSLog(@"orderTable not exist");
		return nil;
	}
	
	FMResultSet *rs = [db	executeQuery:@"select * from orderTable "];
	
	NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
	
	while ([rs next])
	{
		ZYOrderModel *order = [[ZYOrderModel alloc]init];
		
		order.orderID = [[NSString stringWithFormat:@"%d",[rs intForColumn:@"id"]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
		
		order.dishName = [[rs stringForColumn:@"menuName"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
		order.dishPrice = [[rs stringForColumn:@"Price"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
		order.kind = [[rs stringForColumn:@"kind"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
		order.menuNum = [[NSString stringWithFormat:@"%d",[rs intForColumn:@"menuNum"]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
		order.remark = [[rs stringForColumn:@"remark"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
		[array addObject:order];
		[order release];
	}
	
	[rs close];
	[db close];
	
	
	return [array autorelease];
}



@end
