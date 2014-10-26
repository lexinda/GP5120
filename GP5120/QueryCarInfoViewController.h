//
//  QueryCarInfoViewController.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/26.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QueryCarInfoView.h"

#import "MBProgressHUD.h"

#import "ASIFormDataRequest.h"

#import "AppUserInfo.h"

#import "Table.h"

#import "ReleasePersonInfo.h"

#import "JSONKit.h"

@interface QueryCarInfoViewController : UIViewController<MBProgressHUDDelegate>

@property(strong,nonatomic)QueryCarInfoView *_queryCarInfoView;

@property(strong,nonatomic)MBProgressHUD *_hud;

@property(strong,nonatomic)AppUserInfo *_appUserInfo;

@property(strong,nonatomic)Table *_table;

@property(strong,nonatomic)ReleasePersonInfo *_releasePersonInfo;

@end
