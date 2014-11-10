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
    
    _number = 60;
    
    UILabel *phone = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-270)/2, 10.0, 90.0, 30.0)];
    
    [phone setText:@"手机号"];
    
    [self.view addSubview:phone];
    
    _phone = [[UITextField alloc] initWithFrame:CGRectMake(phone.frame.origin.x+phone.frame.size.width, phone.frame.origin.y, 180.0, 30.0)];
    
    [_phone setBorderStyle:UITextBorderStyleRoundedRect];
    
    _phone.placeholder = @"请输入手机号码";
    
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
    
    _code.placeholder = @"请输入验证码";
    
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
    
    _password.placeholder = @"请输入至少6个字符";
    
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
    
    _passwordAgain.placeholder = @"请再次确认密码";
    
    _passwordAgain.delegate = self;
    
    _passwordAgain.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _passwordAgain.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _passwordAgain.returnKeyType = UIReturnKeyDone;
    
    _passwordAgain.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _passwordAgain.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_passwordAgain];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [leftButton setFrame:CGRectMake((self.view.frame.size.width-250.0)/2, passwordAgain.frame.origin.y+passwordAgain.frame.size.height+10.0, 120, 30.0)];
    
    [leftButton setTitle:@"确定" forState:UIControlStateNormal];
    
    [leftButton addTarget:self action:@selector(changePassword) forControlEvents:UIControlEventTouchUpInside];
    
    [leftButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self.view addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [rightButton setFrame:CGRectMake(leftButton.frame.origin.x+leftButton.frame.size.width+10.0, passwordAgain.frame.origin.y+passwordAgain.frame.size.height+10.0, 120, 30.0)];
    
    [rightButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [rightButton setTitle:@"取消" forState:UIControlStateNormal];
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self.view addSubview:rightButton];
    
}

-(void)changePassword{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    if ([_phone.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"电话号码不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if (![self checkPhoneNumInput:_phone.text]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"电话号码格式不正确" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_code.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"验证码不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_password.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if (_password.text.length <6) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码不能小于6个字符" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_passwordAgain.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确认密码不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if (_passwordAgain.text.length<6) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确认密码不能小于6个字符" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_passwordAgain.text isEqualToString:_password.text]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"两次密码不一致" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else{
    
        NSString *changePassword = [NSString stringWithFormat:@"%@&flag=22&username=%@&check_code=%@&password=%@",SERVER_URL,[defaults objectForKey:@"username"],_code.text,_password.text];
        
        ASIFormDataRequest *changePasswordForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:changePassword]];
        
        [changePasswordForm startSynchronous];
        
        NSString *result = [changePasswordForm responseString];
        
        if ([result isEqualToString:@"0"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }else if ([result isEqualToString:@"1"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }else if ([result isEqualToString:@"2"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"验证码过期" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }else if ([result isEqualToString:@"3"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"验证码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
        }
        
    }
    
}

-(void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return [textField resignFirstResponder];
    
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [_phone resignFirstResponder];
    
    [_code resignFirstResponder];
    
    [_password resignFirstResponder];
    
    [_passwordAgain resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTimer
{
    
    if ([_phone.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"电话号码不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if (![self checkPhoneNumInput:_phone.text]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"电话号码格式不正确" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else{
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString *getPhoneCode = [NSString stringWithFormat:@"%@&flag=23&username=%@&mobile=%@",SERVER_URL,[defaults objectForKey:@"username"],_phone.text];
        
        ASIFormDataRequest *getPhoneCodeForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:getPhoneCode]];
        
        [getPhoneCodeForm startSynchronous];
        
        NSString *result = [getPhoneCodeForm responseString];
        
        if ([result isEqualToString:@"0"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"发送验证码失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
            
        }else if ([result isEqualToString:@"2"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"与预留号码不一致" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
            
        }else if ([result isEqualToString:@"3"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"无该用户" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
            
        }else if ([result isEqualToString:@"4"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"系统错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
            
        }else{
            
            //时间间隔
            NSTimeInterval timeInterval =1.0 ;
            //定时器
            _timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                      target:self
                                                    selector:@selector(changeLabelNumber)
                                                    userInfo:nil
                                                     repeats:YES];
        
        }
    
    }
    
}
-(void)changeLabelNumber{
    
    
    if (_number>0) {
        
        [_getCode setTitle:[NSString stringWithFormat:@"等待%i秒",_number] forState:UIControlStateNormal];
        
        [_getCode setEnabled:NO];
        
         _number--;
        
    }else{
        
        [_getCode setEnabled:YES];
        
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
