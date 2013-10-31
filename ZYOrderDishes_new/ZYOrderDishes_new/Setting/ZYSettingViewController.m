//
//  ZYSettingViewController.m
//  ZYOrderDishes_new
//
//  Created by Stephy_xue on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYSettingViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ZYAppDelegate.h"

@interface ZYSettingViewController ()

@end

@implementation ZYSettingViewController
@synthesize showView = _showView;
@synthesize isShowing = _isShowing;

- (void)dealloc
{
    [_showView release];
    [super dealloc];
}

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
    
    _tableView.layer.cornerRadius = 10;
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showTextView
{
    if (_isShowing) return;
    
    // 350, 50, 640, 480
    // 初始化showView
    self.showView = [[UIView alloc] initWithFrame:CGRectMake(320, 50, 0, 480)];
    ZYAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.window.rootViewController.view addSubview:self.showView];
    
    // 创建UITextView
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 640, 480)];
    textView.editable = NO;
    textView.text = @"这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView\n这里是UITextView";
    textView.font = [UIFont systemFontOfSize:20];
    [self.showView addSubview:textView];
    [textView release];
    
    // 创建关闭按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(600, 0, 40, 40);
    [btn setBackgroundImage:[UIImage imageNamed:@"exit"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(closeShowView:) forControlEvents:UIControlEventTouchUpInside];
    [self.showView addSubview:btn];
    _showView.alpha = 0;
    
    // 动画把showView显示出来
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    _showView.frame = CGRectMake(350, 50, 640, 480);
    _showView.alpha = 1;
    [UIView commitAnimations];
    
    _isShowing = YES;
}

- (void)closeShowView:(id)sender
{
    NSLog(@"关闭showView");
    
    // 动画把showView显示出来
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeShowView)];
    _showView.frame = CGRectMake(320, 50, 0, 0);
    _showView.alpha = 0;
    [UIView commitAnimations];
}

- (void)removeShowView
{
    [self.showView removeFromSuperview];
    self.showView = nil;
    _isShowing = NO;
}

- (void)segmentChanged:(id)sender
{
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    NSLog(@"Current selected -->>%d",segment.selectedSegmentIndex);
    NSString *language = @"";
    if (segment.selectedSegmentIndex == 0) {
        language = @"中文";
    }
    else{
        language = @"English";
    }
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"language"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentify = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentify] autorelease];
    }
    cell.textLabel.textColor = [UIColor darkGrayColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"更新菜单";
    }
    else if (indexPath.row == 1){
        cell.textLabel.text = @"选择语言";
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"中文", @"English"]];
        segment.frame = CGRectMake(135, 10, 150, 40);
        
        // 获取NSUserDefaults中得语言设置
        NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:@"language"];
        NSLog(@"current language-->>%@",language);
        if (language == nil || [language isEqualToString:@"中文"]) {
            segment.selectedSegmentIndex = 0;
        }
        else{
            segment.selectedSegmentIndex = 1;
        }
        // segment绑定事件
        [segment addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];

        [cell addSubview:segment];
        [segment release];
    }
    else if (indexPath.row == 2){
        cell.textLabel.text = @"清除缓存";
    }
    else if (indexPath.row == 3){
        cell.textLabel.text = @"使用帮助";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if (indexPath.row == 4){
        cell.textLabel.text = @"网站首页";
    }
    else if (indexPath.row == 5){
        cell.textLabel.text = @"给我们评分";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"当前为最新菜单！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    else if (indexPath.row == 2){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"清除成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    else if (indexPath.row == 3){
        [self showTextView];
    }
    else if (indexPath.row == 4){
        UIApplication *app = [UIApplication sharedApplication];
        NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
        [app openURL:url];
    }
    else if (indexPath.row == 5){
        UIApplication *app = [UIApplication sharedApplication];
        NSString *str = [NSString stringWithFormat:
                    @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d",1];
        NSURL *url = [NSURL URLWithString:str];
        [app openURL:url];
    }
}

@end
