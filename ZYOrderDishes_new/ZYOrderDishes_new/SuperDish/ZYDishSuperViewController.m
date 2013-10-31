//
//  ZYDishSuperViewController.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//
#define HEADER_BUTTON_TAG 100

#import "ZYDishSuperViewController.h"
#import "ZYDishDao.h"
#import "ZYDishModel.h"



@interface ZYDishSuperViewController ()

@end

@implementation ZYDishSuperViewController
@synthesize dishSuperTableView = _dishSuperTableView;
@synthesize dishGroupModel = _dishGroupModel;
@synthesize allKindArray = _allKindArray;
@synthesize allDishesArray = _allDishesArray;
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//         NSLog(@"111111111xxx");
//    }
//    return self;
//}

- (id)initWithDishGroup:(ZYDishGroupModel *)groupModel
{
    if ([super init]) {
        self.dishGroupModel = groupModel;
    }
    
    return self;
}

- (void)dealloc
{
    [_allDishesArray release];
    [_allKindArray release];
    [_dishSuperTableView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.allKindArray = [_dishGroupModel.name componentsSeparatedByString:@"|"];
    
    _sectionFlag[0] = YES;
    
    [self getDishesData];
    
    _dishSuperTableView.delegate = self;
    _dishSuperTableView.dataSource = self;
    

}

- (void)getDishesData
{
    self.allDishesArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < [_allKindArray count]; i++) {
        
        NSArray *array = [ZYDishDao getDishesWith:_dishGroupModel.groupId kindName:[_allKindArray objectAtIndex:i]];
        [_allDishesArray addObject:array];
    }
}

#pragma -
#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (_sectionFlag[section]) {
        NSLog(@"xxxx");
        return [[_allDishesArray objectAtIndex:section] count];
    }
    return 0;
}
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_allKindArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentify = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    
    if (cell == nil) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentify] autorelease];
    }
    ZYDishModel *dishModel = [[_allDishesArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = dishModel.name;
     
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 306, 60)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 306, 60);
    btn.tag = HEADER_BUTTON_TAG + section;
    [btn addTarget:self action:@selector(headerViewClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:[_allKindArray objectAtIndex:section] forState:UIControlStateNormal];
    [backView addSubview:btn];
    return backView;
}

#pragma -
#pragma mark HederButton Method

- (void)headerViewClicked:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    int section = btn.tag - HEADER_BUTTON_TAG;
    
    _sectionFlag[section] = !_sectionFlag[section];
    [self.dishSuperTableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark -
#pragma mark ShowDetail Method

- (IBAction)showDetail:(id)sender
{
    ZYDetailView * detail = [[ZYDetailView alloc] init];
    detail.delegate = self;
    [detail show];
    [detail release];
}

- (void)exit:(ZYDetailView *)view
{
    [view removeFromSuperview];
    
    _sectionFlag[2] = !_sectionFlag[2];
    
    [_dishSuperTableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
