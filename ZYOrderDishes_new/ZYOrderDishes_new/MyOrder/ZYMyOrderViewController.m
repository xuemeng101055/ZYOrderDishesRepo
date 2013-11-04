//
//  ZYMyOrderViewController.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-11-4.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYMyOrderViewController.h"
#import "ZYOrderModel.h"
#import "ZYMyOrderCell.h"

@interface ZYMyOrderViewController ()

@end

@implementation ZYMyOrderViewController
@synthesize orderArray = _orderArray;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithOrderArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        self.orderArray = array;
        NSLog(@"%@",_orderArray);
    }
    return self;
}

- (void)dealloc
{
    [_orderArray release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_orderArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentify = @"cell";
    ZYMyOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    if (!cell) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ZYMyOrderCell" owner:nil options:nil];
        cell = (ZYMyOrderCell *)array[0];
        
    }
    ZYOrderModel *orderModel = [_orderArray objectAtIndex:indexPath.row];
    cell.sequenceNumberLabel.text = orderModel.orderID;
    cell.dishKindLabel.text = orderModel.kind;
    cell.dishNameLabel.text = orderModel.dishName;
    cell.dishPrciceLabel.text = orderModel.dishPrice;
    
    
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
