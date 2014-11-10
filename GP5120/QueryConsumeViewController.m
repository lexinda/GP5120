//
//  QueryConsumeViewController.m
//  GP5120
//
//  Created by 朱孟乐 on 14/11/9.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "QueryConsumeViewController.h"

@implementation QueryConsumeViewController

@synthesize _callLabel;

@synthesize _accountLabel;

@synthesize _hud;

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    _hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
    [self.navigationController.view addSubview:_hud];
    
    _hud.delegate = self;
    
    _hud.labelText = @"家在中...";
    
    [_hud showWhileExecuting:@selector(pushQueryConsumeView) onTarget:self withObject:nil animated:YES];
    
}

-(void)pushQueryConsumeView{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSString *queryConsume = [NSString stringWithFormat:@"%@&flag=30&username=%@",SERVER_URL,[defaults objectForKey:@"username"]];
    
    ASIFormDataRequest *queryConsumeForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:queryConsume]];
    
    [queryConsumeForm startSynchronous];
    
    NSString *requestStr = [queryConsumeForm responseString];
    
    NSArray *responseData = [requestStr componentsSeparatedByString:@"$$"];
    
    AppUserInfo *appUserInfo = nil;
    
    if(responseData.count>0){
        for (int i=0; i<responseData.count; i++) {
            
            if (i==0) {
                
                NSDictionary *data = [[responseData objectAtIndex:i] objectFromJSONString];
                
                NSArray *array = [data objectForKey:@"USER_INFO"];
                
                if(array.count>0){
                    
                    for (NSDictionary *dictionary in array) {
                        
                        appUserInfo = [[AppUserInfo alloc] getAppUserInfo:dictionary];
                    }
                    
                }
                
            }
        }
    }
    
    _callLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, self.view.frame.size.width-20.0, 20.0)];
    
    [_callLabel setText:[NSString stringWithFormat:@"尊敬的%@",appUserInfo.CONTACT_PERSON]];
    
    [self.view addSubview:_callLabel];
    
    _accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, _callLabel.frame.origin.y+_callLabel.frame.size.height, self.view.frame.size.width-20.0, 20.0)];
    
    [_accountLabel setText:[NSString stringWithFormat:@"你当前的总余额是：%@",appUserInfo.FEE_SUPLUS]];
    
    [self.view addSubview:_accountLabel];
    
    UIButton *comitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [comitButton setFrame:CGRectMake(10, _accountLabel.frame.origin.y+_accountLabel.frame.size.height+10.0, 100, 30.0)];
    
    [comitButton setTitle:@"我要充值" forState:UIControlStateNormal];
    
    [comitButton addTarget:self action:@selector(gotoPayManage) forControlEvents:UIControlEventTouchUpInside];
    
    [comitButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self.view addSubview:comitButton];
    
    UILabel *incomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(comitButton.frame.origin.x+comitButton.frame.size.width+5, comitButton.frame.origin.y, self.view.frame.size.width-(comitButton.frame.origin.x+comitButton.frame.size.width), 15.0)];
    
    [incomeLabel setText:[NSString stringWithFormat:@"当前总收入：%@元",appUserInfo.INCOME]];
    
    [self.view addSubview:incomeLabel];
    
    UILabel *defrayLabel = [[UILabel alloc] initWithFrame:CGRectMake(comitButton.frame.origin.x+comitButton.frame.size.width+5, incomeLabel.frame.origin.y+incomeLabel.frame.size.height+2.0, self.view.frame.size.width-(comitButton.frame.origin.x+comitButton.frame.size.width), 15.0)];
    
    [defrayLabel setText:[NSString stringWithFormat:@"当前总支出：%@元",appUserInfo.DEFRAY]];
    
    [self.view addSubview:defrayLabel];

    
}

-(void)gotoPayManage{

    PayManageViewController *payManageViewController = [[PayManageViewController alloc] init];
    
    [self.navigationController pushViewController:payManageViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
