//
//  MeddleTextFieldTwo.m
//  GP5120
//
//  Created by 朱孟乐 on 14-9-17.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "MeddleTextFieldTwo.h"

@implementation MeddleTextFieldTwo

@synthesize _oneText;

@synthesize _twoText;

@synthesize _leftButtonText;

@synthesize _rightButtonText;

@synthesize _onePortTextFiled;

@synthesize _twoPortTextFiled;

@synthesize _pushViewDelegate;

@synthesize _queryPortTime;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    _queryPortTime = @"";
    
    _onePortTextFiled = [[UITextField alloc] initWithFrame:CGRectMake((rect.size.width-rect.size.width/3*2)/2, 0.0, rect.size.width/3*2, 30.0)];
    
    [_onePortTextFiled setBorderStyle:UITextBorderStyleRoundedRect];
    
    _onePortTextFiled.placeholder = _oneText;
    
    _onePortTextFiled.delegate = self;
    
    _onePortTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _onePortTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _onePortTextFiled.returnKeyType = UIReturnKeyDone;
    
    _onePortTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _onePortTextFiled.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_onePortTextFiled];
    
    _twoPortTextFiled = [[UITextField alloc] initWithFrame:CGRectMake((rect.size.width-rect.size.width/3*2)/2, _onePortTextFiled.frame.size.height+10.0, rect.size.width/3*2, 30.0)];
    
    [_twoPortTextFiled setBorderStyle:UITextBorderStyleRoundedRect];
    
    _twoPortTextFiled.placeholder = _twoText;
    
    _twoPortTextFiled.delegate = self;
    
    _twoPortTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _twoPortTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _twoPortTextFiled.returnKeyType = UIReturnKeyDone;
    
    _twoPortTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self addSubview:_twoPortTextFiled];
    
    UIButton *nowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [nowButton setFrame:CGRectMake(_twoPortTextFiled.frame.origin.x-5.0, _twoPortTextFiled.frame.origin.y+_twoPortTextFiled.frame.size.height+10.0, (_twoPortTextFiled.frame.size.width-9)/4, 20.0)];
    
    [nowButton setBackgroundImage:[UIImage imageNamed:@"today"] forState:UIControlStateNormal];
    
    [nowButton setTag:10];
    
    [nowButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:nowButton];
    
    UIButton *tomorrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [tomorrowButton setFrame:CGRectMake(nowButton.frame.origin.x+nowButton.frame.size.width+5.0, _twoPortTextFiled.frame.origin.y+_twoPortTextFiled.frame.size.height+10.0, (_twoPortTextFiled.frame.size.width-9)/4, 20.0)];
    
    [tomorrowButton setBackgroundImage:[UIImage imageNamed:@"tomorrow"] forState:UIControlStateNormal];
    
    [tomorrowButton setTag:11];
    
    [tomorrowButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:tomorrowButton];
    
    UIButton *afterTomorrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [afterTomorrowButton setFrame:CGRectMake(tomorrowButton.frame.origin.x+tomorrowButton.frame.size.width+5.0, _twoPortTextFiled.frame.origin.y+_twoPortTextFiled.frame.size.height+10.0, (_twoPortTextFiled.frame.size.width-9)/4, 20.0)];
    
    [afterTomorrowButton setBackgroundImage:[UIImage imageNamed:@"nextday"] forState:UIControlStateNormal];
    
    [afterTomorrowButton setTag:12];
    
    [afterTomorrowButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:afterTomorrowButton];
    
    UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [otherButton setFrame:CGRectMake(afterTomorrowButton.frame.origin.x+afterTomorrowButton.frame.size.width+5.0, _twoPortTextFiled.frame.origin.y+_twoPortTextFiled.frame.size.height+10.0, (_twoPortTextFiled.frame.size.width-9)/4, 20.0)];
    
    [otherButton setBackgroundImage:[UIImage imageNamed:@"otherday"] forState:UIControlStateNormal];
    
    [otherButton addTarget:self action:@selector(showDataPicker:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:otherButton];
    
    UIButton *leftPortButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [leftPortButton setFrame:CGRectMake((self.frame.size.width-250.0)/2, nowButton.frame.origin.y+nowButton.frame.size.height+10.0, 120, 30.0)];
    
    [leftPortButton setTitle:@"找进港柜" forState:UIControlStateNormal];
    
    [leftPortButton addTarget:self action:@selector(pushFindPortInfoView:) forControlEvents:UIControlEventTouchUpInside];
    
    [leftPortButton setTag:14];
    
    [leftPortButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self addSubview:leftPortButton];
    
    UIButton *rightPortButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [rightPortButton setFrame:CGRectMake(leftPortButton.frame.origin.x+leftPortButton.frame.size.width+10.0, leftPortButton.frame.origin.y, 120, 30.0)];
    
    [rightPortButton setTitle:@"找出港柜" forState:UIControlStateNormal];
    
    [rightPortButton addTarget:self action:@selector(pushFindPortInfoView:) forControlEvents:UIControlEventTouchUpInside];
    
    [rightPortButton setTag:15];
    
    [rightPortButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self addSubview:rightPortButton];
}

