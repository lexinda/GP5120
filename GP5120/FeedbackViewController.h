//
//  FeedbackViewController.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/26.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASIFormDataRequest.h"

@interface FeedbackViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate>

@property(strong,nonatomic)UITextView *_feedBackText;

@property(strong,nonatomic)UITextField *_usernameField;

@property(strong,nonatomic)UITextField *_phoneField;

@property(strong,nonatomic)UITextField *_mailField;

@end
