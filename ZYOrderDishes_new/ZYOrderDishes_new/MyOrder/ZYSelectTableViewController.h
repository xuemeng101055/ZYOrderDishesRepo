//
//  ZYSelectTableViewController.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-11-4.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectTableNameDelegate <NSObject>

- (void)getTableInformation:(NSString *)tableName;

@end

@interface ZYSelectTableViewController : UIViewController
{
    NSArray *_allTableNameArray;
    NSString *_tableName;
    id <SelectTableNameDelegate>_delegate;
}

@property (nonatomic, retain) NSArray *allTableNameArray;
@property (nonatomic, assign)id <SelectTableNameDelegate> delegate;

- (IBAction)exitSelect:(id)sender;
- (IBAction)selectTableName:(id)sender;
@end


