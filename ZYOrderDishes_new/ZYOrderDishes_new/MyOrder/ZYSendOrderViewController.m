//
//  ZYSendOrderViewController.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-11-4.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYSendOrderViewController.h"

@interface ZYSendOrderViewController ()

@end

@implementation ZYSendOrderViewController

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
    // Do any additional setup after loading the view from its nib.
    
    _tableNameLabel.textColor = [UIColor greenColor];
}

#pragma -
#pragma mark SelectTableName Method

- (IBAction)selectTable:(id)sender
{
    ZYSelectTableViewController *selectTableViewController = [[ZYSelectTableViewController alloc] init];
    selectTableViewController.delegate = self;
    [self presentViewController:selectTableViewController animated:YES completion:nil];
    [selectTableViewController release];
}

#pragma -
#pragma mark SelectTableDelegate Method

- (void)getTableInformation:(NSString *)tableName
{
    _tableNameLabel.text = tableName;
}

- (IBAction)sendOrder:(id)sender
{
    NSDate  *date = [NSDate date];
	
	//日期格式化类
	NSDateFormatter *formatter = [[NSDateFormatter alloc]init ];
	//设置日期格式
	[formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    NSString *time = [formatter stringFromDate:date];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
