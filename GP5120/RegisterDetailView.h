//
//  RegisterDetailView.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PushViewDelegate.h"

@interface RegisterDetailView : UIView<UITextFieldDelegate,UITextViewDelegate>

@property(strong,nonatomic)NSString *_companyType;

@property(strong,nonatomic)UITextField *_port;

@property(strong,nonatomic)UITextField *_companyName;

@property(strong,nonatomic)UITextField *_concatPeople;

@property(strong,nonatomic)UITextField *_concatPhone;

@property(strong,nonatomic)UITextField *_email;

@property(strong,nonatomic)UITextField *_msn;

@property(strong,nonatomic)UITextField *_qq;

@property(strong,nonatomic)UITextField *_weixin;

@property(strong,nonatomic)UITextField *_companyAddress;

@property(strong,nonatomic)UITextView *_companyIntro;

@property(strong,nonatomic)id<PushViewDelegate> _pushViewDelegate;

@end
