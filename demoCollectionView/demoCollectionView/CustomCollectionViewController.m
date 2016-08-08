//
//  CustomCollectionViewController.m
//  demoCollectionView
//
//  Created by wealon on 16/8/7.
//  Copyright © 2016年 MDJ. All rights reserved.
//

#import "CustomCollectionViewController.h"
#import "CustomHeaderFooterView.h"
#import "CustomCollectionCell.h"

#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define MDJRandomColor (RGB_COLOR(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256)))


@interface CustomCollectionViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation CustomCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionView *col = [self createCollectionView];
    self.collectionView = col;
    CGSize viewSize = self.view.bounds.size;
    col.frame = CGRectMake(0, 20, viewSize.width, viewSize.height);
    [self.view addSubview:col];
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    [self.collectionView registerClass:[CustomHeaderFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerFooter"];
//    [self.collectionView registerClass:[CustomHeaderFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"headerFooter"];
//
    [self.collectionView registerNib:[UINib nibWithNibName:@"CustomCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CustomHeaderFooterView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerFooter"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CustomHeaderFooterView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"headerFooter"];
}

- (UICollectionView *)createCollectionView
{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.headerReferenceSize = CGSizeMake(200, 44);
    layout.footerReferenceSize = CGSizeMake(200, 44);
    
    UICollectionView *col = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    col.dataSource = self;
    col.delegate = self;
    col.alwaysBounceVertical = YES;
    col.backgroundColor = [UIColor whiteColor];
    return col;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = MDJRandomColor;
    [cell bindTitle:[NSString stringWithFormat:@"%zd",indexPath.item]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *reuseIdentifier = @"headerFooter";
    CustomHeaderFooterView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    reusableView.backgroundColor = MDJRandomColor;
    
    NSString *title = @"header";
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        title = @"footer";
    }
    
    [reusableView bindLabelTitle:title];
    return reusableView;
}

@end
