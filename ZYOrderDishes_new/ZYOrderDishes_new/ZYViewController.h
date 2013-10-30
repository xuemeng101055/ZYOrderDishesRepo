//
//  ZYViewController.h
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-10-28.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYSettingViewController.h"

@interface ZYViewController : UIViewController
{
    UIView *_settingView;
    ZYSettingViewController *_settingViewController;
    BOOL _isShowing;
}

@property (nonatomic, retain)UIView *settingView;

- (IBAction)buttonClick:(id)sender;

@end
