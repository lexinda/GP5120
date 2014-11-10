//
//  HomeViewController.h
//  GP5120
//
//  Created by lele126 on 14-8-2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AddressBook/AddressBook.h>

#import <AddressBookUI/AddressBookUI.h>

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

#import "ASIFormDataRequest.h"

#import "AppUserInfo.h"

#import "Table.h"

#import "AdList.h"

#import "JSONKit.h"

#import "FindPortTableView.h"

#import "SetupUserInfoViewController.h"

#import "ChangePasswordViewController.h"

#import "ValidataLogin.h"

#import "LoginAndRegisterViewController.h"

#import "ValidataLogin.h"

#import "QueryCarInfoViewController.h"

#import "FeedbackViewController.h"

#import "PayManageViewController.h"

#import "QueryConsumeViewController.h"

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,PushViewDelegate,ABPeoplePickerNavigationControllerDelegate,UIAlertViewDelegate>

@property(strong,nonatomic)UITableView *_tableView;

@property(strong, nonatomic) NSMutableArray *_fakeData;

@property(strong,nonatomic)UIView *_meddleView;

@property(strong,nonatomic)DatePickerView *_datePicker;

@property(strong,nonatomic)NSString *_queryOtherTime;

@property(strong,nonatomic)NSMutableArray *_phoneArray;

@property(strong,nonatomic)MeddleTextField *_meddleTextField;

@property(strong,nonatomic)MeddleTextFieldTwo *_meddleTextFieldTwo;

@end
