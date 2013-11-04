//
//  ZYMyOrderCell.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-11-4.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYMyOrderCell.h"

@implementation ZYMyOrderCell
@synthesize sequenceNumberLabel = _sequenceNumberLabel;
@synthesize dishKindLabel = _dishKindLabel;
@synthesize dishNameLabel = _dishNameLabel;
@synthesize dishPrciceLabel = _dishPrciceLabel;
@synthesize dishNumTF = _dishNumTF;
@synthesize dishRemarkTF = _dishRemarkTF;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    [_sequenceNumberLabel release];
    [_dishKindLabel release];
    [_dishNameLabel release];
    [_dishPrciceLabel release];
    [_dishNumTF release];
    [_dishRemarkTF release];
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
