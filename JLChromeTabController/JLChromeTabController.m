//
//  JLChromeTabController.m
//  JLChromeTabControllerSample
//
//  Created by 전수열 on 2014. 1. 8..
//  Copyright (c) 2014년 Joyfl. All rights reserved.
//

#import "JLChromeTabController.h"
#import "JLChromeTabBar.h"

@interface JLChromeTabController () <JLChromeTabBarDelegate>

@property (nonatomic, strong) JLChromeTabBar *tabBar;

@end


@implementation JLChromeTabController

- (id)init
{
    self = [super init];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view.autoresizesSubviews = YES;
    
    self.tabBar = [[JLChromeTabBar alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 31)];
    self.tabBar.delegate = self;
    self.tabBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.tabBar];
    
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"size: %@", NSStringFromCGSize(self.view.bounds.size));
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = [viewControllers copy];
    
    NSMutableArray *items = [NSMutableArray array];
    for( UIViewController *viewController in viewControllers ) {
        [self addChildViewController:viewController];
        [items addObject:viewController.tabBarItem];
    }
    
    self.tabBar.items = items;
    
    if( self.selectedIndex == 0 ) {
        self.selectedIndex = 0;
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    if( selectedIndex >= self.viewControllers.count ) {
        return;
    }
    
    UIViewController *selectedViewController = self.selectedViewController;
    [selectedViewController.view removeFromSuperview];
    
    _selectedIndex = selectedIndex;
    
    selectedViewController = self.selectedViewController;
    selectedViewController.view.frame = CGRectMake(0, 51, self.view.bounds.size.width, self.view.bounds.size.height - 51);
    selectedViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:selectedViewController.view];
}

- (UIViewController *)selectedViewController
{
    return [self.viewControllers objectAtIndex:self.selectedIndex];
}


#pragma mark -
#pragma mark JLChromeTabBarDelegate

- (void)tabBar:(JLChromeTabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    self.selectedIndex = index;
}

@end
