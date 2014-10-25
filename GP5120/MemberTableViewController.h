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

#import "ASIFormDataRequest.h"

#import "MBProgressHUD.h"

#import "JSONKit.h"

#import "Table.h"

#import "ViewReleaseInfoDriverOrder.h"

#import "UsrInGpMemberOrder.h"

#import "AppUserInfo.h"

#import "UserInfoTableViewCell.h"

@interface MemberTableViewController : UITableViewController<MBProgressHUDDelegate,MemberDelegate,UIAlertViewDelegate>

@property(strong,nonatomic)NSMutableArray *_displayArray;

@property(strong,nonatomic)NSMutableArray *_memberInfo;

@property(strong,nonatomic)NSMutableArray *_nodes;

@property(strong,nonatomic)NSNumber *_activeIndex;

@property(strong,nonatomic)NSNumber *_clickIndex;

@property(strong,nonatomic)AppUserInfo *_appUserInfo;

@property(strong,nonatomic)MBProgressHUD *_hub;

@end
