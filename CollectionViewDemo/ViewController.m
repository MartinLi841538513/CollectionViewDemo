//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by dongway on 14-8-10.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController ()
{
    UICollectionView *collectionview;
    NSString *identifier;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    identifier = @"Cell";
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 640, 100) collectionViewLayout: layout];
    
    UINib *nib = [UINib nibWithNibName:@"Cell" bundle:nil];
    [collectionview registerNib:nib forCellWithReuseIdentifier:identifier];
    
    collectionview.delegate = self;
    collectionview.dataSource = self;
    collectionview.backgroundColor = [UIColor redColor];
    [self.view addSubview:collectionview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.titleLabel.text = @"title";
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
    
}

#pragma UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(97, 31);
}

#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSLog(@"didSelect:%d",row);
}
@end
