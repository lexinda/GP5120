//
//  ChangePasswordViewController.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/21.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASIFormDataRequest.h"

@interface ChangePasswordViewController : UIViewController<UITextFieldDelegate>

@property(strong,nonatomic)UITextField *_phone;

@property(strong,nonatomic)UITextField *_code;

@property(strong,nonatomic)UIButton *_getCode;

@property(strong,nonatomic)UITextField *_password;

@property(strong,nonatomic)UITextField *_passwordAgain;

@property(strong,nonatomic)NSTimer *_timer;

@property(nonatomic)int _number;

@end
