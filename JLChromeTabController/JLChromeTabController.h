//
//  JLChromeTabController.h
//  JLChromeTabControllerSample
//
//  Created by 전수열 on 2014. 1. 8..
//  Copyright (c) 2014년 Joyfl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLChromeTabController : UIViewController

@property (nonatomic, copy) NSArray *viewControllers;

@property(nonatomic, readonly) UIViewController *selectedViewController;
@property(nonatomic) NSUInteger selectedIndex;

@end
