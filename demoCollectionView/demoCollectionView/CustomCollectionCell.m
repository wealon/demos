//
//  CustomCollectionCell.m
//  demoCollectionView
//
//  Created by wealon on 16/8/7.
//  Copyright © 2016年 MDJ. All rights reserved.
//

#import "CustomCollectionCell.h"

@interface CustomCollectionCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation CustomCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)bindTitle:(NSString *)title
{
    self.titleLabel.text = title;
}
@end
