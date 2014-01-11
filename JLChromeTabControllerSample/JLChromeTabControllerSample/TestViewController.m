//
//  TestViewController.m
//  JLChromeTabControllerSample
//
//  Created by 전수열 on 2014. 1. 11..
//  Copyright (c) 2014년 Joyfl. All rights reserved.
//

#import "TestViewController.h"

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:100];
    label.text = self.title;
    [label sizeToFit];
    [self.view addSubview:label];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@ viewWillAppear", self.title);
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%@ viewDidAppear", self.title);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
