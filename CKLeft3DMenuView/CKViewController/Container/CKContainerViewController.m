//
//  CKContainerViewController.m
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 15/12/31.
//  Copyright © 2015年 Yang_Cankun. All rights reserved.
//

#import "CKContainerViewController.h"
#import "CKDetailViewController.h"
#import "UIButton+rotate.h"

@interface CKContainerViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;
@property (weak, nonatomic) IBOutlet UIView *menuContainerView;

@end

@implementation CKContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.scrollerView.contentSize = self.contentView.frame.size;
}
- (void)hideOrShowMenu:(BOOL)show animated:(BOOL)animated {
    CGFloat menuOffset = CGRectGetWidth(self.menuContainerView.bounds);
    [self.scrollerView setContentOffset:show? CGPointZero : CGPointMake(menuOffset, 0) animated:animated];
    self.showingMenu = show;
}

- (void)setMenuItem:(NSDictionary *)menuItem {
    self.detailViewController.menuItem = menuItem;
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self hideOrShowMenu:self.showingMenu animated:NO];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.menuContainerView.layer.anchorPoint = CGPointMake(1.0, 0.5);
}
#pragma mark -  ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat multiplier = 1.0 / CGRectGetWidth(self.menuContainerView.bounds);
    CGFloat offset = scrollView.contentOffset.x * multiplier;
    CGFloat fraction = 1.0 - offset;
    self.menuContainerView.layer.transform = [self transformForFraction:fraction];
    self.menuContainerView.alpha = fraction;
    
    CKDetailViewController *detailVC = self.detailViewController;
    UIButton *rotatingBtn = detailVC.hanmburgerBtn;
    [rotatingBtn rotate:fraction];
    
    scrollView.pagingEnabled = scrollView.contentOffset.x < (scrollView.contentSize.width - CGRectGetWidth(scrollView.frame)) ? YES:NO;
    CGFloat menuOffset = CGRectGetWidth(self.menuContainerView.bounds);
    self.showingMenu = !CGPointEqualToPoint(CGPointMake(menuOffset, 0), scrollView.contentOffset);

    
}
/**
 *  1.fraction当menu完全隐藏的时候是0,完全显示的时候是1.
 *  2.CATransform3DIdentity代表原始的Transform.
 *  3.CATransform3DIdentity’s m34这个值代表view的perspective.(设置了他旋转的时候才会有3D效果)
 *  4.利用CATransform3DRotate来实现菜单的旋转效果.并且是绕Y轴旋转.-90度的时候代表与平面向内垂直(所以你看不到).0度的时候水品展开.
 *  5.translateTransform负责menu在旋转的时候同时位移到正确的位置.
 *  6.CATransform3DConcat负责把位置的transform和旋转的transform结合起来
 */
#pragma mark -  transformForFraction >>> 3D旋转
- (CATransform3D)transformForFraction:(CGFloat)fraction {
    CATransform3D identity = CATransform3DIdentity;
    identity.m34 =  -1.0/1000.0;
    CGFloat angle = (double)(1.0 - fraction) * -M_PI_2;
    CGFloat xOffset = CGRectGetWidth(self.menuContainerView.bounds) * 0.5;
    CATransform3D rotateTransform = CATransform3DRotate(identity, (CGFloat)angle, 0.0, 1.0, 0.0);
    CATransform3D translateTransform = CATransform3DMakeTranslation(xOffset, 0.0, 0.0);
    return CATransform3DConcat(rotateTransform, translateTransform);
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailViewSegue"]) {
        UINavigationController *navVC = (UINavigationController *)segue.destinationViewController;
        self.detailViewController = (CKDetailViewController *)navVC.topViewController;
    }
}


@end
