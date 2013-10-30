//
//  ZYDishSuperViewController.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYDishSuperViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_dishSuperTableView;
}

@property (nonatomic, retain) UITableView *dishSuperTableView;

@end
