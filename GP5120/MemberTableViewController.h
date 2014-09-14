//
//  MemberTableViewController.h
//  GP5120
//
//  Created by lele126 on 14-8-12.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TreeViewNode.h"

#import "TableViewCell.h"

@interface MemberTableViewController : UITableViewController

@property(strong,nonatomic)NSMutableArray *_displayArray;

@property(strong,nonatomic)NSMutableArray *_nodes;

@end
