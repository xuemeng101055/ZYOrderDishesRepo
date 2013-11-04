//
//  ZYNormalViewController.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYNormalViewController.h"
#import "ZYMyOrderViewController.h"
#import "ZYAppDelegate.h"

@interface ZYNormalViewController ()

@end

@implementation ZYNormalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)setScrollImage:(NSIndexPath *)indexPath
{
    
}

#pragma -
#pragma mark UIScrollViewDelegate Method

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

- (IBAction)myOrderButton:(id)sender
{
    ZYAppDelegate *app = [UIApplication sharedApplication].delegate;
    NSArray *array = [ZYOrderDao getAllOrder];
    ZYMyOrderViewController *myOrderViewController = [[ZYMyOrderViewController alloc] initWithOrderArray:array];
    
    [app.window.rootViewController presentViewController:myOrderViewController animated:YES completion:nil];
    [myOrderViewController release];
}

- (IBAction)orderMyDishes:(id)sender
{
    [self showAlertView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
