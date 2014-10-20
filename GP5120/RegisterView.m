//
//  RegisterView.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "RegisterView.h"

#define FONT [UIFont fontWithName:@"Helvetica" size:17.0]

#define FONT_BUTTON [UIFont fontWithName:@"Helvetica" size:15.0]

@implementation RegisterView

@synthesize _leftButtonText;

@synthesize _rightButtonText;

@synthesize _oneTextFiled;

@synthesize _twoTextFiled;

@synthesize _pushViewDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width-250)/2, 0.0, 70, 30.0)];
    
    [userName setFont:FONT];
    
    [userName setText:@"用户名："];
    
    [self addSubview:userName];
    
    _oneTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(userName.frame.origin.x+userName.frame.size.width, userName.frame.origin.y, 180.0, 30.0)];
    
    [_oneTextFiled setBorderStyle:UITextBorderStyleRoundedRect];
    
    _oneTextFiled.placeholder = @"手机号/自定义账号";
    
    _oneTextFiled.delegate = self;
    
    _oneTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _oneTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _oneTextFiled.returnKeyType = UIReturnKeyDone;
    
    _oneTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _oneTextFiled.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_oneTextFiled];
    
    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, userName.frame.origin.y+userName.frame.size.height+10.0, 70.0, 30.0)];
    
    [phoneLabel setText:@"手机号："];
    
    [self addSubview:phoneLabel];
    
    _twoTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(phoneLabel.frame.origin.x+phoneLabel.frame.size.width, phoneLabel.frame.origin.y, 180.0, 30.0)];
    
    [_twoTextFiled setBorderStyle:UITextBorderStyleRoundedRect];
    
    _twoTextFiled.placeholder = @"请输入您的准确号码";
    
    _twoTextFiled.delegate = self;
    
    _twoTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _twoTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _twoTextFiled.returnKeyType = UIReturnKeyDone;
    
    _twoTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self addSubview:_twoTextFiled];
    
    UILabel *loginLabel = [[UILabel alloc] initWithFrame:CGRectMake((_twoTextFiled.frame.origin.x+_twoTextFiled.frame.size.width)-135.0, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height, 75.0, 20.0)];
    
    [loginLabel setFont:FONT_BUTTON];
    
    [loginLabel setText:@"已有账号？"];
    
    [self addSubview:loginLabel];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [loginButton setFrame:CGRectMake(loginLabel.frame.origin.x+loginLabel.frame.size.width, loginLabel.frame.origin.y, 60.0, 20.0)];
    
    [loginButton setTintColor:[UIColor redColor]];
    
    [loginButton setTitle:@"现在登录" forState:UIControlStateNormal];
    
    [loginButton addTarget:self action:@selector(popToLoginView) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:loginButton];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [leftButton setFrame:CGRectMake((self.frame.size.width-250.0)/2, loginButton.frame.origin.y+loginButton.frame.size.height, 120.0, 30.0)];
    
    [leftButton setTintColor:[UIColor blackColor]];
    
    [leftButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [leftButton setTitle:@"确认注册" forState:UIControlStateNormal];
    
    [leftButton addTarget:self action:@selector(commitRegisterInfo) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [rightButton setFrame:CGRectMake(leftButton.frame.origin.x+leftButton.frame.size.width+10.0, leftButton.frame.origin.y, 120.0, 30.0)];
    
    [rightButton addTarget:self action:@selector(commitSimpleRegisterInfo) forControlEvents:UIControlEventTouchUpInside];
    
    [rightButton setTintColor:[UIColor blackColor]];
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [rightButton setTitle:@"一键注册" forState:UIControlStateNormal];
    
    [self addSubview:rightButton];
    
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

-(void)popToLoginView{

    [_pushViewDelegate popToLoginView];
}

-(void)commitRegisterInfo{

    [_pushViewDelegate commitRegisterInfo];
    
}

-(void)commitSimpleRegisterInfo{

    [_pushViewDelegate commitSimpleRegisterInfo];
    
}


@end
