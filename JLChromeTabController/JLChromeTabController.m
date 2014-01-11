//
//  JLChromeTabController.m
//  JLChromeTabControllerSample
//
//  Created by 전수열 on 2014. 1. 8..
//  Copyright (c) 2014년 Joyfl. All rights reserved.
//

#import "JLChromeTabController.h"
#import "JLChromeTabBar.h"

@interface JLChromeTabController ()

@property (nonatomic, strong) JLChromeTabBar *tabBar;

@end


@implementation JLChromeTabController

- (id)init
{
    self = [super init];
    
    self.tabBar = [[JLChromeTabBar alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 31)];
    self.tabBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.tabBar];
    
    return self;
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = [viewControllers copy];
    
    NSMutableArray *items = [NSMutableArray array];
    for( UIViewController *viewController in viewControllers ) {
        [items addObject:viewController.tabBarItem];
    }
    
    self.tabBar.items = items;
}

@end
