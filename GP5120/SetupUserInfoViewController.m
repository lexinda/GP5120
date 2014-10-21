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
    
    [self.view addSubview:_companyType];
    
    UILabel *companyAddress = [[UILabel alloc] initWithFrame:CGRectMake(nickName.frame.origin.x, companyType.frame.origin.y+companyType.frame.size.height+10.0, 90.0, 30.0)];
    
    [companyAddress setText:@"公司地址："];
    
    [self.view addSubview:companyAddress];
    
    _companyAddress = [[UITextField alloc] initWithFrame:CGRectMake(companyAddress.frame.origin.x+companyAddress.frame.size.width, companyAddress.frame.origin.y, 165.0, 30.0)];
    
    [_companyAddress setBorderStyle:UITextBorderStyleRoundedRect];
    
    _companyAddress.placeholder = @"点此输入公司地址";
    
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
    
    _email.delegate = self;
    
    _email.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _email.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _email.returnKeyType = UIReturnKeyDone;
    
    _email.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _email.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_email];
    
    UILabel *fax = [[UILabel alloc] initWithFrame:CGRectMake(nickName.frame.origin.x, email.frame.origin.y+email.frame.size.height+10.0, 90.0, 30.0)];
    
    [fax setText:@"传\t真："];
    
    [self.view addSubview:fax];
    
    _fax = [[UITextField alloc] initWithFrame:CGRectMake(fax.frame.origin.x+fax.frame.size.width, fax.frame.origin.y, 165.0, 30.0)];
    
    [_fax setBorderStyle:UITextBorderStyleRoundedRect];
    
    _fax.placeholder = @"点此输入传真";
    
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
    
    [leftButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self.view addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [rightButton setFrame:CGRectMake(leftButton.frame.origin.x+leftButton.frame.size.width+10.0, fax.frame.origin.y+fax.frame.size.height+10.0, 120, 30.0)];
    
    [rightButton addTarget:self action:@selector(setupCarInfo:) forControlEvents:UIControlEventTouchUpInside];
    
    [rightButton setTitle:@"取消" forState:UIControlStateNormal];
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self.view addSubview:rightButton];
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
