//
//  JLChromeTabBar.h
//  JLChromeTabControllerSample
//
//  Created by 전수열 on 2014. 1. 8..
//  Copyright (c) 2014년 Joyfl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JLChromeTabBarDelegate;

@interface JLChromeTabBar : UIView

@property (nonatomic, assign) id<JLChromeTabBarDelegate> delegate;
@property (nonatomic, copy) NSArray *items;
//@property (nonatomic, assign) UITabBarItem *selectedItem;

@end


@protocol JLChromeTabBarDelegate <NSObject>

@optional
- (void)tabBar:(JLChromeTabBar *)tabBar didSelectItem:(UITabBarItem *)item;

@end