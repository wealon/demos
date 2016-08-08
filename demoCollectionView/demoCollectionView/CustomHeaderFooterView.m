//
//  CustomHeaderFooterView.m
//  demoCollectionView
//
//  Created by wealon on 16/8/7.
//  Copyright © 2016年 MDJ. All rights reserved.
//

#import "CustomHeaderFooterView.h"

@interface CustomHeaderFooterView ()


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CustomHeaderFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)bindLabelTitle:(NSString *)title
{
    self.
    self.titleLabel.text = title;
}



@end
