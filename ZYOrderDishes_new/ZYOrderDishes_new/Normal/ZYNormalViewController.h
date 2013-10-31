//
//  ZYNormalViewController.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYDishSuperViewController.h"

@interface ZYNormalViewController : ZYDishSuperViewController<UIScrollViewDelegate>
{
    IBOutlet UIScrollView *_dishesImageScrollView;
}

- (IBAction)myOrderButton:(id)sender;
- (IBAction)orderMyDishes:(id)sender;

@end
