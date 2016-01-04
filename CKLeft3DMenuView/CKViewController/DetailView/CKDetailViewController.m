//
//  CKDetailViewController.m
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 15/12/31.
//  Copyright © 2015年 Yang_Cankun. All rights reserved.
//

#import "CKDetailViewController.h"
#import "UIColor+colorArray.h"
#import "CKContainerViewController.h"

@interface CKDetailViewController ()


@end

@implementation CKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  取消NavigationBar下边的横线
     */
    self.navigationController.navigationBar.clipsToBounds = YES;
    /**
     *  设置leftBarButtonItem
     */
    self.hanmburgerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [self.hanmburgerBtn setImage:[UIImage imageNamed:@"Hamburger"] forState:UIControlStateNormal];
    [self.hanmburgerBtn addTarget:self action:@selector(hamburgerViewTapped) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.hanmburgerBtn];
}
#pragma mark -  hamburgerViewTapped
- (void)hamburgerViewTapped {
    UINavigationController *navVC = (UINavigationController *)self.parentViewController;
    CKContainerViewController *containerViewController = (CKContainerViewController *)navVC.parentViewController;
    [containerViewController hideOrShowMenu:!containerViewController.showingMenu animated:YES];
}
/**
 *  重写set方法来实时更新数据
 */
- (void)setMenuItem:(NSDictionary *)menuItem {
    self.view.backgroundColor = [UIColor colorArray:menuItem[@"colors"]];
    self.backgroundImageView.image = [UIImage imageNamed:menuItem[@"bigImage"]];
}

@end
