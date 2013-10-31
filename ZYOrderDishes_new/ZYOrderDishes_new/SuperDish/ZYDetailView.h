//
//  ZYDetailView.h
//  ZYOrderDishes_new
//
//  Created by wangwei on 13-10-31.
//  Copyright (c) 2013年 Stephy_xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYDetailView : UIView

{
    id _delegate;
}
@property (nonatomic, assign)id delegate;

- (void)show;

@end


@protocol DetailViewDelegate <NSObject>

- (void)exit:(ZYDetailView *)view;

@end
