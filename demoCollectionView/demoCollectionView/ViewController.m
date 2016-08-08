//
//  ViewController.m
//  demoCollectionView
//
//  Created by wealon on 16/8/6.
//  Copyright © 2016年 MDJ. All rights reserved.
//

#import "ViewController.h"

// Log About
#ifdef DEBUG
#   define MDJLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define MDJLog(...)
#endif

#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define MDJRandomColor (RGB_COLOR(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256)))


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = self.view.backgroundColor;
    self.collectionView.alwaysBounceVertical = YES;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = MDJRandomColor;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *reuseIdentifier = @"header";
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        reuseIdentifier = @"footer";
    }
    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    reusableView.backgroundColor = MDJRandomColor;
    UILabel *label = [self labelWithIdentifier:reuseIdentifier];
    [reusableView addSubview:label];
    label.frame = CGRectMake(20, 0, 200, 30);
    return reusableView;
}

- (UILabel *)labelWithIdentifier:(NSString *)identifier
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.text = identifier;
    return label;
}


@end
