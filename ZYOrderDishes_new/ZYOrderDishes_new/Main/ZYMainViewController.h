//
//  ZYMainViewController.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYDishGroupModel.h"

@interface ZYMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *_dishKindTableView;
    int                   _currentSelectRow;
    UIViewController        *_currentViewController;
}

@property (nonatomic, retain) NSArray *allGroupArray;
@property (nonatomic, retain) NSArray              *menuImageArray;
@property (nonatomic, retain) NSArray              *menuHighlightedImageArray;

@end
