//
//  HomeViewController.h
//  GP5120
//
//  Created by lele126 on 14-8-2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TopButtonView.h"

#import "MeddleTextField.h"

#import "MeddleTextFieldTwo.h"

#import "MJRefresh.h"

#import "FootButtonView.h"

#import "SetupCarInfoViewController.h"

#import "TSPopoverController.h"

#import "TSActionSheet.h"

#import "RecommandTeamTableView.h"

#import "MemberTableViewController.h"

#import "PhotoSetViewController.h"

#import "MapDataViewController.h"

#import "CarInfoViewController.h"

#import "DatePickerView.h"

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,PushViewDelegate>

@property(strong,nonatomic)UITableView *_tableView;

@property(strong, nonatomic) NSMutableArray *_fakeData;

@property(strong,nonatomic)UIView *_meddleView;

@property(strong,nonatomic)DatePickerView *_datePicker;

@end
