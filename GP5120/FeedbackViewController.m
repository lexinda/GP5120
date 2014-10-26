//
//  FeedbackViewController.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/26.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "FeedbackViewController.h"

enum tableTag{
    usernameTag=20,
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

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

@synthesize _usernameField;

@synthesize _phoneField;

@synthesize _mailField;

@synthesize _feedBackText;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.title = @"意见反馈";
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-250.0)/2, 10.0, 75.0, 20.0)];
    
    [username setText:@"用户名："];
    
    [self.view addSubview:username];
    
    _usernameField = [[UITextField alloc] initWithFrame:CGRectMake(username.frame.origin.x+username.frame.size.width, username.frame.origin.y, 175.0, 20.0)];
    
    [_usernameField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _usernameField.placeholder = @"手机号/自定义账号";
    
    [_usernameField setTag:usernameTag];
    
    _usernameField.delegate = self;
    
    _usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _usernameField.returnKeyType = UIReturnKeyDone;
    
    _usernameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _usernameField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_usernameField];
    
    UILabel *phone = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-250.0)/2, username.frame.origin.y+username.frame.size.height+10.0, 75.0, 20.0)];
    
    [phone setText:@"手机号："];
    
    [self.view addSubview:phone];
    
    _phoneField = [[UITextField alloc] initWithFrame:CGRectMake(phone.frame.origin.x+phone.frame.size.width, phone.frame.origin.y, 175.0, 20.0)];
    
    [_phoneField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _phoneField.placeholder = @"请输入你的手机号";
    
    [_phoneField setTag:usernameTag];
    
    _phoneField.delegate = self;
    
    _phoneField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _phoneField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _phoneField.returnKeyType = UIReturnKeyDone;
    
    _phoneField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _phoneField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_phoneField];
    
    UILabel *mailname = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-250.0)/2, phone.frame.origin.y+phone.frame.size.height+10.0, 75.0, 20.0)];
    
    [mailname setText:@"E_mail："];
    
    [self.view addSubview:mailname];
    
    _mailField = [[UITextField alloc] initWithFrame:CGRectMake(mailname.frame.origin.x+mailname.frame.size.width, mailname.frame.origin.y, 175.0, 20.0)];
    
    [_mailField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _mailField.placeholder = @"请输入你的E_mail";
    
    [_mailField setTag:usernameTag];
    
    _mailField.delegate = self;
    
    _mailField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _mailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _mailField.returnKeyType = UIReturnKeyDone;
    
    _mailField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _mailField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_mailField];
    
    _feedBackText = [[UITextView alloc] initWithFrame:CGRectMake(mailname.frame.origin.x, mailname.frame.origin.y+mailname.frame.size.height+10.0, self.view.frame.size.width-mailname.frame.origin.x*2, 88.0)];
    
    _feedBackText.text=@"请在这里输入您的宝贵意见";
    
    _feedBackText.textColor = [UIColor blackColor];
    
    _feedBackText.delegate = self;
    
    _feedBackText.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _feedBackText.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _feedBackText.returnKeyType = UIReturnKeyDone;
    
    _feedBackText.keyboardType = UIKeyboardTypeDefault;//键盘类型
    
    _feedBackText.scrollEnabled = NO;//是否可以拖动
    
    _feedBackText.backgroundColor = [UIColor whiteColor];
    
    _feedBackText.font = [UIFont fontWithName:@"Arial" size:13.0];
    
    _feedBackText.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _feedBackText.layer.borderWidth =1.0;
    
    _feedBackText.layer.cornerRadius =5.0;
    
    [self.view addSubview:_feedBackText];
    
    UIButton *comitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [comitButton setFrame:CGRectMake((self.view.frame.size.width-210)/2, _feedBackText.frame.origin.y+_feedBackText.frame.size.height+10.0, 100, 30.0)];
    
    [comitButton setTitle:@"提交" forState:UIControlStateNormal];
    
    [comitButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self.view addSubview:comitButton];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [cancelButton setFrame:CGRectMake(comitButton.frame.origin.x+comitButton.frame.size.width+10.0, comitButton.frame.origin.y, 100, 30.0)];
    
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    
    [cancelButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self.view addSubview:cancelButton];
}

-(void)goBack{

    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView{

    [textView setText:@""];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ((![_usernameField isExclusiveTouch])
        ||(![_phoneField isExclusiveTouch])||(![_mailField isExclusiveTouch])||(![_feedBackText isExclusiveTouch])
        ) {
        [_usernameField resignFirstResponder];
        [_phoneField resignFirstResponder];
        [_mailField resignFirstResponder];
        [_feedBackText resignFirstResponder];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text

{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        return NO;
        
    }
    
    return YES;
    
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
