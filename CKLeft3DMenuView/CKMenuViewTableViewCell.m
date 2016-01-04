//
//  CKMenuViewTableViewCell.m
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 15/12/31.
//  Copyright © 2015年 Yang_Cankun. All rights reserved.
//

#import "CKMenuViewTableViewCell.h"
#import "UIColor+colorArray.h"

@implementation CKMenuViewTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setContentFromDic:(NSDictionary *)dic {
    self.cellImageView.backgroundColor = [UIColor colorArray:dic[@"colors"]];
    self.cellImageView.image = [UIImage imageNamed:dic[@"image"]];
}

@end
