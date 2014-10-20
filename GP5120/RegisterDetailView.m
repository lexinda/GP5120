//
//  RegisterDetailView.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "RegisterDetailView.h"

#import <QuartzCore/QuartzCore.h>

enum tableTag{
    portTag=200,
    companyNameTag,
    concatPeopleTag,
    concatPhoneTag,
    emailTag,
    msnTag,
    qqTag,
    weixinTag,
    companyAddressTag,
    companyIntroTag,
};

@implementation RegisterDetailView

@synthesize _companyType;

@synthesize _port;

@synthesize _companyName;

@synthesize _concatPeople;

@synthesize _concatPhone;

@synthesize _email;

@synthesize _msn;

@synthesize _qq;

@synthesize _weixin;

@synthesize _companyAddress;

@synthesize _companyIntro;

@synthesize _pushViewDelegate;

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UILabel *port = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width-250.0)/2, 0.0, 85.0, 20)];
    
    [port setText:@"发货港口："];
    
    [self addSubview:port];
    
    _port = [[UITextField alloc] initWithFrame:CGRectMake(port.frame.origin.x+port.frame.size.width, port.frame.origin.y, 165.0, 20.0)];
    
    [_port setBorderStyle:UITextBorderStyleRoundedRect];
    
    _port.placeholder = @"点此输入大连港";
    
    [_port setTag:portTag];
    
    _port.delegate = self;
    
    _port.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _port.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _port.returnKeyType = UIReturnKeyDone;
    
    _port.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _port.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_port];
    
    UILabel *companyName = [[UILabel alloc] initWithFrame:CGRectMake(port.frame.origin.x, port.frame.origin.y+port.frame.size.height+10.0, 85.0, 20)];
    
    [companyName setText:@"公司名称："];
    
    [self addSubview:companyName];
    
    _companyName = [[UITextField alloc] initWithFrame:CGRectMake(companyName.frame.origin.x+companyName.frame.size.width, companyName.frame.origin.y, 165.0, 20.0)];
    
    [_companyName setBorderStyle:UITextBorderStyleRoundedRect];
    
    _companyName.placeholder = @"点此输入科技公司";
    
    [_companyName setTag:companyNameTag];
    
    _companyName.delegate = self;
    
    _companyName.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _companyName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _companyName.returnKeyType = UIReturnKeyDone;
    
    _companyName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _companyName.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_companyName];
    
    UILabel *concatPeople = [[UILabel alloc] initWithFrame:CGRectMake(companyName.frame.origin.x, companyName.frame.origin.y+companyName.frame.size.height+10.0, 85.0, 20)];
    
    [concatPeople setText:@"联系人："];
    
    [self addSubview:concatPeople];
    
    _concatPeople = [[UITextField alloc] initWithFrame:CGRectMake(concatPeople.frame.origin.x+concatPeople.frame.size.width, concatPeople.frame.origin.y, 165.0, 20.0)];
    
    [_concatPeople setBorderStyle:UITextBorderStyleRoundedRect];
    
    _concatPeople.placeholder = @"点此输入姓名";
    
    [_concatPeople setTag:concatPeopleTag];
    
    _concatPeople.delegate = self;
    
    _concatPeople.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _concatPeople.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _concatPeople.returnKeyType = UIReturnKeyDone;
    
    _concatPeople.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _concatPeople.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_concatPeople];
    
    UILabel *concatPhone = [[UILabel alloc] initWithFrame:CGRectMake(concatPeople.frame.origin.x, concatPeople.frame.origin.y+concatPeople.frame.size.height+10.0, 85.0, 20)];
    
    [concatPhone setText:@"联系电话："];
    
    [self addSubview:concatPhone];
    
    _concatPhone = [[UITextField alloc] initWithFrame:CGRectMake(concatPhone.frame.origin.x+concatPhone.frame.size.width, concatPhone.frame.origin.y, 165.0, 20.0)];
    
    [_concatPhone setBorderStyle:UITextBorderStyleRoundedRect];
    
    _concatPhone.placeholder = @"点此输入电话号码";
    
    [_concatPhone setTag:concatPhoneTag];
    
    _concatPhone.delegate = self;
    
    _concatPhone.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _concatPhone.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _concatPhone.returnKeyType = UIReturnKeyDone;
    
    _concatPeople.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _concatPhone.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_concatPhone];
    
    UILabel *email = [[UILabel alloc] initWithFrame:CGRectMake(concatPhone.frame.origin.x, concatPhone.frame.origin.y+concatPhone.frame.size.height+10.0, 85.0, 20)];
    
    [email setText:@"E_Mail："];
    
    [self addSubview:email];
    
    _email = [[UITextField alloc] initWithFrame:CGRectMake(email.frame.origin.x+email.frame.size.width, email.frame.origin.y, 165.0, 20.0)];
    
    [_email setBorderStyle:UITextBorderStyleRoundedRect];
    
    _email.placeholder = @"点此输入电子邮件";
    
    [_email setTag:emailTag];
    
    _email.delegate = self;
    
    _email.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _email.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _email.returnKeyType = UIReturnKeyDone;
    
    _email.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _email.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_email];
    
    UILabel *msn = [[UILabel alloc] initWithFrame:CGRectMake(email.frame.origin.x, email.frame.origin.y+email.frame.size.height+10.0, 85.0, 20)];
    
    [msn setText:@"MSN："];
    
    [self addSubview:msn];
    
    _msn = [[UITextField alloc] initWithFrame:CGRectMake(msn.frame.origin.x+msn.frame.size.width, msn.frame.origin.y, 165.0, 20.0)];
    
    [_msn setBorderStyle:UITextBorderStyleRoundedRect];
    
    _msn.placeholder = @"点此输入msn";
    
    [_msn setTag:msnTag];
    
    _msn.delegate = self;
    
    _msn.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _msn.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _msn.returnKeyType = UIReturnKeyDone;
    
    _msn.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _msn.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_msn];
    
    UILabel *qq = [[UILabel alloc] initWithFrame:CGRectMake(msn.frame.origin.x, msn.frame.origin.y+msn.frame.size.height+10.0, 85.0, 20)];
    
    [qq setText:@"QQ："];
    
    [self addSubview:qq];
    
    _qq = [[UITextField alloc] initWithFrame:CGRectMake(qq.frame.origin.x+qq.frame.size.width, qq.frame.origin.y, 165.0, 20.0)];
    
    [_qq setBorderStyle:UITextBorderStyleRoundedRect];
    
    _qq.placeholder = @"点此输入qq";
    
    [_qq setTag:qqTag];
    
    _qq.delegate = self;
    
    _qq.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _qq.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _qq.returnKeyType = UIReturnKeyDone;
    
    _qq.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _qq.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_qq];
    
    UILabel *weixin = [[UILabel alloc] initWithFrame:CGRectMake(qq.frame.origin.x, qq.frame.origin.y+qq.frame.size.height+10.0, 85.0, 20)];
    
    [weixin setText:@"微信："];
    
    [self addSubview:weixin];
    
    _weixin = [[UITextField alloc] initWithFrame:CGRectMake(weixin.frame.origin.x+weixin.frame.size.width, weixin.frame.origin.y, 165.0, 20.0)];
    
    [_weixin setBorderStyle:UITextBorderStyleRoundedRect];
    
    _weixin.placeholder = @"点此输入微信号码";
    
    [_weixin setTag:weixinTag];
    
    _weixin.delegate = self;
    
    _weixin.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _weixin.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _weixin.returnKeyType = UIReturnKeyDone;
    
    _weixin.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _weixin.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_weixin];
    
    UILabel *companyAddress = [[UILabel alloc] initWithFrame:CGRectMake(weixin.frame.origin.x, weixin.frame.origin.y+weixin.frame.size.height+10.0, 85.0, 20)];
    
    [companyAddress setText:@"公司地址："];
    
    [self addSubview:companyAddress];
    
    _companyAddress = [[UITextField alloc] initWithFrame:CGRectMake(companyAddress.frame.origin.x+companyAddress.frame.size.width, companyAddress.frame.origin.y, 165.0, 20.0)];
    
    [_companyAddress setBorderStyle:UITextBorderStyleRoundedRect];
    
    _companyAddress.placeholder = @"点此输入地址";
    
    [_companyAddress setTag:companyAddressTag];
    
    _companyAddress.delegate = self;
    
    _companyAddress.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _companyAddress.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _companyAddress.returnKeyType = UIReturnKeyDone;
    
    _companyAddress.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _companyAddress.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_companyAddress];
    
    UILabel *companyIntro = [[UILabel alloc] initWithFrame:CGRectMake(companyAddress.frame.origin.x, companyAddress.frame.origin.y+companyAddress.frame.size.height+10.0, 85.0, 20)];
    
    [companyIntro setText:@"公司简介："];
    
    [self addSubview:companyIntro];
    
    _companyIntro = [[UITextView alloc] initWithFrame:CGRectMake(companyIntro.frame.origin.x+companyIntro.frame.size.width, companyIntro.frame.origin.y, 165.0, 48.0)];
    
    _companyIntro.textColor = [UIColor blackColor];
    
    _companyIntro.delegate = self;
    
    _companyIntro.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _companyIntro.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _companyIntro.returnKeyType = UIReturnKeyDone;
    
    _companyIntro.keyboardType = UIKeyboardTypeDefault;//键盘类型
    
    _companyIntro.scrollEnabled = NO;//是否可以拖动
    
    _companyIntro.backgroundColor = [UIColor whiteColor];
    
    _companyIntro.font = [UIFont fontWithName:@"Arial" size:13.0];
    
    _companyIntro.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _companyIntro.layer.borderWidth =1.0;
    
    _companyIntro.layer.cornerRadius =5.0;
    
    [self addSubview:_companyIntro];
    
    UIButton *commitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [commitButton setFrame:CGRectMake(port.frame.origin.x+25.0, _companyIntro.frame.origin.y+_companyIntro.frame.size.height+10.0, 200.0, 30.0)];
    
    [commitButton setTintColor:[UIColor blackColor]];
    
    [commitButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [commitButton setTitle:@"立即注册" forState:UIControlStateNormal];
    
    [commitButton addTarget:self action:@selector(commitRegisterInfo) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:commitButton];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{

    [_pushViewDelegate inputBegin:textField];
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    [_pushViewDelegate inputBegin:textView];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ((![_port isExclusiveTouch])
        ||(![_companyName isExclusiveTouch])||(![_concatPeople isExclusiveTouch])
        ||(![_concatPhone isExclusiveTouch])||(![_email isExclusiveTouch])
        ||(![_msn isExclusiveTouch])||(![_qq isExclusiveTouch])
        ||(![_weixin isExclusiveTouch])||(![_companyAddress isExclusiveTouch])
        ||(![_companyIntro isExclusiveTouch])
        ) {
        [_port resignFirstResponder];
        [_companyName resignFirstResponder];
        [_concatPeople resignFirstResponder];
        [_concatPhone resignFirstResponder];
        [_email resignFirstResponder];
        [_msn resignFirstResponder];
        [_qq resignFirstResponder];
        [_weixin resignFirstResponder];
        [_companyAddress resignFirstResponder];
        [_companyIntro resignFirstResponder];
        [_pushViewDelegate inputEnd];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    [_pushViewDelegate inputEnd];
    
    return YES;
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text

{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        [_pushViewDelegate inputEnd];
        
        return NO;
        
    }
    
    return YES;
    
}

-(void)commitRegisterInfo{
    
    NSLog(@"commitRegisterInfo");
}

@end
