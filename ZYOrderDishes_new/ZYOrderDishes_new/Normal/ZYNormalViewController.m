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
    _dishesImageScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 0);
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
}

#pragma -
#pragma mark UIScrollViewDelegate Method

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

- (IBAction)myOrderButton:(id)sender
{

    NSArray *array = [ZYOrderDao getAllOrder];
    ZYMyOrderViewController *myOrderViewController = [[ZYMyOrderViewController alloc] initWithOrderArray:array];
    
    [self presentViewController:myOrderViewController animated:YES completion:nil];
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
