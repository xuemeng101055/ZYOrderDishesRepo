//
//  ZYSelectTableViewController.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-11-4.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYSelectTableViewController.h"

@interface ZYSelectTableViewController ()

@end

@implementation ZYSelectTableViewController
@synthesize allTableNameArray = _allTableNameArray;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_allTableNameArray release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.allTableNameArray = [NSArray arrayWithObjects:@"文华轩",@"希尔顿",@"威斯汀",@"万丽",@"柏悦庄",@"万豪庄",nil];
}


#pragma -
#pragma mark SelectTableName

- (IBAction)selectTableName:(id)sender
{
    int index = ((UIButton *)sender).tag;
    
   _tableName = [_allTableNameArray objectAtIndex:index];
    [self tableInformation];
}

- (IBAction)exitSelect:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
   
}

- (void)tableInformation
{
    if ([_delegate respondsToSelector:@selector(getTableInformation:)]) {
        [_delegate getTableInformation:_tableName];
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
