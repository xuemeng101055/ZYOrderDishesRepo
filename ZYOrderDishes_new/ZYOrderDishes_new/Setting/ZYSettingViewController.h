//
//  ZYSettingViewController.h
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYSettingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *_tableView;
    UIView *_showView;
    BOOL _isShowing;
}
@property (nonatomic, retain)UIView *showView;
@property (nonatomic, assign)BOOL isShowing;
@end
