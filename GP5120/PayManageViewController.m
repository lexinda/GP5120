//
//  PayManageViewController.m
//  GP5120
//
//  Created by 朱孟乐 on 14/11/9.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "PayManageViewController.h"

@implementation PayManageViewController

@synthesize _callLabel;

@synthesize _payDetailLabel;

@synthesize _payLabel;

@synthesize _payField;

@synthesize _payTypeOne;

@synthesize _payTypeTwo;

@synthesize _payTypes;

@synthesize _hud;

-(void)viewDidLoad{

    [super viewDidLoad];
    
    _hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
    [self.navigationController.view addSubview:_hud];
    
    _hud.delegate = self;
    
    _hud.labelText = @"加载中...";
    
    [_hud showWhileExecuting:@selector(pushPayManageView) onTarget:self withObject:nil animated:YES];
}

-(void)pushPayManageView{
    
    NSString *payUrl = [NSString stringWithFormat:@"%@&flag=%@&username=%@",SERVER_URL,@"",@""];
    
    ASIFormDataRequest *payForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:payUrl]];

    _callLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, self.view.frame.size.width, 30.0)];
    
    [_callLabel setText:[NSString stringWithFormat:@"尊敬的%@老板",@"张三"]];
    
    [self.view addSubview:_callLabel];
    
    _payDetailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, _callLabel.frame.origin.y+_callLabel.frame.size.height, self.view.frame.size.width, 30.0)];
    
    [_payDetailLabel setText:[NSString stringWithFormat:@"您当前的可用余额是:%@元",@"30"]];
    
    [self.view addSubview:_payDetailLabel];
    
    UIImage *image = [UIImage imageNamed:@"paydolllar"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, _payDetailLabel.frame.origin.y+_payDetailLabel.frame.size.height, self.view.frame.size.width-20.0, 20.0)];
    
    [imageView setImage:image];
    
    [self.view addSubview:imageView];
    
    _payLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, imageView.frame.origin.y+imageView.frame.size.height+10.0, 90.0, 20.0)];
    
    [_payLabel setText:@"充值数目："];
    
    [self.view addSubview:_payLabel];
    
    _payField = [[UITextField alloc] initWithFrame:CGRectMake(_payLabel.frame.origin.x+_payLabel.frame.size.width, _payLabel.frame.origin.y, 100.0, 20.0)];
    
    [_payField setBorderStyle:UITextBorderStyleRoundedRect];
    
    _payField.placeholder = @"";
    
    _payField.delegate = self;
    
    _payField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _payField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _payField.returnKeyType = UIReturnKeyDone;
    
    _payField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _payField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:_payField];
    
    _payTypeOne = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [_payTypeOne setFrame:CGRectMake((self.view.frame.size.width-(22.0*2+100.0*2))/2, _payLabel.frame.origin.y+_payLabel.frame.size.height+10.0+5.0, 22.0, 20.0)];
    
    [_payTypeOne setBackgroundImage:[UIImage imageNamed:@"putout_middle_3"] forState:UIControlStateNormal];
    
    [self.view addSubview:_payTypeOne];
    
    UIImageView *oneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_payTypeOne.frame.origin.x+_payTypeOne.frame.size.width,_payTypeOne.frame.origin.y-5.0,100.0,40.0)];
    
    [oneImageView setImage:[UIImage imageNamed:@"bank"]];
    
    [self.view addSubview:oneImageView];
    
    _payTypeTwo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [_payTypeTwo setFrame:CGRectMake(oneImageView.frame.origin.x+oneImageView.frame.size.width, oneImageView.frame.origin.y+5.0, 22.0, 20.0)];
    
    [_payTypeTwo setBackgroundImage:[UIImage imageNamed:@"putout_middle_2"] forState:UIControlStateNormal];
    
    [self.view addSubview:_payTypeTwo];
    
    UIImageView *twoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_payTypeTwo.frame.origin.x+_payTypeTwo.frame.size.width,_payTypeTwo.frame.origin.y-5.0,100.0,40.0)];
    
    [twoImageView setImage:[UIImage imageNamed:@"zhifubao"]];
    
    [self.view addSubview:twoImageView];
    
    UIButton *comitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [comitButton setFrame:CGRectMake((self.view.frame.size.width-210)/2, oneImageView.frame.origin.y+oneImageView.frame.size.height+10.0, 100, 30.0)];
    
    [comitButton setTitle:@"提交" forState:UIControlStateNormal];
    
    //[comitButton addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
