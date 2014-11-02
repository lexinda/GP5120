//
//  MeddleTextField.m
//  GP5120
//
//  Created by lele126 on 14-8-2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "MeddleTextField.h"

@implementation MeddleTextField

@synthesize _oneText;

@synthesize _twoText;

@synthesize _leftButtonText;

@synthesize _rightButtonText;

@synthesize _oneTextFiled;

@synthesize _twoTextFiled;

@synthesize _pushViewDelegate;

@synthesize _queryTime;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _queryTime = @"";
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    _oneTextFiled = [[UITextField alloc] initWithFrame:CGRectMake((rect.size.width-rect.size.width/3*2)/2, 0.0, rect.size.width/3*2, 30.0)];
    
    [_oneTextFiled setBorderStyle:UITextBorderStyleRoundedRect];
    
    _oneTextFiled.placeholder = _oneText;
    
    _oneTextFiled.delegate = self;
    
    _oneTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _oneTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _oneTextFiled.returnKeyType = UIReturnKeyDone;
    
    _oneTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _oneTextFiled.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_oneTextFiled];
    
    _twoTextFiled = [[UITextField alloc] initWithFrame:CGRectMake((rect.size.width-rect.size.width/3*2)/2, _oneTextFiled.frame.size.height+10.0, rect.size.width/3*2, 30.0)];
    
    [_twoTextFiled setBorderStyle:UITextBorderStyleRoundedRect];
    
    _twoTextFiled.placeholder = _twoText;
    
    _twoTextFiled.delegate = self;
    
    _twoTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _twoTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _twoTextFiled.returnKeyType = UIReturnKeyDone;
    
    _twoTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self addSubview:_twoTextFiled];
    
    UIButton *nowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [nowButton setFrame:CGRectMake(_twoTextFiled.frame.origin.x-5.0, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height+10.0, (_twoTextFiled.frame.size.width-9)/4, 20.0)];
    
    [nowButton setBackgroundImage:[UIImage imageNamed:@"today"] forState:UIControlStateNormal];
    
    [nowButton setTag:10];
    
    [nowButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:nowButton];
    
    UIButton *tomorrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [tomorrowButton setFrame:CGRectMake(nowButton.frame.origin.x+nowButton.frame.size.width+5.0, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height+10.0, (_twoTextFiled.frame.size.width-9)/4, 20.0)];
    
    [tomorrowButton setBackgroundImage:[UIImage imageNamed:@"tomorrow"] forState:UIControlStateNormal];
    
    [tomorrowButton setTag:11];
    
    [tomorrowButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:tomorrowButton];
    
    UIButton *afterTomorrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [afterTomorrowButton setFrame:CGRectMake(tomorrowButton.frame.origin.x+tomorrowButton.frame.size.width+5.0, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height+10.0, (_twoTextFiled.frame.size.width-9)/4, 20.0)];
    
    [afterTomorrowButton setBackgroundImage:[UIImage imageNamed:@"nextday"] forState:UIControlStateNormal];
    
    [afterTomorrowButton setTag:12];
    
    [afterTomorrowButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:afterTomorrowButton];
    
    UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [otherButton setFrame:CGRectMake(afterTomorrowButton.frame.origin.x+afterTomorrowButton.frame.size.width+5.0, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height+10.0, (_twoTextFiled.frame.size.width-9)/4, 20.0)];
    
    [otherButton addTarget:self action:@selector(showDataPicker:) forControlEvents:UIControlEventTouchUpInside];
    
    [otherButton setBackgroundImage:[UIImage imageNamed:@"otherday"] forState:UIControlStateNormal];
    
    [self addSubview:otherButton];
    
    UIButton *leftCarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [leftCarButton setFrame:CGRectMake((self.frame.size.width-(100+5+100+5+100))/2, nowButton.frame.origin.y+nowButton.frame.size.height+10.0, 100.0, 30.0)];
    
    [leftCarButton setTitle:@"派单给他" forState:UIControlStateNormal];
    
    [leftCarButton addTarget:self action:@selector(sendCarInfoToPeople:) forControlEvents:UIControlEventTouchUpInside];
    
    [leftCarButton setTag:20];
    
    [leftCarButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self addSubview:leftCarButton];
    
    UIButton *meddleCarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [meddleCarButton setFrame:CGRectMake(leftCarButton.frame.origin.x+leftCarButton.frame.size.width+5.0, nowButton.frame.origin.y+nowButton.frame.size.height+10.0, 100.0, 30.0)];
    
    [meddleCarButton addTarget:self action:@selector(sendCarInfoToPeople:) forControlEvents:UIControlEventTouchUpInside];
    
    [meddleCarButton setTitle:@"发布派车信息" forState:UIControlStateNormal];
    
    [meddleCarButton setTag:21];
    
    [meddleCarButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self addSubview:meddleCarButton];
    
    UIButton *rightCarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [rightCarButton setFrame:CGRectMake(meddleCarButton.frame.origin.x+meddleCarButton.frame.size.width+5.0, nowButton.frame.origin.y+nowButton.frame.size.height+10.0, 100.0, 30.0)];
    
    [rightCarButton addTarget:self action:@selector(showCarDetail:) forControlEvents:UIControlEventTouchUpInside];
    
    [rightCarButton setTitle:@"查看派车信息" forState:UIControlStateNormal];
    
    [rightCarButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self addSubview:rightCarButton];
    
}

