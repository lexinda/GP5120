//
//  SetupCarInfoViewController.h
//  GP5120
//
//  Created by lele126 on 14-8-3.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FootButtonView.h"

#import "SuccessViewController.h"

#import "HomeInfoModel.h"

#import "DatePickerView.h"

#import "UIScrollView+UITouch.h"

#import "LoginAndRegisterViewController.h"

@interface SetupCarInfoViewController : UIViewController<UITextFieldDelegate,PushViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property(strong,nonatomic)UIScrollView *_mainScrollView;

@property(strong,nonatomic)HomeInfoModel *_homeInfoModel;

@property(strong,nonatomic)NSString *_transportType;

@property(strong,nonatomic)UIButton *_transportTypeOneButton;

@property(strong,nonatomic)UIButton *_transportTypeTwoButton;

@property(strong,nonatomic)UIButton *_takeOneButton;

@property(strong,nonatomic)UIButton *_takeTwoButton;

@property(strong,nonatomic)UIButton *_takeThreeButton;

@property(strong,nonatomic)UIButton *_takeFourButton;

@property(strong,nonatomic)NSString *_pack_date;

@property(strong,nonatomic)NSString *_boxType;

@property(strong,nonatomic)UITextField *_portTextField;

@property(strong,nonatomic)UITextField *_boxTextField;

@property(strong,nonatomic)UITextField *_weightField;

@property(strong,nonatomic)UITextField *_phoneField;

@property(strong,nonatomic)UITextField *_peopleField;

@property(strong,nonatomic)UITextField *_destinationField;

@property(strong,nonatomic)UITextField *_otherField;

@property(strong,nonatomic)UITextField *_priceField;

@property(strong,nonatomic)UIButton *_priceButton;

@property(strong,nonatomic)DatePickerView *_datePicker;

@property(strong,nonatomic)NSString *_price;

@property(strong,nonatomic)NSArray *_boxInfo;

@property(strong,nonatomic)UIPickerView *_pickerView;

@property(strong,nonatomic)UIToolbar *_keyboardDoneButtonView;

@property(strong,nonatomic)NSString *_addCarInfoType;

@end
