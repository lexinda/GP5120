//
//  LoginAndRegisterViewController.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ValidataLogin.h"

#import "RegisterViewController.h"

@interface LoginAndRegisterViewController : UIViewController<UITextFieldDelegate>

@property(strong,nonatomic)UITextField *_usernameTextField;

@property(strong,nonatomic)UITextField *_passwordTextField;

@property(strong,nonatomic)NSString *_isAutoLogin;

@end
