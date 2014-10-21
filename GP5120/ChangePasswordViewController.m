//
//  ChangePasswordViewController.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/21.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

@synthesize _phone;

@synthesize _code;

@synthesize _getCode;

@synthesize _password;

@synthesize _passwordAgain;

@synthesize _timer;

@synthesize _number;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.title = @"修改密码";
        
    }
    
    return self;
    
}

-(void)loadView{
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UIView *mainView = [[UIView alloc] initWithFrame:rect];
    
    self.view = mainView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _number = 10;
    
    UILabel *phone = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-270)/2, 10.0, 90.0, 30.0)];
    
    [phone setText:@"手机号"];
    
    [self.view addSubview:phone];
    
    _phone = [[UITextField alloc] initWithFrame:CGRectMake(phone.frame.origin.x+phone.frame.size.width, phone.frame.origin.y, 180.0, 30.0)];
    
    [_phone setBorderStyle:UITextBorderStyleRoundedRect];
    
    _phone.placeholder = @"点此输入昵称";
    
    _phone.delegate = self;
    
    _phone.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _phone.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _phone.returnKeyType = UIReturnKeyDone;
    
    _phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _phone.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_phone];
    
    UILabel *code = [[UILabel alloc] initWithFrame:CGRectMake(phone.frame.origin.x, phone.frame.origin.y+phone.frame.size.height+10.0, 90.0, 30.0)];
    
    [code setText:@"验证码"];
    
    [self.view addSubview:code];
    
    _code = [[UITextField alloc] initWithFrame:CGRectMake(code.frame.origin.x+code.frame.size.width, code.frame.origin.y, 80.0, 30.0)];
    
    [_code setBorderStyle:UITextBorderStyleRoundedRect];
    
    //_code.placeholder = @"点此输入昵称";
    
    _code.delegate = self;
    
    _code.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _code.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _code.returnKeyType = UIReturnKeyDone;
    
    _code.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _code.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_code];
    
    _getCode = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [_getCode setFrame:CGRectMake(_code.frame.origin.x+_code.frame.size.width, code.frame.origin.y, 100, 30.0)];
    
    [_getCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    [_getCode addTarget:self action:@selector(initTimer) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_getCode];
    
    UILabel *password = [[UILabel alloc] initWithFrame:CGRectMake(phone.frame.origin.x, code.frame.origin.y+code.frame.size.height+10.0, 90.0, 30.0)];
    
    [password setText:@"设置密码"];
    
    [self.view addSubview:password];
    
    _password = [[UITextField alloc] initWithFrame:CGRectMake(password.frame.origin.x+password.frame.size.width, password.frame.origin.y, 180.0, 30.0)];
    
    [_password setBorderStyle:UITextBorderStyleRoundedRect];
    
    _password.placeholder = @"点此输入密码";
    
    _password.delegate = self;
    
    _password.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _password.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _password.returnKeyType = UIReturnKeyDone;
    
    _password.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _password.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_password];
    
    UILabel *passwordAgain = [[UILabel alloc] initWithFrame:CGRectMake(phone.frame.origin.x, password.frame.origin.y+password.frame.size.height+10.0, 90.0, 30.0)];
    
    [passwordAgain setText:@"确认密码"];
    
    [self.view addSubview:passwordAgain];
    
    _passwordAgain = [[UITextField alloc] initWithFrame:CGRectMake(passwordAgain.frame.origin.x+passwordAgain.frame.size.width, passwordAgain.frame.origin.y, 180.0, 30.0)];
    
    [_passwordAgain setBorderStyle:UITextBorderStyleRoundedRect];
    
    _passwordAgain.placeholder = @"点此输入密码";
    
    _passwordAgain.delegate = self;
    
    _passwordAgain.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _passwordAgain.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _passwordAgain.returnKeyType = UIReturnKeyDone;
    
    _passwordAgain.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _passwordAgain.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_passwordAgain];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTimer
{
    //时间间隔
    NSTimeInterval timeInterval =1.0 ;
    //定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                           target:self
                                                         selector:@selector(changeLabelNumber)
                                                         userInfo:nil
                                                          repeats:YES];
}
-(void)changeLabelNumber{
    
    
    if (_number>0) {
        
        [_getCode setTitle:[NSString stringWithFormat:@"%i",_number] forState:UIControlStateNormal];
        
         _number--;
        
    }else{
        
        [_getCode setTitle:@"重新获取" forState:UIControlStateNormal];
        
        [_timer invalidate];
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
