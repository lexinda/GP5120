//
//  SetupUserInfoViewController.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/21.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASIFormDataRequest.h"

#import "MBProgressHUD.h"

#import "JSONKit.h"

#import "AppUserInfo.h"

@interface SetupUserInfoViewController : UIViewController<UITextFieldDelegate,MBProgressHUDDelegate,UIAlertViewDelegate>

@property(strong,nonatomic)UITextField *_nickName;

@property(strong,nonatomic)UITextField *_companyType;

@property(strong,nonatomic)UITextField *_companyAddress;

@property(strong,nonatomic)UITextField *_companyName;

@property(strong,nonatomic)UITextField *_people;

@property(strong,nonatomic)UITextField *_phone;

@property(strong,nonatomic)UITextField *_email;

@property(strong,nonatomic)UITextField *_fax;

@property(strong,nonatomic)MBProgressHUD *_hud;

@end
