//
//  ViewController.m
//  SimpleToUse_UICollectionView2
//
//  Created by Geraint on 2018/11/22.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 创建一个layout布局类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical; // 设置布局方向为 垂直方向
    
    // 设置 分区的偏移量(与superView的边距)
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    // 创建collectionView 通过一个布局策略layout来创建
    UICollectionView *collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 600) collectionViewLayout:layout];
    collect.delegate = self;
    collect.dataSource = self;
    
    // 注册item类型，这里使用系统的类型 (在完成代理回调前，必须注册一个cell)
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    
    [self.view addSubview:collect];
    
}

#pragma mark -- （动态设置每个item的大小）设置每个item的大小，双数的为50*50  单数的为100*100  “可省略”
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        return CGSizeMake(50, 50);
    } else {
        return CGSizeMake(100, 100);
    }
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row % 4 == 0) {
//        return CGSizeMake(20, 20);
//    } else if (indexPath.row % 4 != 0 && indexPath.row % 2 == 0) {
//        return CGSizeMake(50, 50);
//    } else if (indexPath.row % 4 != 0 && indexPath.row % 2 != 0) {
//        return CGSizeMake(70, 70);
//    } else {
//        return CGSizeMake(100, 100);
//    }
//}

#pragma mark -- （动态设置每个分区的Edgelnsets）     "一般可省略"
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section % 2 == 0) {
        return UIEdgeInsetsMake(20, 20, 20, 20);
    } else {
        return UIEdgeInsetsMake(50, 50, 50, 50);
    }
}

// 动态设置每行的间距大小     “可省略”
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section % 2 == 0) {
        return 20;
    } else {
        return 40;
    }
}

// 动态设置每列的间距大小      “可省略”
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section % 2 == 0) {
        return 10;
    } else {
        return 200;
    }
}

#pragma mark -- （动态设置某个分区头视图、分区尾视图的大小） “可省略”
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(collectionView.frame.size.width, 10);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(collectionView.frame.size.width, 10);
}

#pragma mark -- 代理方法 （必须写）
// 返回分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}
// 返回每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255/255.0 green:arc4random() % 255/255.0 blue:arc4random() % 255/255.0 alpha:1];
    
    return cell;
}


@end
