//
//  UIColor+colorArray.h
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 15/12/31.
//  Copyright © 2015年 Yang_Cankun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (colorArray)
/**
 *  通过数组返回颜色
 *
 *  @param array [0]:Red [1]:Blue [2]:Green
 *
 *  @return UIColor
 */
+ (UIColor *)colorArray:(NSArray *)array;

@end
