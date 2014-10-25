//
//  TableViewCell.h
//  GP5120
//
//  Created by lele126 on 14-8-12.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TreeViewNode.h"

#import "ViewReleaseInfoDriverOrder.h"

#import "UsrInGpMemberOrder.h"

#import "MemberDelegate.h"

@interface TableViewCell : UITableViewCell

@property(strong,nonatomic)UILabel *cellsLabel;

@property(strong,nonatomic)UIButton *cellsButton;

@property(strong,nonatomic)TreeViewNode *treeNode;

@property(nonatomic)BOOL isExpanded;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier treeViewNode:(TreeViewNode *)treeNode;

- (void)setTheButtonBackgroundImage:(UIImage *)backgroundImage;

@property(strong,nonatomic)id<MemberDelegate> _memberDelegate;

@property(strong,nonatomic)NSDictionary *_memberDictionary;

@end
