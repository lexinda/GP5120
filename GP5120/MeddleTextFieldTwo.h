//
//  MeddleTextFieldTwo.h
//  GP5120
//
//  Created by 朱孟乐 on 14-9-17.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PushViewDelegate.h"

#import "ValidataLogin.h"

@interface MeddleTextFieldTwo : UIView<UITextFieldDelegate>

@property(strong,nonatomic)UITextField *_onePortTextFiled;

@property(strong,nonatomic)UITextField *_twoPortTextFiled;

@property(strong,nonatomic)NSString *_oneText;

@property(strong,nonatomic)NSString *_twoText;

@property(strong,nonatomic)NSString *_leftButtonText;

@property(strong,nonatomic)NSString *_rightButtonText;

@property(strong,nonatomic)NSString *_queryPortTime;

@property(strong,nonatomic)id<PushViewDelegate> _pushViewDelegate;

@end
