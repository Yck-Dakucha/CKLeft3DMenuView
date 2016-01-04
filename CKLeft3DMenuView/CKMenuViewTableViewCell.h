//
//  CKMenuViewTableViewCell.h
//  CKLeft3DMenuView
//
//  Created by 中青致学 on 15/12/31.
//  Copyright © 2015年 Yang_Cankun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKMenuViewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

- (void)setContentFromDic:(NSDictionary *)dic;

@end
