//
//  QueryCarInfoViewController.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/26.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "QueryCarInfoViewController.h"

@interface QueryCarInfoViewController ()

@end

@implementation QueryCarInfoViewController

@synthesize _queryCarInfoView;

@synthesize _hud;

@synthesize _appUserInfo;

@synthesize _table;

@synthesize _releasePersonInfo;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.title = @"派车信息";
        
    }
    
    return  self;
    
}

-(void)loadView{
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UIView *mainView = [[UIView alloc] initWithFrame:rect];
    
    [mainView setBackgroundColor:[UIColor whiteColor]];
    
    self.view = mainView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
    [self.navigationController.view addSubview:_hud];
    
    _hud.delegate = self;
    
    _hud.labelText = @"加载中...";
    
    [_hud showWhileExecuting:@selector(pushQueryCarInfoView) onTarget:self withObject:nil animated:YES];
    
}

-(void)pushQueryCarInfoView{

    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    NSString *username = [defaults objectForKey:@"username"];
    
    NSString *carInfoUrl = [NSString stringWithFormat:@"%@&flag=621&username=%@",SERVER_URL,username];
    
    NSLog(@"%@",carInfoUrl);
    
    ASIFormDataRequest *carInfoForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:carInfoUrl]];
    
    [carInfoForm startSynchronous];
    
    NSString *result = [carInfoForm responseString];
    
    if ([result isEqualToString:@"0"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请求失败！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
    }else if ([result isEqualToString:@"4"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"暂无该用户发布的集装箱信息！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
    }else if ([result isEqualToString:@"5"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"暂无接单司机！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
    }else if ([result isEqualToString:@"6"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"系统错误！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
    }else{
    
        NSLog(@"%@",result);
        
        NSArray *responseData = [result componentsSeparatedByString:@"$$"];
        
        if(responseData.count>0){
            for (int i=0; i<responseData.count; i++) {
                
                if (i==0) {
                    
                    NSString *strData = [responseData objectAtIndex:i];
                        
                    NSDictionary *userData = [strData objectFromJSONString];
                        
                    NSArray *userArray = [userData objectForKey:@"APP_USER_INFO"];
                        
                    if(userArray.count>0){
                            
                        for (NSDictionary *dictionary in userArray) {
                                
                            _appUserInfo = [[AppUserInfo alloc] getAppUserInfo:dictionary];
                        }
                            
                    }
                    
                }else if(i==1){
                    
                    NSString *strData = [responseData objectAtIndex:i];
                        
                    NSDictionary *tableData = [strData objectFromJSONString];
                        
                    NSArray *tableArray = [tableData objectForKey:@"Table"];
                        
                    if (tableArray.count>0) {
                            
                        for (NSDictionary *dictionary in tableArray) {
                                
                             _table = [[Table alloc] getTableInfo:dictionary];
                                
                        }
                            
                    }
                    
                }
                else if(i==2){
                    
                    NSString *strData = [responseData objectAtIndex:i];
                        
                    NSDictionary *releaseData = [strData objectFromJSONString];
                    
                    NSArray *releaseArray = [releaseData objectForKey:@"RELEASE_PERSON_INFO"];
                        
                    if (releaseArray.count>0) {
                            
                        for (NSDictionary *dctionary in releaseArray) {
                                
                            _releasePersonInfo = [[ReleasePersonInfo alloc] getReleasePersonInfo:dctionary];
                                
                        }
                            
                    }
                    
                }
                
                UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
                
                [mainScrollView setBackgroundColor:[UIColor whiteColor]];
                
                [mainScrollView setContentSize:CGSizeMake(self.view.frame.size.width, 500)];
                
                QueryCarInfoView *queryCarInfoView = [[QueryCarInfoView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 450.0)];
                
                [queryCarInfoView setBackgroundColor:[UIColor whiteColor]];
                
                [queryCarInfoView set_appUserInfo:_appUserInfo];
                
                [queryCarInfoView set_table:_table];
                
                [queryCarInfoView set_releasePersonInfo:_releasePersonInfo];
                
                [mainScrollView addSubview:queryCarInfoView];
                
                [self.view addSubview:mainScrollView];
            }
        }
        
    }
    
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
