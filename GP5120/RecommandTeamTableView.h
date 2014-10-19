//
//  RecommandTeamTableView.h
//  GP5120
//
//  Created by lele126 on 14-8-9.
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

#import "AppUserInfo.h"

@interface RecommandTeamTableView : UITableViewController<PushViewDelegate,MBProgressHUDDelegate>

@property(strong,nonatomic)NSMutableArray *_dataArray;

@property(strong,nonatomic)NSNumber *_activeIndex;

@property(strong,nonatomic)NSNumber *_clickIndex;

@property(nonatomic)int _page;

@property(strong,nonatomic)MBProgressHUD *_hud;

@end
