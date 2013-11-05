//
//  ZYSendOrderViewController.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-11-4.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYSelectTableViewController.h"

@interface ZYSendOrderViewController : UIViewController <SelectTableNameDelegate>
{
    IBOutlet UILabel *_tableNameLabel;
}

- (IBAction)selectTable:(id)sender;
- (IBAction)sendOrder:(id)sender;
@end
