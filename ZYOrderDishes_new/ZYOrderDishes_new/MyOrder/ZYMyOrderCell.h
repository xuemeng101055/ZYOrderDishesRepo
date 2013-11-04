//
//  ZYMyOrderCell.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-11-4.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYMyOrderCell : UITableViewCell
{
    IBOutlet UILabel     *_sequenceNumberLabel;
    IBOutlet UILabel     *_dishNameLabel;
    IBOutlet UILabel     *_dishPrciceLabel;
    IBOutlet UILabel     *_dishKindLabel;
    IBOutlet UITextField *_dishNumTF;
    IBOutlet UITextField *_dishRemarkTF;
}

@property (nonatomic, retain) UILabel     *sequenceNumberLabel;
@property (nonatomic, retain) UILabel     *dishNameLabel;
@property (nonatomic, retain) UILabel     *dishPrciceLabel;
@property (nonatomic, retain) UILabel     *dishKindLabel;
@property (nonatomic, retain) UITextField *dishNumTF;
@property (nonatomic, retain) UITextField *dishRemarkTF;
@end