-(void)activeButton:(id)sender{

    UIButton *button = (UIButton *)sender;
    
    for (UIView *view in [self subviews]) {
        if (view.tag==10) {
            
            UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"today"] forState:UIControlStateNormal];
            
        }else if(view.tag==11){
            
             UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"tomorrow"] forState:UIControlStateNormal];
            
        }else if(view.tag==12){
            
             UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"nextday"] forState:UIControlStateNormal];
            
        }
    }
    
    if (button.tag == 10) {
        
        [button setBackgroundImage:[UIImage imageNamed:@"today1"] forState:UIControlStateNormal];
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        _queryPortTime = [NSString stringWithFormat:@"%@",
                      [formatter stringFromDate:date]];
        
    }else if(button.tag == 11){
        
        [button setBackgroundImage:[UIImage imageNamed:@"tomorrow1"] forState:UIControlStateNormal];
        
        NSTimeInterval timer = 24 * 60 * 60;
        
        //NSDate *_yesterday = [[NSDate alloc] initWithTimeIntervalSinceNow:-timer];
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:timer];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        _queryPortTime = [NSString stringWithFormat:@"%@",
                      [formatter stringFromDate:date]];
        
    }else if(button.tag == 12){
        
        [button setBackgroundImage:[UIImage imageNamed:@"nextday1"] forState:UIControlStateNormal];
        
        NSTimeInterval timer = 24 * 60 * 60 * 24;
        
        //NSDate *_yesterday = [[NSDate alloc] initWithTimeIntervalSinceNow:-timer];
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:timer];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        _queryPortTime = [NSString stringWithFormat:@"%@",
                      [formatter stringFromDate:date]];
        
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ((![_onePortTextFiled isExclusiveTouch])||(![_twoPortTextFiled isExclusiveTouch])) {
        [_onePortTextFiled resignFirstResponder];
        [_twoPortTextFiled resignFirstResponder];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
    
}

-(void)pushFindPortInfoView:(id)sender{
    
    UIButton *button = (UIButton *)sender;

    NSDictionary *userLoginInfo = [[ValidataLogin alloc] validataUserInfo];
    
    if ([[userLoginInfo objectForKey:@"username"] isEqualToString:@""]&&[[userLoginInfo objectForKey:@"password"] isEqualToString:@""]){
        
        [_pushViewDelegate loginAndRegister];
        
    }else if ([_onePortTextFiled.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"集装箱港口不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if([_twoPortTextFiled.text isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"目的地不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if([_queryPortTime isEqualToString:@""]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"日期不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else{
        
        NSDictionary *dictionary = [[NSDictionary alloc] init];
        
        if (button.tag == 14) {
            
            dictionary = [NSDictionary dictionaryWithObjectsAndKeys:_onePortTextFiled.text,@"port",_twoPortTextFiled.text,@"address",_queryPortTime,@"queryTime",[userLoginInfo objectForKey:@"username"],@"userName",@"in",@"find_type", nil];
            
        }else if(button.tag == 15){
            
            dictionary = [NSDictionary dictionaryWithObjectsAndKeys:_onePortTextFiled.text,@"oneField",_twoPortTextFiled.text,@"twoField",_queryPortTime,@"queryTime",[userLoginInfo objectForKey:@"username"],@"userName",@"out",@"find_type", nil];
        }
        
        HomeInfoModel *homeInfoModel = [[HomeInfoModel alloc] getHomeInfoModel:dictionary];
        
        [_pushViewDelegate pushPortInfoView:homeInfoModel];
        
    }

    
}

-(void)showDataPicker:(id)action{
    
    if ((![_onePortTextFiled isExclusiveTouch])||(![_twoPortTextFiled isExclusiveTouch])) {
        [_onePortTextFiled resignFirstResponder];
        [_twoPortTextFiled resignFirstResponder];
    }
    
    _queryPortTime = @"other";
    
    for (UIView *view in [self subviews]) {
        if (view.tag==10) {
            
            UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"today"] forState:UIControlStateNormal];
            
        }else if(view.tag==11){
            
            UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"tomorrow"] forState:UIControlStateNormal];
            
        }else if(view.tag==12){
            
            UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"nextday"] forState:UIControlStateNormal];
            
        }
    }
    
    
    [_pushViewDelegate showDataPicker];
};

@end
