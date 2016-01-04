//
//  UIButton+rotate.m
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 16/1/2.
//  Copyright © 2016年 Yang_Cankun. All rights reserved.
//

#import "UIButton+rotate.h"

@implementation UIButton (rotate)

- (void)rotate:(CGFloat)fraction {
    CGFloat angle = (double)fraction * M_PI_2;
    self.imageView.transform = CGAffineTransformMakeRotation((CGFloat)angle);
}

@end
