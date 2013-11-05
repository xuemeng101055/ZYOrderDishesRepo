//
//  ZYMyOrderViewController.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-11-4.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYMyOrderViewController : UIViewController<UITableViewDataSource,UITabBarDelegate>
{
    NSArray *_orderArray;
}

@property (nonatomic, retain)NSArray *orderArray;

- (IBAction)sendMyOrder:(id)sender;
- (id)initWithOrderArray:(NSArray *)array;
@end
