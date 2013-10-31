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

@interface ZYDishSuperViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DetailViewDelegate>
{
    IBOutlet UITableView *_dishSuperTableView;
    
    
    ZYDishGroupModel *_dishGroupModel;
    NSArray *_allKindArray;
    NSMutableArray *_allDishesArray;
    
    int _currentSelectRow;
    
    BOOL _sectionFlag[10];
}

@property (nonatomic ,retain) NSMutableArray *allDishesArray;
@property (nonatomic, retain) ZYDishGroupModel *dishGroupModel;
@property (nonatomic, retain) UITableView *dishSuperTableView;
@property (nonatomic, retain) NSArray *allKindArray;

- (IBAction)showDetail:(id)sender;

- (id)initWithDishGroup:(ZYDishGroupModel *)groupModel;

@end
