//
//  DatePickerView.m
//  GP5120
//
//  Created by 朱孟乐 on 14-9-20.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "DatePickerView.h"

#define currentMonth [currentMonthString integerValue]

@implementation DatePickerView

@synthesize toolbarCancelDone;

@synthesize customPicker;

@synthesize yearArray;

@synthesize monthArray;

@synthesize dayArray;

//@synthesize amPmArray;

//@synthesize hoursArray;
//
//@synthesize minutesArray;

@synthesize currentMonthString;

@synthesize selectedYearRow;

@synthesize selectedMonthRow;

@synthesize selectedDayRow;

@synthesize firstTimeLoad;

@synthesize delegateView;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.toolbarCancelDone = [[UIToolbar alloc] initWithFrame:CGRectMake(self.frame.origin.x, 0.0, self.frame.size.width, 40)];
    
    self.toolbarCancelDone.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
    
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [doneButton setFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    
    doneButton.titleLabel.font=[UIFont systemFontOfSize:16.0f];
    
    [doneButton setTitle:@"确定" forState:UIControlStateNormal];
    
    [doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [doneButton addTarget:self action:@selector(actionDone:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *myDoneButton = [[ UIBarButtonItem alloc] initWithCustomView:doneButton];
                                     
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [buttons addObject:flexibleSpace];
    
    [buttons addObject: myDoneButton];
    
    [self.toolbarCancelDone setItems:buttons animated:TRUE];
    
    [self addSubview:self.toolbarCancelDone];
    
    self.customPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.toolbarCancelDone.frame.size.height+self.toolbarCancelDone.frame.origin.y+1, self.frame.size.width, 199)];
    
    self.customPicker.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
    
    self.customPicker.delegate=self;
    
    self.customPicker.dataSource=self;
    
    self.customPicker.showsSelectionIndicator = YES;
    
    [self addSubview:self.customPicker];
    
    NSDate *date = [NSDate date];
    
    // Get Current Year
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    
    NSString *currentyearString = [NSString stringWithFormat:@"%@",
                                   [formatter stringFromDate:date]];
    
    
    // Get Current  Month
    
    [formatter setDateFormat:@"MM"];
    
    currentMonthString = [NSString stringWithFormat:@"%d",[[formatter stringFromDate:date]integerValue]];
    
    
    // Get Current  Date
    
    [formatter setDateFormat:@"dd"];
    NSString *currentDateString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    
    //    // Get Current  Hour
    //    [formatter setDateFormat:@"hh"];
    //    NSString *currentHourString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    //
    //    // Get Current  Minutes
    //    [formatter setDateFormat:@"mm"];
    //    NSString *currentMinutesString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    //
    //    // Get Current  AM PM
    //
    //    [formatter setDateFormat:@"a"];
    //    NSString *currentTimeAMPMString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    
    // PickerView -  Years data
    
    yearArray = [[NSMutableArray alloc]init];
    
    
    for (int i = 1970; i <= 2050 ; i++)
    {
        [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
        
    }
    
    
    // PickerView -  Months data
    
    
    monthArray = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12"];
    
    
    // PickerView -  Hours data
    
    
    //    hoursArray = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12"];
    //
    //
    //    // PickerView -  Hours data
    //
    //    minutesArray = [[NSMutableArray alloc]init];
    //
    //    for (int i = 0; i < 60; i++)
    //    {
    //
    //        [minutesArray addObject:[NSString stringWithFormat:@"%02d",i]];
    //
    //    }
    
    
    // PickerView -  AM PM data
    
    //    amPmArray = @[@"AM",@"PM"];
    
    
    
    // PickerView -  days data
    
    dayArray = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= 31; i++)
    {
        if (i<10) {
            [dayArray addObject:[NSString stringWithFormat:@"0%d",i]];
        }else{
            [dayArray addObject:[NSString stringWithFormat:@"%d",i]];
        }
        
        
        
    }
    
    
    // PickerView - Default Selection as per current Date
    
    [self.customPicker reloadAllComponents];
    
    [self.customPicker selectRow:[yearArray indexOfObject:currentyearString] inComponent:0 animated:YES];
    
    [self.customPicker selectRow:[monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
    
    [self.customPicker selectRow:[dayArray indexOfObject:currentDateString] inComponent:2 animated:YES];
    
    //    [self.customPicker selectRow:[hoursArray indexOfObject:currentHourString] inComponent:3 animated:YES];
    //
    //    [self.customPicker selectRow:[minutesArray indexOfObject:currentMinutesString] inComponent:4 animated:YES];
    //
    //    [self.customPicker selectRow:[amPmArray indexOfObject:currentTimeAMPMString] inComponent:5 animated:YES];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    if (component == 0)
    {
        selectedYearRow = row;
        [self.customPicker reloadAllComponents];
    }
    else if (component == 1)
    {
        selectedMonthRow = row;
        [self.customPicker reloadAllComponents];
    }
    else if (component == 2)
    {
        selectedDayRow = row;
        
        [self.customPicker reloadAllComponents];
        
    }
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    // Custom View created for each component
    
    UILabel *pickerLabel = (UILabel *)view;
    
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 150, 60);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:18.0f]];
    }
    
    
    
    if (component == 0)
    {
        pickerLabel.text = [NSString stringWithFormat:@"%@年",[yearArray objectAtIndex:row]] ; // Year
    }
    else if (component == 1)
    {
        pickerLabel.text = [NSString stringWithFormat:@"%@月",[monthArray objectAtIndex:row]];  // Month
    }
    else if (component == 2)
    {
        pickerLabel.text =  [NSString stringWithFormat:@"%@日",[dayArray objectAtIndex:row]]; // Date
        
    }
    //    else if (component == 3)
    //    {
    //        pickerLabel.text =  [hoursArray objectAtIndex:row]; // Hours
    //    }
    //    else if (component == 4)
    //    {
    //        pickerLabel.text =  [minutesArray objectAtIndex:row]; // Mins
    //    }
    //    else
    //    {
    //        pickerLabel.text =  [amPmArray objectAtIndex:row]; // AM/PM
    //    }
    
    return pickerLabel;
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //    return 6;
    return 3;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (component == 0)
    {
        return [yearArray count];
        
    }
    else if (component == 1)
    {
        return [monthArray count];
    }
