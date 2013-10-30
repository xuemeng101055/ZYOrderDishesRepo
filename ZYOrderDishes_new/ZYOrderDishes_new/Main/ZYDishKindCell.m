//
//  ZYDishKindCell.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-30.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYDishKindCell.h"

@implementation ZYDishKindCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _menuImageView = [[UIImageView alloc] init];
        _menuImageView.frame = CGRectMake(0, 0, 37, 100);
        [self addSubview:_menuImageView];
        [_menuImageView release];

    }
    return self;
}

- (void)dealloc
{
    [_menuImageView release];
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
