//
//  JLChromeTabBar.m
//  JLChromeTabControllerSample
//
//  Created by 전수열 on 2014. 1. 8..
//  Copyright (c) 2014년 Joyfl. All rights reserved.
//

#import "JLChromeTabBar.h"
#import "JLChromeTabBarItemCell.h"

@interface JLChromeTabBarLayout : UICollectionViewFlowLayout
@end

@implementation JLChromeTabBarLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    [attributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attributes, NSUInteger idx, BOOL *stop) {
        
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:attributes.indexPath];
        if( cell.selected ) {
            attributes.zIndex = NSUIntegerMax;
        } else {
            attributes.zIndex = NSUIntegerMax - attributes.indexPath.item - 1;
        }
    }];
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    attributes.transform3D = CATransform3DMakeTranslation(0, 0, attributes.indexPath.item);
    return attributes;
}

@end


@interface JLChromeTabBar () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end


@implementation JLChromeTabBar

static NSString *kCellID = @"kCellID";

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    JLChromeTabBarLayout *layout = [[JLChromeTabBarLayout alloc] init];
    layout.itemSize = CGSizeMake(218, 31);
    layout.minimumLineSpacing = -18;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 31) collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[JLChromeTabBarItemCell class] forCellWithReuseIdentifier:kCellID];
    [self addSubview:self.collectionView];
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = CGRectMake(0, 0, self.frame.size.width, 31);
}

- (void)setItems:(NSArray *)items
{
    _items = [items copy];
    [self.collectionView reloadData];
}


#pragma mark -
#pragma mark UITableView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JLChromeTabBarItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
    [self.collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
}

@end
