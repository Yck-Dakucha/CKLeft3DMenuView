//
//  CKDetailViewController.h
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 15/12/31.
//  Copyright © 2015年 Yang_Cankun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView  *backgroundImageView;
@property (nonatomic, copy) NSDictionary *menuItem;
@property (nonatomic, strong) UIButton *hanmburgerBtn;

@end
