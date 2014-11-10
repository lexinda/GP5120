//
//  QueryConsumeViewController.h
//  GP5120
//
//  Created by 朱孟乐 on 14/11/9.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MBProgressHUD.h"

#import "ASIFormDataRequest.h"

#import "JSONKit.h"

#import "AppUserInfo.h"

#import "PayManageViewController.h"

@interface QueryConsumeViewController : UIViewController<MBProgressHUDDelegate>

@property(strong,nonatomic)UILabel *_callLabel;

@property(strong,nonatomic)UILabel *_accountLabel;

@property(strong,nonatomic)MBProgressHUD *_hud;

@end
