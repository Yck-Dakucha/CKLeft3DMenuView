//
//  UIColor+colorArray.m
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 15/12/31.
//  Copyright © 2015年 Yang_Cankun. All rights reserved.
//

#import "UIColor+colorArray.h"

@implementation UIColor (colorArray)

+ (UIColor *)colorArray:(NSArray *)array {
    CGFloat red = [array[0] floatValue];
    CGFloat blue = [array[1] floatValue];
    CGFloat green = [array[2] floatValue];
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    return color;
}

@end
