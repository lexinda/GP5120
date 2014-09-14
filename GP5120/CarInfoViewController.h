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

@interface CarInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,PushViewDelegate>

@property(strong,nonatomic)UITableView *_bottomTableView;

@property(strong, nonatomic) NSMutableArray *_fakeData;

@end
