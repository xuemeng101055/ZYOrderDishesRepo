//
//  ZYViewController.m
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-10-28.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#define ORDER_BUTTON_TAG       10
#define MORESETTING_BUTTON_TAG 11

#import "ZYViewController.h"
#import "ZYAppDelegate.h"
#import "ZYMainViewController.h"

@interface ZYViewController ()

@end

@implementation ZYViewController
@synthesize settingView = _settingView;

- (void)dealloc
{
    [_settingView release];
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

#pragma -
#pragma mark ButtonClick Method

- (IBAction)buttonClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    int tag = btn.tag;
    
    if (tag == ORDER_BUTTON_TAG) {
        ZYAppDelegate *app = [UIApplication sharedApplication].delegate;
        
        ZYMainViewController *mainViewController = [[ZYMainViewController alloc] init];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.0f];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:app.window cache:YES];
        [UIView commitAnimations];
        app.window.rootViewController = mainViewController;
        
        [mainViewController release];
        
    }else if (tag == MORESETTING_BUTTON_TAG){
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