-(void)sendCarInfoToPeople:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    
    if (button.tag==20) {
        
        NSDictionary *userLoginInfo = [[ValidataLogin alloc] validataUserInfo];
        
        if ([[userLoginInfo objectForKey:@"username"] isEqualToString:@""]&&[[userLoginInfo objectForKey:@"password"] isEqualToString:@""]){
            
            [_pushViewDelegate loginAndRegister];
            
        }else if ([_oneTextFiled.text isEqualToString:@""]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"司机用户名不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
            
        }else if([_twoTextFiled.text isEqualToString:@""]){
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"司机手机号不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
            
        }else if(![self checkPhoneNumInput:_twoTextFiled.text]){
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"司机手机号输入不正确" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
            
        }else if([_queryTime isEqualToString:@""]){
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"日期不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
            
        }else{
            
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:_oneTextFiled.text,@"oneField",_twoTextFiled.text,@"twoField",_queryTime,@"queryTime",[userLoginInfo objectForKey:@"username"],@"userName",@"car",@"find_type", nil];
            
            HomeInfoModel *homeInfoModel = [[HomeInfoModel alloc] getHomeInfoModel:dictionary];
            
            [_pushViewDelegate pushCarInfoView:homeInfoModel];
            
        }
        
    }else if(button.tag==21){
        
        HomeInfoModel *homeInfoModel = [[HomeInfoModel alloc] getHomeInfoModelNoLogin];
        
        [_pushViewDelegate pushCarInfoView:homeInfoModel];
        
    }
        
    
    
}

-(BOOL)checkPhoneNumInput:(NSString *)phone{
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:phone];
    BOOL res2 = [regextestcm evaluateWithObject:phone];
    BOOL res3 = [regextestcu evaluateWithObject:phone];
    BOOL res4 = [regextestct evaluateWithObject:phone];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
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
        
        //NSDate *_yesterday = [[NSDate alloc] initWithTimeIntervalSinceNow:-timer];
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        _queryTime = [NSString stringWithFormat:@"%@",
                                       [formatter stringFromDate:date]];
        
    }else if(button.tag == 11){
        
        [button setBackgroundImage:[UIImage imageNamed:@"tomorrow1"] forState:UIControlStateNormal];
        
        NSTimeInterval timer = 24 * 60 * 60;
        
        //NSDate *_yesterday = [[NSDate alloc] initWithTimeIntervalSinceNow:-timer];
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:timer];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        _queryTime = [NSString stringWithFormat:@"%@",
                      [formatter stringFromDate:date]];
        
    }else if(button.tag == 12){
        
        [button setBackgroundImage:[UIImage imageNamed:@"nextday1"] forState:UIControlStateNormal];
        
        NSTimeInterval timer = 24 * 60 * 60 * 24;
        
        //NSDate *_yesterday = [[NSDate alloc] initWithTimeIntervalSinceNow:-timer];
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:timer];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
        _queryTime = [NSString stringWithFormat:@"%@",
                      [formatter stringFromDate:date]];
        
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ((![_oneTextFiled isExclusiveTouch])||(![_twoTextFiled isExclusiveTouch])) {
        [_oneTextFiled resignFirstResponder];
        [_twoTextFiled resignFirstResponder];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
    
}

-(void)showCarDetail:(id)action{
    
    [_pushViewDelegate showCarDetail];
    
}

-(void)showDataPicker:(id)action{
    
    if ((![_oneTextFiled isExclusiveTouch])||(![_twoTextFiled isExclusiveTouch])) {
        [_oneTextFiled resignFirstResponder];
        [_twoTextFiled resignFirstResponder];
    }
    
    _queryTime = @"other";
    
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
