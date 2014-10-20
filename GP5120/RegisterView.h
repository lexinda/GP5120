//
//  RegisterView.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PushViewDelegate.h"

@interface RegisterView : UIView<UITextFieldDelegate>

@property(strong,nonatomic)UITextField *_oneTextFiled;

@property(strong,nonatomic)UITextField *_twoTextFiled;

@property(strong,nonatomic)NSString *_leftButtonText;

@property(strong,nonatomic)NSString *_rightButtonText;

@property(strong,nonatomic)id<PushViewDelegate> _pushViewDelegate;

@end
