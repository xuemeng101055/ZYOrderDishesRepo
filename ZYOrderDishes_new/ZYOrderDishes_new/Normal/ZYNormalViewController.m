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
#import "ZYOrderDao.h"

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
    
    //插入点菜数据
    
    ZYOrderModel *orderModel = [[ZYOrderModel alloc] init];
    orderModel.dishName = _currentDishModel.name;
    orderModel.dishPrice = _currentDishModel.price;
    orderModel.remark = @"变态辣";
    
    orderModel.kind = _currentDishModel.kind;
    
    BOOL isUpdateSuccess = [ZYOrderDao updateOrAddDishes:orderModel];
    
    if (isUpdateSuccess) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"点菜" message:@"成功" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];

    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"点菜" message:@"失败" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    [orderModel release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