//    else if (component == 2)
    else
    { // day
        
        if (firstTimeLoad)
        {
            if (currentMonth == 1 || currentMonth == 3 || currentMonth == 5 || currentMonth == 7 || currentMonth == 8 || currentMonth == 10 || currentMonth == 12)
            {
                return 31;
            }
            else if (currentMonth == 2)
            {
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
                
            }
            else
            {
                return 30;
            }
            
        }
        else
        {
            
            if (selectedMonthRow == 0 || selectedMonthRow == 2 || selectedMonthRow == 4 || selectedMonthRow == 6 || selectedMonthRow == 7 || selectedMonthRow == 9 || selectedMonthRow == 11)
            {
                return 31;
            }
            else if (selectedMonthRow == 1)
            {
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
                
                
                
            }
            else
            {
                return 30;
            }
            
        }
        
        
    }
//    else if (component == 3)
//    { // hour
//        
//        return 12;
//        
//    }
//    else if (component == 4)
//    { // min
//        return 60;
//    }
//    else
//    { // am/pm
//        return 2;
//        
//    }
    
    
    
}

- (void)actionCancel:(id)sender
{
    
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.customPicker.hidden = YES;
                         self.toolbarCancelDone.hidden = YES;
                         
                         
                     }
                     completion:^(BOOL finished){
                         
                         
                     }];
    
    
}

- (void)actionDone:(id)sender
{
    
    
    //    self.textFieldEnterDate.text = [NSString stringWithFormat:@"%@/%@/%@ -- %@ : %@ - %@",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]],[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]],[daysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]],[hoursArray objectAtIndex:[self.customPicker selectedRowInComponent:3]],[minutesArray objectAtIndex:[self.customPicker selectedRowInComponent:4]],[amPmArray objectAtIndex:[self.customPicker selectedRowInComponent:5]]];
    
//    self.textFieldEnterDate.text = [NSString stringWithFormat:@"%@/%@/%@",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]],[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]],[daysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]]];
    
    NSString *data = [NSString stringWithFormat:@"%@-%@-%@",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]],[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]],[dayArray objectAtIndex:[self.customPicker selectedRowInComponent:2]]];
    
    [delegateView getDatePickerViewData:data];
    
}

@end
