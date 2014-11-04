//
//  SetupUserInfoViewController.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/21.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "SetupUserInfoViewController.h"

@interface SetupUserInfoViewController ()

@end

@implementation SetupUserInfoViewController

@synthesize _nickName;

@synthesize _companyType;

@synthesize _companyAddress;

@synthesize _companyName;

@synthesize _people;

@synthesize _phone;

@synthesize _email;

@synthesize _fax;

@synthesize _hud;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        
        self.title=@"设置";
        
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
    
    _hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
    [self.navigationController.view addSubview:_hud];
    
    _hud.delegate = self;
    
    _hud.labelText = @"加载中...";
    
    [_hud showWhileExecuting:@selector(pushSetupUserInfoView) onTarget:self withObject:nil animated:YES];
    
}

-(void)pushSetupUserInfoView{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *setupUserInfo = [NSString stringWithFormat:@"%@&flag=21&username=%@",SERVER_URL,[defaults objectForKey:@"username"]];
    
    ASIFormDataRequest *setupUserInfoForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:setupUserInfo]];
    
    [setupUserInfoForm startSynchronous];
    
    NSString *result = [setupUserInfoForm responseString];
    
    if ([result isEqualToString:@"0"]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"系统错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        alertView.tag=1;
        
        [alertView show];
        
    }else if ([result isEqualToString:@"2"]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"无该用户信息" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        alertView.tag=2;
        
        [alertView show];
        
    }else{
        
        AppUserInfo *appUserInfo = nil;
        
        NSDictionary *dictionaryData = [result objectFromJSONString];
        
        NSArray *dataArray = [dictionaryData objectForKey:@"USER_INFO"];
        
        for (NSDictionary *dictionary in dataArray) {
            
            appUserInfo = [[AppUserInfo alloc] getAppUserInfo:dictionary];
            
        }
    
        UILabel *nickName = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-265.0)/2, 10.0, 90.0, 30.0)];
        
        [nickName setText:@"昵\t称："];
        
        [self.view addSubview:nickName];
        
        _nickName = [[UITextField alloc] initWithFrame:CGRectMake(nickName.frame.origin.x+nickName.frame.size.width, nickName.frame.origin.y, 165.0, 30.0)];
        
        [_nickName setBorderStyle:UITextBorderStyleRoundedRect];
        
        _nickName.placeholder = @"点此输入昵称";
        
        _nickName.delegate = self;
        
        _nickName.autocorrectionType = UITextAutocorrectionTypeNo;
        
        _nickName.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        _nickName.returnKeyType = UIReturnKeyDone;
        
        _nickName.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _nickName.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
        
        [self.view addSubview:_nickName];
        
        UILabel *companyType = [[UILabel alloc] initWithFrame:CGRectMake(nickName.frame.origin.x, nickName.frame.origin.y+nickName.frame.size.height+10.0, 90.0, 30.0)];
        
        [companyType setText:@"公司类型："];
        
        [self.view addSubview:companyType];
        
        _companyType = [[UITextField alloc] initWithFrame:CGRectMake(companyType.frame.origin.x+companyType.frame.size.width, companyType.frame.origin.y, 165.0, 30.0)];
        
        [_companyType setBorderStyle:UITextBorderStyleRoundedRect];
        
        _companyType.placeholder = @"点此输入公司类型";
        
        _companyType.delegate = self;
        
        _companyType.autocorrectionType = UITextAutocorrectionTypeNo;
        
        _companyType.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        _companyType.returnKeyType = UIReturnKeyDone;
        
        _companyType.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _companyType.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
        
        if (appUserInfo.COMPANY_TYPE != nil|| ![appUserInfo.COMPANY_TYPE isEqualToString:@""]) {
            
            [_companyType setText:[NSString stringWithFormat:@"%@",appUserInfo.COMPANY_TYPE]];
            
        }
        
        [self.view addSubview:_companyType];
        
        UILabel *companyAddress = [[UILabel alloc] initWithFrame:CGRectMake(nickName.frame.origin.x, companyType.frame.origin.y+companyType.frame.size.height+10.0, 90.0, 30.0)];
        
        [companyAddress setText:@"公司地址："];
        
        [self.view addSubview:companyAddress];
        
        _companyAddress = [[UITextField alloc] initWithFrame:CGRectMake(companyAddress.frame.origin.x+companyAddress.frame.size.width, companyAddress.frame.origin.y, 165.0, 30.0)];
        
        [_companyAddress setBorderStyle:UITextBorderStyleRoundedRect];
        
        _companyAddress.placeholder = @"点此输入公司地址";
        
        if (appUserInfo.COMPANY_POISION != nil|| ![appUserInfo.COMPANY_POISION isEqualToString:@""]) {
            
            [_companyAddress setText:[NSString stringWithFormat:@"%@",appUserInfo.COMPANY_POISION]];
            
        }
        
        _companyAddress.delegate = self;
        
        _companyAddress.autocorrectionType = UITextAutocorrectionTypeNo;
        
        _companyAddress.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        _companyAddress.returnKeyType = UIReturnKeyDone;
        
        _companyAddress.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _companyAddress.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
        
        [self.view addSubview:_companyAddress];
        
        UILabel *companyName = [[UILabel alloc] initWithFrame:CGRectMake(nickName.frame.origin.x, companyAddress.frame.origin.y+companyAddress.frame.size.height+10.0, 90.0, 30.0)];
        
        [companyName setText:@"公司名称："];
        
        [self.view addSubview:companyName];
        
        _companyName = [[UITextField alloc] initWithFrame:CGRectMake(companyName.frame.origin.x+companyName.frame.size.width, companyName.frame.origin.y, 165.0, 30.0)];
        
        [_companyName setBorderStyle:UITextBorderStyleRoundedRect];
        
        _companyName.placeholder = @"点此输入公司名称";
        
        if (appUserInfo.USER_COMPANY_NAME != nil|| ![appUserInfo.USER_COMPANY_NAME isEqualToString:@""]) {
            
            [_companyName setText:[NSString stringWithFormat:@"%@",appUserInfo.USER_COMPANY_NAME]];
            
        }
        
        _companyName.delegate = self;
        
        _companyName.autocorrectionType = UITextAutocorrectionTypeNo;
        
        _companyName.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        _companyName.returnKeyType = UIReturnKeyDone;
        
        _companyName.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _companyName.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
        
        [self.view addSubview:_companyName];
        
        UILabel *people = [[UILabel alloc] initWithFrame:CGRectMake(nickName.frame.origin.x, companyName.frame.origin.y+companyName.frame.size.height+10.0, 90.0, 30.0)];
        
        [people setText:@"联系人："];
        
        [self.view addSubview:people];
        
        _people = [[UITextField alloc] initWithFrame:CGRectMake(people.frame.origin.x+people.frame.size.width, people.frame.origin.y, 165.0, 30.0)];
        
        [_people setBorderStyle:UITextBorderStyleRoundedRect];
        
        _people.placeholder = @"点此输入联系人";
        
        if (appUserInfo.CONTACT_PERSON != nil|| ![appUserInfo.CONTACT_PERSON isEqualToString:@""]) {
            
            [_people setText:[NSString stringWithFormat:@"%@",appUserInfo.CONTACT_PERSON]];
            
        }
        
        _people.delegate = self;
        
        _people.autocorrectionType = UITextAutocorrectionTypeNo;
        
        _people.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        _people.returnKeyType = UIReturnKeyDone;
        
        _people.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _people.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
        
        [self.view addSubview:_people];
        
        UILabel *phone = [[UILabel alloc] initWithFrame:CGRectMake(nickName.frame.origin.x, people.frame.origin.y+people.frame.size.height+10.0, 90.0, 30.0)];
        
        [phone setText:@"手机号："];
        
        [self.view addSubview:phone];
        
        _phone = [[UITextField alloc] initWithFrame:CGRectMake(phone.frame.origin.x+phone.frame.size.width, phone.frame.origin.y, 165.0, 30.0)];
        
        [_phone setBorderStyle:UITextBorderStyleRoundedRect];
        
        _phone.placeholder = @"点此输入手机号";
        
        if (appUserInfo.CONTACT_TEL != nil|| ![appUserInfo.CONTACT_TEL isEqualToString:@""]) {
            
            [_phone setText:[NSString stringWithFormat:@"%@",appUserInfo.CONTACT_TEL]];
            
        }
        
        _phone.delegate = self;
        
        _phone.autocorrectionType = UITextAutocorrectionTypeNo;
        
        _phone.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        _phone.returnKeyType = UIReturnKeyDone;
        
        _phone.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _phone.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
        
        [self.view addSubview:_phone];
        
        UILabel *email = [[UILabel alloc] initWithFrame:CGRectMake(nickName.frame.origin.x, phone.frame.origin.y+phone.frame.size.height+10.0, 90.0, 30.0)];
        
        [email setText:@"E_Mail："];
        
        [self.view addSubview:email];
        
        _email = [[UITextField alloc] initWithFrame:CGRectMake(email.frame.origin.x+email.frame.size.width, email.frame.origin.y, 165.0, 30.0)];
        
        [_email setBorderStyle:UITextBorderStyleRoundedRect];
        
        _email.placeholder = @"点此输入E_Mail";
        
        if (appUserInfo.E_MAIL != nil|| ![appUserInfo.E_MAIL isEqualToString:@""]) {
            
            [_email setText:[NSString stringWithFormat:@"%@",appUserInfo.E_MAIL]];
            
        }
        
        _email.delegate = self;
        
        _email.autocorrectionType = UITextAutocorrectionTypeNo;
        
        _email.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        _email.returnKeyType = UIReturnKeyDone;
        
        _email.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _email.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
        
        [self.view addSubview:_email];
        
        UILabel *fax = [[UILabel alloc] initWithFrame:CGRectMake(nickName.frame.origin.x, email.frame.origin.y+email.frame.size.height+10.0, 90.0, 30.0)];
        
        [fax setText:@"公司电话："];
        
        [self.view addSubview:fax];
        
        _fax = [[UITextField alloc] initWithFrame:CGRectMake(fax.frame.origin.x+fax.frame.size.width, fax.frame.origin.y, 165.0, 30.0)];
        
        [_fax setBorderStyle:UITextBorderStyleRoundedRect];
        
        _fax.placeholder = @"请输入公司电话";
        
        if (appUserInfo.MOBILE != nil|| ![appUserInfo.MOBILE isEqualToString:@""]) {
            
            [_fax setText:[NSString stringWithFormat:@"%@",appUserInfo.MOBILE]];
            
        }
        
        _fax.delegate = self;
        
        _fax.autocorrectionType = UITextAutocorrectionTypeNo;
        
        _fax.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        _fax.returnKeyType = UIReturnKeyDone;
        
        _fax.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _fax.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
        
        [self.view addSubview:_fax];
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [leftButton setFrame:CGRectMake((self.view.frame.size.width-250.0)/2, fax.frame.origin.y+fax.frame.size.height+10.0, 120, 30.0)];
        
        [leftButton setTitle:@"确定" forState:UIControlStateNormal];
        
        [leftButton addTarget:self action:@selector(commitSetupCarInfo) forControlEvents:UIControlEventTouchUpInside];
        
        [leftButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
        
        [self.view addSubview:leftButton];
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [rightButton setFrame:CGRectMake(leftButton.frame.origin.x+leftButton.frame.size.width+10.0, fax.frame.origin.y+fax.frame.size.height+10.0, 120, 30.0)];
        
        [rightButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        [rightButton setTitle:@"取消" forState:UIControlStateNormal];
        
        [rightButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
        
        [self.view addSubview:rightButton];
        
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (alertView.tag ==1||alertView.tag==2) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}

-(void)commitSetupCarInfo{

    if ([_nickName.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"昵称不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_companyType.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"公司类型不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_companyAddress.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"公司地址不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_companyName.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"公司名称不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_people.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"联系人不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_phone.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"手机号不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if (![self checkPhoneNumInput:_phone.text]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"手机号格式不正确" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_email.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"邮箱不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if ([_fax.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"公司电话" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else if (![self checkPhoneNumInput:_fax.text]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"公司电话格式不正确" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alert show];
        
    }else{
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
        NSString *commitUrl = [NSString stringWithFormat:@"%@&flag=20&username=%@&company_name=%@&address=%@&mobile=%@&email=%@&tel=%@&company_type=%@&contact=%@",SERVER_URL,[defaults objectForKey:@"username"],_companyName.text,_companyAddress.text,_fax.text,_email.text,_phone.text,_companyType.text,_people.text];
        
        NSLog(@"%@",commitUrl);
        
        ASIFormDataRequest *commitForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:commitUrl]];
        
        [commitForm startSynchronous];
        
        NSString *result = [commitForm responseString];
        
        if ([result isEqualToString:@"0"]) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            alertView.tag=1;
            
            [alertView show];
            
        }else if ([result isEqualToString:@"1"]) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"修改成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            alertView.tag=2;
            
            [alertView show];
            
        }
        else if ([result isEqualToString:@"2"]) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            alertView.tag=2;
            
            [alertView show];
            
        }else if ([result isEqualToString:@"3"]) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"参数错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            alertView.tag=2;
            
            [alertView show];
            
        }
        
    }
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0+64, self.view.frame.size.width, self.view.frame.size.height);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    return [textField resignFirstResponder];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [_nickName resignFirstResponder];
    
    [_companyType resignFirstResponder];
    
    [_companyAddress resignFirstResponder];
    
    [_companyName resignFirstResponder];
    
    [_people resignFirstResponder];
    
    [_phone resignFirstResponder];
    
    [_email resignFirstResponder];
    
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

-(void)back{

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
