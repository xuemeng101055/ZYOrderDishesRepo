//
//  ZYDetailView.m
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-31.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import "ZYDetailView.h"

@implementation ZYDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(0, 0, 1024, 768);
        
        UIImageView *bgImageView = [[UIImageView alloc] init];
        
        bgImageView.image = [UIImage imageNamed:@"bgp4.png"];
        
        bgImageView.bounds = CGRectMake(0, 0, 800, 600);
        bgImageView.center = CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2);
        bgImageView.userInteractionEnabled = YES;
        [self addSubview:bgImageView];
        
        
        UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        exitBtn.frame = CGRectMake(500, 200, 50, 50);
        [exitBtn addTarget:self action:@selector(dissMiss) forControlEvents:UIControlEventTouchUpInside];
        [bgImageView addSubview:exitBtn];
    }
    return self;
}

- (void)dissMiss
{
    if ([_delegate respondsToSelector:@selector(exit:)]) {
        [_delegate exit:self];
    }
}

- (void)show
{
    self.transform = CGAffineTransformMakeRotation(M_PI / 2);
    self.center = CGPointMake(768 / 2, 1024 / 2);
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:self];
}

@end
