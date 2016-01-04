//
//  CKMenuViewController.m
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 15/12/31.
//  Copyright © 2015年 Yang_Cankun. All rights reserved.
//

#import "CKMenuViewController.h"
#import "CKMenuViewTableViewCell.h"
#import "CKDetailViewController.h"
#import "CKContainerViewController.h"

@interface CKMenuViewController ()

@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation CKMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"];
    self.menuItems = [[NSArray alloc] initWithContentsOfFile:path];
    self.navigationController.navigationBar.clipsToBounds = YES;
    
    //确保进入界面时选择第一个
    NSDictionary *menuItem = (NSDictionary *)self.menuItems[0];
    CKContainerViewController *containerVC = (CKContainerViewController *)self.navigationController.parentViewController;
    containerVC.menuItem = menuItem;

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CKMenuViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCell"];

    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CKMenuViewTableViewCell *menucell = (CKMenuViewTableViewCell *)cell;
    [menucell setContentFromDic:self.menuItems[indexPath.row]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return MAX(80,(CGRectGetHeight(self.view.bounds)/(CGFloat)self.menuItems.count));
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *menuItem = (NSDictionary *)self.menuItems[indexPath.row];
    CKContainerViewController *containerVC = (CKContainerViewController *)self.navigationController.parentViewController;
    containerVC.menuItem = menuItem;
    [containerVC hideOrShowMenu:NO animated:YES];
    
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//    if ([segue.identifier isEqualToString: @"showDetail"]) {
//        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
//        CKDetailViewController *detailVC = (CKDetailViewController *)segue.destinationViewController;
//        detailVC.menuItem = self.menuItems[indexPath.row];
//    }
//}


@end
