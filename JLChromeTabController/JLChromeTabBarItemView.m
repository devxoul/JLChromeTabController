//
//  JLChromeTabBarItemView.m
//  JLChromeTabControllerSample
//
//  Created by 전수열 on 2014. 1. 8..
//  Copyright (c) 2014년 Joyfl. All rights reserved.
//

#import "JLChromeTabBarItemView.h"

@interface JLChromeTabBarItemView ()

//@property (nonatomic, strong) UIImageView *backgroundView;

@end


@implementation JLChromeTabBarItemView

- (id)init
{
    self = [self initWithFrame:CGRectMake(0, 0, 218, 31)];
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    [self setBackgroundImage:[self createBackgroundImageForState:UIControlStateNormal] forState:UIControlStateNormal];
    [self setBackgroundImage:[self createBackgroundImageForState:UIControlStateSelected] forState:UIControlStateSelected];
    [self setBackgroundImage:[self createBackgroundImageForState:UIControlStateDisabled] forState:UIControlStateDisabled];
    
    return self;
}

- (UIImage *)createBackgroundImageForState:(UIControlState)state
{
    UIImage *image = nil;
    
    CGPoint points[] = {
        CGPointMake(0, 31),
        CGPointMake(20, 0),
        CGPointMake(30, 0),
        CGPointMake(50, 31),
    };
    
    UIColor *backgroundColor = nil;
    if( state == UIControlStateNormal ) {
        backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:1];
    } else if( state == UIControlStateSelected ) {
        backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    } else if( state == UIControlStateDisabled ) {
        backgroundColor = [UIColor colorWithRed:218/255.0 green:218/255.0 blue:218/255.0 alpha:0.6];
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(50, 31));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    CGContextAddLines(context, points, 4);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1].CGColor);
    CGContextSetLineWidth(context, 0.5);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 31, 30)];
}

@end
