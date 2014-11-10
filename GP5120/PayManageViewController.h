//
//  PayManageViewController.h
//  GP5120
//
//  Created by 朱孟乐 on 14/11/9.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MBProgressHUD.h"

#import "ASIFormDataRequest.h"

@interface PayManageViewController : UIViewController<MBProgressHUDDelegate,UITextFieldDelegate>

@property(strong,nonatomic)UILabel *_callLabel;

@property(strong,nonatomic)UILabel *_payDetailLabel;

@property(strong,nonatomic)UILabel *_payLabel;

@property(strong,nonatomic)UITextField *_payField;

@property(strong,nonatomic)UIButton *_payTypeOne;

@property(strong,nonatomic)UIButton *_payTypeTwo;

@property(strong,nonatomic)NSString *_payTypes;

@property(strong,nonatomic)MBProgressHUD *_hud;

@end
