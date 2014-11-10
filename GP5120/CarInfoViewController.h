//
//  CarInfoViewController.h
//  GP5120
//
//  Created by lele126 on 14-8-6.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CarInfoTopView.h"

#import "CarInfo.h"

#import "CarInfoTopView.h"

#import "MJRefresh.h"

#import "FootButtonView.h"

#import "CarInfoBottomCell.h"

#import "CarInfoCell.h"

#import "AcceptInfoViewController.h"

#import "MBProgressHUD.h"

#import "ASIFormDataRequest.h"

#import "JSONKit.h"

#import "Table.h"

#import "CarInfoDetailView.h"

@interface CarInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,PushViewDelegate,MBProgressHUDDelegate>

@property(strong,nonatomic)UITableView *_bottomTableView;

@property(strong, nonatomic) NSMutableArray *_fakeData;

@property(strong,nonatomic)MBProgressHUD *_hud;

@property(strong,nonatomic)Table *_table;

@end
