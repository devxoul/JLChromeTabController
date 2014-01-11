//
//  AppDelegate.m
//  JLChromeTabControllerSample
//
//  Created by 전수열 on 2014. 1. 8..
//  Copyright (c) 2014년 Joyfl. All rights reserved.
//

#import "AppDelegate.h"
#import "JLChromeTabController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    for( int i = 0; i < 10; i++ ) {
        UIViewController *viewController = [[UIViewController alloc] init];
        viewController.view.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:100];
        label.text = [NSString stringWithFormat:@"%d", i];
        [label sizeToFit];
        [viewController.view addSubview:label];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [viewControllers addObject:navController];
    }
    
    JLChromeTabController *tabController = [[JLChromeTabController alloc] init];
    tabController.viewControllers = viewControllers;
    self.window.rootViewController = tabController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
