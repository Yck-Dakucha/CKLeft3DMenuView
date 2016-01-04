//
//  CKDetailViewController.h
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 15/12/31.
//  Copyright © 2015年 Yang_Cankun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKDetailViewController : UIViewController
/**
 *  对应图片
 */
@property (weak, nonatomic) IBOutlet UIImageView  *backgroundImageView;
/**
 *  数据字典
 */
@property (nonatomic, copy) NSDictionary *menuItem;
/**
 *  展开侧边栏按钮
 */
@property (nonatomic, strong) UIButton *hanmburgerBtn;

@end
