//
//  AcceptInfoViewController.m
//  GP5120
//
//  Created by lele126 on 14-8-13.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "AcceptInfoViewController.h"

#define TWO_WIDTH 50

#define THREE_WIDTH 60

#define FOUR_WIDTH 75

#define FONT [UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]

@interface AcceptInfoViewController ()

@end

@implementation AcceptInfoViewController

@synthesize _appUserInfo;

@synthesize _releasePersonInfo;

@synthesize _releaseInfo;

@synthesize _hud;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"找柜详情";
        
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
    [self.navigationController.view addSubview:_hud];
    
    _hud.delegate = self;
    
    _hud.labelText = @"加载中...";
    
    [_hud showWhileExecuting:@selector(pushAcceptInfoView) onTarget:self withObject:nil animated:YES];
    
    // Do any additional setup after loading the view.
}

-(void)pushAcceptInfoView{
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    NSString *username = [defaults objectForKey:@"username"];
    
    NSString *findPortUrl = [NSString stringWithFormat:@"%@&flag=93&username=%@&info_no=%@",SERVER_URL,username,_releaseInfo.INFO_NO];
    
    NSLog(@"%@",findPortUrl);
    
    ASIFormDataRequest *findPortInfoForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:findPortUrl]];
    
    [findPortInfoForm startSynchronous];
    
    NSString *result = [findPortInfoForm responseString];
    
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
                    
                }
                else if(i==1){
                    
                    NSString *strData = [responseData objectAtIndex:i];
                    
                    NSDictionary *releaseData = [strData objectFromJSONString];
                    
                    NSArray *releaseArray = [releaseData objectForKey:@"RELEASE_PERSON_INFO"];
                    
                    if (releaseArray.count>0) {
                        
                        for (NSDictionary *dctionary in releaseArray) {
                            
                            _releasePersonInfo = [[ReleasePersonInfo alloc] getReleasePersonInfo:dctionary];
                            
                        }
                        
                    }
                    
                }
                
            }
        }
        
    }
    
    UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [mainScrollView setContentSize:CGSizeMake(self.view.frame.size.width, 460)];
    
    [self.view addSubview:mainScrollView];
    
    UIButton *photoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [photoButton setTitle:@"查看相册>" forState:UIControlStateNormal];
    
    [photoButton setFrame:CGRectMake(10.0, 0.0, 100.0, 20.0)];
    
    [mainScrollView addSubview:photoButton];
    
    UIImage *carImage = [UIImage imageNamed:@"car"];
    
    UIImageView *carImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, photoButton.frame.size.height, 100.0, 100.0)];
    
    [carImageView setImage:carImage];
    
    [mainScrollView addSubview:carImageView];
    
    UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(110.0, 0.0, THREE_WIDTH, 20.0)];
    
    [userName setText:@"用户名："];
    
    [userName setFont:FONT];
    
    [mainScrollView addSubview:userName];
    
    UILabel *userInfoName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x+userName.frame.size.width, userName.frame.origin.y, 100.0, 20.0)];
    
    [userInfoName setText:[NSString stringWithFormat:@"%@",_appUserInfo.USER_NAME]];
    
    [userInfoName setFont:FONT];
    
    [mainScrollView addSubview:userInfoName];
    
    UILabel *rankName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, userName.frame.origin.y+userName.frame.size.height, FOUR_WIDTH, 20.0)];
    
    [rankName setText:@"活跃度："];
    
    [rankName setFont:FONT];
    
    [mainScrollView addSubview:rankName];
    
    UILabel *rankInfoName = [[UILabel alloc] initWithFrame:CGRectMake(rankName.frame.origin.x+rankName.frame.size.width, rankName.frame.origin.y, 100.0, 20.0)];
    
    [rankInfoName setText:[NSString stringWithFormat:@"%@",_appUserInfo.ACTIVE_INDEX]];
    
    [rankInfoName setFont:FONT];
    
    [mainScrollView addSubview:rankInfoName];
    
    UILabel *levleName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, rankName.frame.origin.y+rankName.frame.size.height, FOUR_WIDTH, 20.0)];
    
    [levleName setText:@"用户等级："];
    
    [levleName setFont:FONT];
    
    [mainScrollView addSubview:levleName];
    
    UIImageView *levelInfoName = [[UIImageView alloc] initWithFrame:CGRectMake(levleName.frame.origin.x+levleName.frame.size.width, levleName.frame.origin.y, 100.0, 20.0)];
    
    [levelInfoName setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",_appUserInfo.GRADE]]];
    
    [mainScrollView addSubview:levelInfoName];
    
    UILabel *registerName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, levleName.frame.origin.y+levleName.frame.size.height, FOUR_WIDTH, 20.0)];
    
    [registerName setText:@"注册时间："];
    
    [registerName setFont:FONT];
    
    [mainScrollView addSubview:registerName];
    
    UILabel *registerInfoName = [[UILabel alloc] initWithFrame:CGRectMake(registerName.frame.origin.x+registerName.frame.size.width, registerName.frame.origin.y, 150.0, 20.0)];
    
    [registerInfoName setText:[NSString stringWithFormat:@"%@",_appUserInfo.REG_TIME]];
    
    [registerInfoName setFont:FONT];
    
    [mainScrollView addSubview:registerInfoName];
    
    UILabel *acceptName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, registerName.frame.origin.y+registerName.frame.size.height, FOUR_WIDTH, 20.0)];
    
    [acceptName setText:@"发布消息："];
    
    [acceptName setFont:FONT];
    
    [mainScrollView addSubview:acceptName];
    
    UILabel *acceptInfoName = [[UILabel alloc] initWithFrame:CGRectMake(acceptName.frame.origin.x+acceptName.frame.size.width, acceptName.frame.origin.y, 100.0, 20.0)];
    
    [acceptInfoName setText:[NSString stringWithFormat:@"%@",_appUserInfo.RELEASE_COUNT]];
    
    [acceptInfoName setFont:FONT];
    
    [mainScrollView addSubview:acceptInfoName];
    
    UILabel *queryName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, acceptName.frame.origin.y+acceptName.frame.size.height, FOUR_WIDTH, 20.0)];
    
    [queryName setText:@"查询信息："];
    
    [queryName setFont:FONT];
    
    [mainScrollView addSubview:queryName];
    
    UILabel *queryInfoName = [[UILabel alloc] initWithFrame:CGRectMake(queryName.frame.origin.x+queryName.frame.size.width, queryName.frame.origin.y, 100.0, 20.0)];
    
    [queryInfoName setText:[NSString stringWithFormat:@"%@",_appUserInfo.QUERY_COUNT]];
    
    [queryInfoName setFont:FONT];
    
    [mainScrollView addSubview:queryInfoName];
    
    UIImageView *middleView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, queryName.frame.origin.y+queryName.frame.size.height, self.view.frame.size.width, 35.0)];
    
    [middleView setImage:[UIImage imageNamed:@"middle.jpg"]];
    
    [mainScrollView addSubview:middleView];
    
    CarInfoTopView *carInfoTopView = [[CarInfoTopView alloc] initWithFrame:CGRectMake(0.0, middleView.frame.origin.y+middleView.frame.size.height, self.view.frame.size.width, 190)];
    
    CarInfo *carInfo = [[CarInfo alloc] init];
    
    NSArray *contract = [[NSString stringWithFormat:@"%@",_releaseInfo.CONTRACT] componentsSeparatedByString:@"/"];
    
    [carInfo setPeople:[NSString stringWithFormat:@"%@",[contract objectAtIndex:0]]];
    
    [carInfo setAddress:[NSString stringWithFormat:@"%@",_releaseInfo.DESTINATION]];
    
    [carInfo setPhone:[NSString stringWithFormat:@"%@",[contract objectAtIndex:1]]];
    
    [carInfo setOtherInfo:[NSString stringWithFormat:@"%@",_releaseInfo.ESPECIAL_REQUEST]];
    
    [carInfo setGetTime:[NSString stringWithFormat:@"%@",_releaseInfo.RELEASE_TIME]];
    
    [carInfo setBoxType:[NSString stringWithFormat:@"%@",_releaseInfo.CHUNK_TYPE]];
    
    [carInfo setCreateTime:[NSString stringWithFormat:@"%@",_releaseInfo.RELEASE_TIME]];
    
    [carInfo setPrice:[NSString stringWithFormat:@"%@",_releaseInfo.PRICE]];
    
    [carInfo setInfoType:[NSString stringWithFormat:@"%@",_releaseInfo.TRAFFIC_TYPE]];
    
    [carInfo setWeight:[NSString stringWithFormat:@"%@",_releaseInfo.WEIGHT]];
    
    [carInfo setPort:[NSString stringWithFormat:@"%@",_releaseInfo.PORT]];
    
    [carInfo setTransportType:[NSString stringWithFormat:@"%@",_releaseInfo.TRAFFIC_TYPE]];
    
    [carInfoTopView set_carInfo:carInfo];
    
    [carInfoTopView setBackgroundColor:[UIColor whiteColor]];
    
    [mainScrollView addSubview:carInfoTopView];
    
    UIImageView *footView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, carInfoTopView.frame.origin.y+150.0, self.view.frame.size.width, 35.0)];
    
    [footView setImage:[UIImage imageNamed:@"foot.jpg"]];
    
    [mainScrollView addSubview:footView];
    
    CarInfoCell *carInfoCell = [[CarInfoCell alloc] init];
    
    [carInfoCell setCompanyName:[NSString stringWithFormat:@"%@",_releasePersonInfo.userCompanyName]];
    
    [carInfoCell setCompanyAddress:[NSString stringWithFormat:@"%@",_releasePersonInfo.companyPoision]];
    
    [carInfoCell setCompanyType:[NSString stringWithFormat:@"%@",_releasePersonInfo.companyType]];
    
    [carInfoCell setPeople:[NSString stringWithFormat:@"%@",_releasePersonInfo.concatPerson]];
    
    [carInfoCell setEmail:[NSString stringWithFormat:@"%@",_releasePersonInfo.email]];
    
    [carInfoCell setCompanyPhone:[NSString stringWithFormat:@"%@",_releasePersonInfo.concatTel]];
    
    [carInfoCell setPhone:[NSString stringWithFormat:@"%@",_releasePersonInfo.mobile]];
    
    [carInfoCell setFaxNum:@"0532-8685201216/0532-8685201314"];
    
    CarInfoAcceptBottomView *bottomView =  [[CarInfoAcceptBottomView alloc] initWithFrame:CGRectMake(0.0, carInfoTopView.frame.origin.y+carInfoTopView.frame.size.height, self.view.frame.size.width, 120.0)];
    
    [bottomView setBackgroundColor:[UIColor whiteColor]];
    
    [bottomView set_carInfoCell:carInfoCell];
    
    [mainScrollView addSubview:bottomView];
    
}

-(void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
