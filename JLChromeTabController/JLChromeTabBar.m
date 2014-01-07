//
//  JLChromeTabBar.m
//  JLChromeTabControllerSample
//
//  Created by 전수열 on 2014. 1. 8..
//  Copyright (c) 2014년 Joyfl. All rights reserved.
//

#import "JLChromeTabBar.h"
#import "JLChromeTabBarItemView.h"

@interface JLChromeTabBar ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end


@implementation JLChromeTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 31)];
    [self addSubview:self.scrollView];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = CGRectMake(0, 0, self.frame.size.width, 62);
}

- (void)setItems:(NSArray *)items
{
    _items = [items copy];
    
    for( int i = 0; i < items.count; i++ ) {
        CGRect frame = CGRectMake(200 * i, 0, 218, 31);
        JLChromeTabBarItemView *itemView = [[JLChromeTabBarItemView alloc] initWithFrame:frame];
        if( i == 0 ) {
            itemView.selected = YES;
        }
        [self.scrollView insertSubview:itemView atIndex:0];
    }
    
    self.scrollView.contentSize = CGSizeMake(200 * items.count + 18, 31);
}

@end
