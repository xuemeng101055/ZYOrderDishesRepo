//
//  ZYDishSuperViewController.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//
#define HEADER_BUTTON_TAG 100

#import "ZYDishSuperViewController.h"

@interface ZYDishSuperViewController ()

@end

@implementation ZYDishSuperViewController
@synthesize dishSuperTableView = _dishSuperTableView;
@synthesize dishGroupModel = _dishGroupModel;
@synthesize allKindArray = _allKindArray;
@synthesize allDishesArray = _allDishesArray;
@synthesize searchResultArray = _searchResultArray;
@synthesize currentDishModel = _currentDishModel;

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
    [_searchResultArray release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.allKindArray = [_dishGroupModel.name componentsSeparatedByString:@"|"];
    
    _sectionFlag[0] = YES;
    
    [self getDishesData];
    _currentDishModel = [[_allDishesArray objectAtIndex:0] objectAtIndex:0];
    NSString *dishImage = _currentDishModel.picName;
    _dishImageView.image = [UIImage imageNamed:dishImage];
    
    _dishSuperTableView.delegate = self;
    _dishSuperTableView.dataSource = self;
    
    //
    _searchResultArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
    // 设置搜索范围
    searchBar.scopeButtonTitles = [NSArray arrayWithObjects:@"按名字搜索",@"按价格搜索", nil];
    searchBar.delegate = self;
    _dishSuperTableView.tableHeaderView = searchBar;
    
    _searchDisplay = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    [searchBar release];
    
    // 自己的代理方法
    _searchDisplay.delegate = self;
    //搜索结果表的数据源和代理
    _searchDisplay.searchResultsDataSource = self;
    _searchDisplay.searchResultsDelegate = self;
}

- (void)getDishesData
{
    self.allDishesArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < [_allKindArray count]; i++) {
        
        NSArray *array = [ZYDishDao getDishesWith:_dishGroupModel.groupId kindName:[_allKindArray objectAtIndex:i]];
        [_allDishesArray addObject:array];
    }
}

- (void)showAlertView
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"我要点菜" message:@"\n\n\n\n\n\n" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    [alert release];
}

#pragma mark -
#pragma mark UIAlertViewDelegate Method

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 200, 30)];
    nameLabel.text = [NSString stringWithFormat:@"菜名: %@",_currentDishModel.name];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textColor = [UIColor whiteColor];
    [alertView addSubview:nameLabel];
    [nameLabel release];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 75, 200, 30)];
    priceLabel.text = [NSString stringWithFormat:@"价格: %@",_currentDishModel.price];
    priceLabel.backgroundColor = [UIColor clearColor];
    priceLabel.textColor = [UIColor whiteColor];
    [alertView addSubview:priceLabel];
    [priceLabel release];
    
    UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 110, 50, 30)];
    numLabel.text = @"份数: ";
    numLabel.backgroundColor = [UIColor clearColor];
    numLabel.textColor = [UIColor whiteColor];
    [alertView addSubview:numLabel];
    [numLabel release];
    
    UITextField *numText = [[UITextField alloc] initWithFrame:CGRectMake(65, 110, 200, 30)];
    numText.tag = 1000;
    numText.textColor = [UIColor whiteColor];
    numText.borderStyle = UITextBorderStyleLine;
    numText.backgroundColor = [UIColor clearColor];
    numText.clearButtonMode=UITextFieldViewModeWhileEditing;
    numText.text = @"1";
    [alertView addSubview:numText];
    [numText release];
    
    UILabel *remarkLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 145, 50, 30)];
    remarkLabel.text = @"备注: ";
    remarkLabel.backgroundColor = [UIColor clearColor];
    remarkLabel.textColor = [UIColor whiteColor];
    [alertView addSubview:remarkLabel];
    [remarkLabel release];
    
    UITextField *remarkText = [[UITextField alloc] initWithFrame:CGRectMake(65, 145, 200, 30)];
    remarkText.tag = 2000;
    remarkText.textColor = [UIColor whiteColor];
    remarkText.borderStyle = UITextBorderStyleLine;
    remarkText.backgroundColor = [UIColor clearColor];
    remarkText.clearButtonMode=UITextFieldViewModeWhileEditing;
    remarkText.placeholder = @"请输入备注";
    [alertView addSubview:remarkText];
    [remarkText release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSLog(@"点击了确定按钮");
        //插入点菜数据
        ZYOrderModel *orderModel = [[ZYOrderModel alloc] init];
        orderModel.dishName = _currentDishModel.name;
        orderModel.dishPrice = _currentDishModel.price;
        orderModel.kind = _currentDishModel.kind;
        
        UITextField *numText = (UITextField *)[alertView viewWithTag:1000];
        orderModel.menuNum = numText.text;
        if ([orderModel.menuNum intValue] < 1) {
            orderModel.menuNum = @"1";
        }
        UITextField *remarkText = (UITextField *)[alertView viewWithTag:2000];
        orderModel.remark = remarkText.text;
        
        [ZYOrderDao updateOrAddDishes:orderModel];

        [orderModel release];

    }
}

