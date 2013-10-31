//
//  ZYMainViewController.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYMainViewController.h"
#import "ZYReconmmentViewController.h"
#import "ZYNormalViewController.h"
#import "ZYDishKindCell.h"
#import "ZYDishGroupDao.h"

@interface ZYMainViewController ()

@end

@implementation ZYMainViewController
@synthesize menuImageArray = _menuImageArray;
@synthesize menuHighlightedImageArray = _menuHighlightedImageArray;
@synthesize allGroupArray = _allGroupArray;

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
    [_menuHighlightedImageArray release];
    [_menuImageArray release];
    [_allGroupArray release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   self.allGroupArray = [self getDishGroupData];
    
    _dishKindTableView.backgroundColor = [UIColor clearColor];
    _currentSelectRow = 0;
    
    _dishKindTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _dishKindTableView.rowHeight = 100.0f;
    
    self.menuImageArray = [NSArray arrayWithObjects:
                           [UIImage imageNamed:@"zctj.png"],
                           [UIImage imageNamed:@"cp.png"],
                           [UIImage imageNamed:@"lc.png"],
                           [UIImage imageNamed:@"rc.png"],
                           [UIImage imageNamed:@"tl.png"],
                           [UIImage imageNamed:@"zs.png"],
                           [UIImage imageNamed:@"jsyl.png"],
                           nil];
    
    self.menuHighlightedImageArray = [NSArray arrayWithObjects:
                                      [UIImage imageNamed:@"hzctj.png"],
                                      [UIImage imageNamed:@"hcp.png"],
                                      [UIImage imageNamed:@"hlc.png"],
                                      [UIImage imageNamed:@"hrc.png"],
                                      [UIImage imageNamed:@"htl.png"],
                                      [UIImage imageNamed:@"hzs.png"],
                                      [UIImage imageNamed:@"hjsyl.png"],
                                      nil];
    ZYReconmmentViewController *reconmmentViewController = [[ZYReconmmentViewController alloc] init];
    [self setCurrentViewController:reconmmentViewController];
    [reconmmentViewController release];

}

- (NSArray *)getDishGroupData
{
    return [ZYDishGroupDao getAllDishGroup];
}

#pragma -
#pragma mark UITableViewDelegate Method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_menuImageArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentify = @"cell";
    
    ZYDishKindCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    
    if (!cell) {
        cell = [[[ZYDishKindCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentify] autorelease];
    }
    if (_currentSelectRow != indexPath.row) {//判断是否是之前选中的行
        cell.menuImageView.image = [_menuImageArray objectAtIndex:indexPath.row];
    }else{
        cell.menuImageView.image = [_menuHighlightedImageArray objectAtIndex:indexPath.row];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _currentSelectRow = indexPath.row;
    ZYDishGroupModel *groupModel = [_allGroupArray objectAtIndex:indexPath.row];
    
    if (indexPath.row == 0) {
        ZYReconmmentViewController *reconmmentViewController = [[ZYReconmmentViewController alloc] initWithDishGroup:groupModel];
        [self setCurrentViewController:reconmmentViewController];
        [reconmmentViewController release];
    }else
    {
        ZYNormalViewController *normalViewController = [[ZYNormalViewController alloc] initWithDishGroup:groupModel];
        [self setCurrentViewController:normalViewController];
        [normalViewController release];
    }

    
    [_dishKindTableView reloadData];
}

- (void)setCurrentViewController:(UIViewController *)newMenuViewController
{
    if (_currentViewController != newMenuViewController) {
        if (_currentViewController) {
            [_currentViewController.view removeFromSuperview];
            [_currentViewController release];
        }
        _currentViewController = [newMenuViewController retain];
        [self.view addSubview:newMenuViewController.view];
        [self.view bringSubviewToFront:_dishKindTableView];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
