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
    [_settingViewController release];
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _settingView = [[UIView alloc] initWithFrame:CGRectMake(-340, 50, 300, 480)];
    _settingView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_settingView];
    
    _settingViewController = [[ZYSettingViewController alloc] init];
    [_settingView addSubview:_settingViewController.view];
    
    _settingView.alpha = 0;
    
    
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
        if (!_isShowing) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:.5];
            _settingView.frame = CGRectMake(20, 50, 300, 480);
            _settingView.alpha = 1;
            [UIView commitAnimations];
            _isShowing = !_isShowing;
        }else{
            [self hidenSetView];
        }
        
    }
}

- (void)hidenSetView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.5];
    _settingView.frame = CGRectMake(-340, 50, 300, 480);
    _settingView.alpha = 1;
    
    if (_settingViewController.showView != nil) {
        [_settingViewController.showView removeFromSuperview];
        _settingViewController.isShowing = NO;
    }
    
    [UIView commitAnimations];
    _isShowing = !_isShowing;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hidenSetView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
