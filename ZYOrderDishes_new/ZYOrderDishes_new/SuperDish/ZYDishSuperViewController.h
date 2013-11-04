//
//  ZYDishSuperViewController.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYDishGroupModel.h"
#import "ZYDetailView.h"
#import "ZYDishDao.h"
#import "ZYOrderDao.h"

@interface ZYDishSuperViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate,DetailViewDelegate>
{
    IBOutlet UITableView *_dishSuperTableView;
    
    
    ZYDishGroupModel *_dishGroupModel;
    ZYDishModel *_currentDishModel;
    
    NSArray *_allKindArray;
    NSMutableArray *_allDishesArray;
    
    int _currentSelectRow;
    
    BOOL _sectionFlag[10];
    
    //搜索
    UISearchDisplayController *_searchDisplay;
    NSMutableArray *_searchResultArray;
}

@property (nonatomic ,retain) NSMutableArray *allDishesArray;
@property (nonatomic, retain) ZYDishGroupModel *dishGroupModel;
@property (nonatomic, retain) ZYDishModel *currentDishModel;
@property (nonatomic, retain) UITableView *dishSuperTableView;
@property (nonatomic, retain) NSArray *allKindArray;
@property (nonatomic, retain) NSMutableArray *searchResultArray;

- (IBAction)showDetail:(id)sender;
- (void)showAlertView;
- (id)initWithDishGroup:(ZYDishGroupModel *)groupModel;

@end
