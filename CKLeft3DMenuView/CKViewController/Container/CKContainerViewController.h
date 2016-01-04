//
//  CKContainerViewController.h
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 15/12/31.
//  Copyright © 2015年 Yang_Cankun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CKDetailViewController;

@interface CKContainerViewController : UIViewController

@property (nonatomic, strong) CKDetailViewController *detailViewController;
@property (nonatomic, copy  ) NSDictionary           *menuItem;
@property (nonatomic, assign) BOOL                   showingMenu;

- (void)hideOrShowMenu:(BOOL)show animated:(BOOL)animated;

@end
