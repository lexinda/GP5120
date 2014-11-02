//
//  FindPortTableView.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MJRefresh.h"

#import "MBProgressHUD.h"

#import "RecommandTeamCell.h"

#import "RecommandTeam.h"

#import "CarInfoViewController.h"

#import "AcceptInfoViewController.h"

#import "JSONKit.h"

#import "ASIHTTPRequest.h"

#import "ASIFormDataRequest.h"

#import "ReleaseInfo.h"

@interface FindPortTableView : UITableViewController<PushViewDelegate,MBProgressHUDDelegate>

@property(strong,nonatomic)NSMutableArray *_dataArray;

@property(strong,nonatomic)NSNumber *_activeIndex;

@property(strong,nonatomic)NSNumber *_clickIndex;

@property(nonatomic)int _page;

@property(strong,nonatomic)MBProgressHUD *_hud;

@property(strong,nonatomic)ReleaseInfo *_releaseInfo;

@end
