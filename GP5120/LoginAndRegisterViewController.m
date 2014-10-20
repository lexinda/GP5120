//
//  LoginAndRegisterViewController.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "LoginAndRegisterViewController.h"

@interface LoginAndRegisterViewController ()

@end

@implementation LoginAndRegisterViewController

@synthesize _usernameTextField;

@synthesize _passwordTextField;

@synthesize _isAutoLogin;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"用户登录";
        
        UIImage *backImage = [UIImage imageNamed:@"releasesuccess_return"];
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        leftButton.frame = CGRectMake(0.0, 0.0, 42.0, 25.0);
        
        [leftButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        
        [leftButton setBackgroundImage:backImage forState:UIControlStateNormal];
        
        UIBarButtonItem *leftBarButonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
        self.navigationItem.leftBarButtonItem = leftBarButonItem;
        
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
    
    _isAutoLogin  = @"0";
    
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-250)/2, 20.0+44.0+20.0, 70.0, 30.0)];
    
    [usernameLabel setText:@"用户名："];
    
    [self.view addSubview:usernameLabel];
    
    _usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(usernameLabel.frame.origin.x+usernameLabel.frame.size.width, usernameLabel.frame.origin.y, 180.0, 30.0)];
    
    [_usernameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _usernameTextField.placeholder = @"用户名";
    
    _usernameTextField.delegate = self;
    
    _usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _usernameTextField.returnKeyType = UIReturnKeyDone;
    
    _usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _usernameTextField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_usernameTextField];
    
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(usernameLabel.frame.origin.x, usernameLabel.frame.origin.y+usernameLabel.frame.size.height+10.0, 70.0, 30.0)];
    
    [passwordLabel setText:@"密\t码："];
    
    [self.view addSubview:passwordLabel];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(passwordLabel.frame.origin.x+passwordLabel.frame.size.width, passwordLabel.frame.origin.y, 180.0, 30.0)];
    
    [_passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _passwordTextField.placeholder = @"密码";
    
    _passwordTextField.delegate = self;
    
    _passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _passwordTextField.returnKeyType = UIReturnKeyDone;
    
    _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _passwordTextField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_passwordTextField];
    
    UIButton *isAutoLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [isAutoLogin setFrame:CGRectMake(usernameLabel.frame.origin.x+40.0, passwordLabel.frame.size.height+passwordLabel.frame.origin.y+10.0, 18.0, 15.0)];
    
    [isAutoLogin setBackgroundImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [isAutoLogin addTarget:self action:@selector(isAutoLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:isAutoLogin];
    
    UILabel *isAutoLoginLabel = [[UILabel alloc] initWithFrame:CGRectMake(isAutoLogin.frame.origin.x+isAutoLogin.frame.size.width, isAutoLogin.frame.origin.y, 200.0, isAutoLogin.frame.size.height)];
    
    [isAutoLoginLabel setText:@"两周内自动登录"];
    
    [self.view addSubview:isAutoLoginLabel];
    
    UIButton *findPassword = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [findPassword setTintColor:[UIColor redColor]];
    
    [findPassword setTitle:@"忘记密码？点我找回！" forState:UIControlStateNormal];
    
    [findPassword setFrame:CGRectMake(usernameLabel.frame.origin.x, isAutoLoginLabel.frame.origin.y+isAutoLoginLabel.frame.size.height+10.0, 250.0, 30.0)];
    
    [self.view addSubview:findPassword];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [loginButton setTitle:@"立即登陆" forState:UIControlStateNormal];
    
    [loginButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [loginButton setTintColor:[UIColor blackColor]];
    
    [loginButton setFrame:CGRectMake((self.view.frame.size.width-200)/2, findPassword.frame.size.height+findPassword.frame.origin.y, 200.0, 30.0)];
    
    [loginButton addTarget:self action:@selector(loginWithUserInfo) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginButton];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [registerButton setTitle:@"注\t册" forState:UIControlStateNormal];
    
    [registerButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [registerButton setTintColor:[UIColor blackColor]];
    
    [registerButton setFrame:CGRectMake(loginButton.frame.origin.x, loginButton.frame.size.height+loginButton.frame.origin.y+10.0, 200.0, 30.0)];
    
    [registerButton addTarget:self action:@selector(registerView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:registerButton];
    // Do any additional setup after loading the view.
}

-(void)isAutoLoginAction:(id)sender{
    
    UIButton *isAutoLogin = (UIButton *)sender;
    
    if ([_isAutoLogin isEqualToString:@"0"]) {
        
        [isAutoLogin setBackgroundImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
        
        _isAutoLogin  = @"1";
        
    }else{
    
        [isAutoLogin setBackgroundImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
        
        _isAutoLogin  = @"0";
        
    }
    
}

-(void)loginWithUserInfo{

    if([_usernameTextField.text isEqualToString:@""]){
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
        
    }else if([_passwordTextField.text isEqualToString:@""]){
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码不能为空！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
    }else{
    
        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:_usernameTextField.text,@"username",_passwordTextField.text,@"password",_isAutoLogin,@"isAutoLogin", nil];
        
        [[ValidataLogin alloc] standardUserInfo:userInfo];
        
    }
    
}

-(void)registerView{
    
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    
    [self.navigationController pushViewController:registerViewController animated:YES];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ((![_usernameTextField isExclusiveTouch])||(![_passwordTextField isExclusiveTouch])) {
        [_usernameTextField resignFirstResponder];
        [_passwordTextField resignFirstResponder];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
    
}

-(void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
