//
//  DatePickerView.h
//  GP5120
//
//  Created by 朱孟乐 on 14-9-20.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerView : UIView<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property(strong,nonatomic)UITextField *textFieldEnterDate;

@property(strong,nonatomic)UIToolbar *toolbarCancelDone;

@property(strong,nonatomic)UIPickerView *customPicker;

@property(strong,nonatomic)NSMutableArray *yearArray;

@property(strong,nonatomic)NSArray *monthArray;

@property(strong,nonatomic)NSMutableArray *daysArray;

//@property(strong,nonatomic)NSArray *amPmArray;

//@property(strong,nonatomic)NSArray *hoursArray;
//
//@property(strong,nonatomic)NSMutableArray *minutesArray;

@property(strong,nonatomic)NSString *currentMonthString;

@property(nonatomic)int selectedYearRow;

@property(nonatomic)int selectedMonthRow;

@property(nonatomic)int selectedDayRow;

@property(nonatomic)BOOL firstTimeLoad;

-(void)actionCancel:(id)sender;

-(void)actionDone:(id)sender;

@end
