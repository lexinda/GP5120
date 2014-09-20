//
//  DateAndTimePickerViewController.h
//  GP5120
//
//  Created by 朱孟乐 on 14-9-20.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateAndTimePickerViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property(strong,nonatomic)UITextField *textFieldEnterDate;

@property(strong,nonatomic)UIToolbar *toolbarCancelDone;

@property(strong,nonatomic)UIPickerView *customPicker;

-(void)actionCancel:(id)sender;

-(void)actionDone:(id)sender;

@end
