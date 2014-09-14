//
//  TableViewCell.h
//  GP5120
//
//  Created by lele126 on 14-8-12.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TreeViewNode.h"

@interface TableViewCell : UITableViewCell

@property(strong,nonatomic)UILabel *cellLabel;

@property(strong,nonatomic)UIButton *cellButton;

@property(strong,nonatomic)TreeViewNode *treeNode;

@property(nonatomic)BOOL isExpanded;

- (void)setTheButtonBackgroundImage:(UIImage *)backgroundImage;

@end