#pragma mark -
#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _dishSuperTableView) {
        if (_sectionFlag[section]) {
            NSLog(@"xxxx");
            return [[_allDishesArray objectAtIndex:section] count];
        }
        return 0;
    }
    else{
        return [_searchResultArray count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _dishSuperTableView) {
        return [_allKindArray count];
    }
    else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentify] autorelease];
    }
    
    ZYDishModel *dishModel = nil;
    if (tableView == _dishSuperTableView) {
        dishModel = [[_allDishesArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    else{
        dishModel = [_searchResultArray objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = dishModel.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _dishSuperTableView) {
        _currentDishModel = [[_allDishesArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    else{
        _currentDishModel = [_searchResultArray objectAtIndex:indexPath.row];
    }
    NSString *imageName = _currentDishModel.picName;
    _dishImageView.image = [UIImage imageNamed:imageName];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == _dishSuperTableView) {
        return 60;
    }
    else{
        return 0;
    }
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

#pragma mark -
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

#pragma mark -
#pragma mark UISearchDisplayControllerDelegate

//当搜索结果表显示出来之后改变表的frame
- (void)searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView
{
    tableView.frame = CGRectMake(_dishSuperTableView.frame.origin.x, _dishSuperTableView.frame.origin.y + 88, 300, 550 - 88);
}

// 当搜索文字改变时调用该方法
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSArray *array = controller.searchBar.scopeButtonTitles;
    NSString *scopeString = [array objectAtIndex:controller.searchBar.selectedScopeButtonIndex];
    
    [self filterWithSearchString:searchString scope:scopeString];
    
    return YES;
}

// 当搜索范围改变时调用该方法
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    NSString *searchString = controller.searchBar.text;
    NSArray *array = controller.searchBar.scopeButtonTitles;
    NSString *scopeString = [array objectAtIndex:searchOption];
    
    [self filterWithSearchString:searchString scope:scopeString];
    
    return YES;
}

//不管是搜索文字改变还是范围改变 都统一在这一个方法里处理
- (void)filterWithSearchString:(NSString *)searchString scope:(NSString *)scopeString
{
    [_searchResultArray removeAllObjects];
    
    if ([scopeString isEqualToString:@"按名字搜索"]) {
        for (NSArray *array in _allDishesArray) {
            for (ZYDishModel *dishModel in array) {
                if ([dishModel.name rangeOfString:searchString].location != NSNotFound) {
                    NSLog(@"dishModel.name-->>%@",dishModel.name);
                    [_searchResultArray addObject:dishModel];
                }
            }
        }
    }
    else if ([scopeString isEqualToString:@"按价格搜索"]){
        int price = [searchString intValue];
        int minPrice = price / 100 * 100;
        int maxPrice = (price / 100 + 1) * 100;
        
        for (NSArray *array in _allDishesArray) {
            for (ZYDishModel *dishModel in array) {
                if ([dishModel.price intValue] >= minPrice && [dishModel.price intValue] <= maxPrice) {
                    NSLog(@"dishModel.price-->>%@",dishModel.price);
                    [_searchResultArray addObject:dishModel];
                }
            }
        }
    }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
