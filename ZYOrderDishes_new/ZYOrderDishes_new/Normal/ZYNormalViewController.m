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
    _beforeSelectSection = 0;
    [self setScrollViewImage];
}

- (void)setScrollViewImage
{
    
    int count = [[_allDishesArray objectAtIndex:_currentSelectSection] count];
    _dishesImageScrollView.contentSize = CGSizeMake(_dishesImageScrollView.frame.size.width * count, 0);
    _dishesImageScrollView.contentOffset = CGPointMake(0, 0);
    _dishesImageScrollView.pagingEnabled = YES;
    
    int i = 0;
    
    for (ZYDishModel *dishModel in [_allDishesArray objectAtIndex:_currentSelectSection]) {
       
        NSString *imageName = dishModel.picName;
        
       _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        _imageView.frame = CGRectMake(i * _dishesImageScrollView.frame.size.width, 0, _dishesImageScrollView.frame.size.width, _dishesImageScrollView.frame.size.height);
        [_dishesImageScrollView addSubview:_imageView];
        [_imageView release];
         i++;
    }
    
    if(_currentSelectRow != 0){
        NSLog(@"hehe");
        [_dishesImageScrollView setContentOffset:CGPointMake(_dishesImageScrollView.frame.size.width * _currentSelectRow, 0)];
    }
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

- (void)setImage
{
    if (_currentSelectSection != _beforeSelectSection) {
        
        _beforeSelectSection = _currentSelectSection;
        
        [self setScrollViewImage];
    }else{
        NSLog(@"not change section");
        [_dishesImageScrollView setContentOffset:CGPointMake(_dishesImageScrollView.frame.size.width * _currentSelectRow, 0)];
    }
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
