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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 568)];
    
    [mainScrollView setContentSize:CGSizeMake(self.view.frame.size.width, 568)];
    
    [self.view addSubview:mainScrollView];
    
    UIImage *carImage = [UIImage imageNamed:@"car"];
    
    UIImageView *carImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 0.0, 130.0, 120.0)];
    
    [carImageView setImage:carImage];
    
    [mainScrollView addSubview:carImageView];
    
    UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(140.0, 0.0, THREE_WIDTH, 20.0)];
    
    [userName setText:@"用户名："];
    
    [userName setFont:FONT];
    
    [mainScrollView addSubview:userName];
    
    UILabel *userInfoName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x+userName.frame.size.width, userName.frame.origin.y, 100.0, 20.0)];
    
    [userInfoName setText:@"李先生"];
    
    [userInfoName setFont:FONT];
    
    [mainScrollView addSubview:userInfoName];
    
    UILabel *rankName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, userName.frame.origin.y+userName.frame.size.height, TWO_WIDTH, 20.0)];
    
    [rankName setText:@"排名："];
    
    [rankName setFont:FONT];
    
    [mainScrollView addSubview:rankName];
    
    UILabel *rankInfoName = [[UILabel alloc] initWithFrame:CGRectMake(rankName.frame.origin.x+rankName.frame.size.width, rankName.frame.origin.y, 100.0, 20.0)];
    
    [rankInfoName setText:@"21"];
    
    [rankInfoName setFont:FONT];
    
    [mainScrollView addSubview:rankInfoName];
    
    UILabel *levleName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, rankName.frame.origin.y+rankName.frame.size.height, FOUR_WIDTH, 20.0)];
    
    [levleName setText:@"用户等级："];
    
    [levleName setFont:FONT];
    
    [mainScrollView addSubview:levleName];
    
    UILabel *levelInfoName = [[UILabel alloc] initWithFrame:CGRectMake(levleName.frame.origin.x+levleName.frame.size.width, levleName.frame.origin.y, 100.0, 20.0)];
    
    [levelInfoName setText:@"4"];
    
    [levelInfoName setFont:FONT];
    
    [mainScrollView addSubview:levelInfoName];
    
    UILabel *registerName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, levleName.frame.origin.y+levleName.frame.size.height, FOUR_WIDTH, 20.0)];
    
    [registerName setText:@"注册时间："];
    
    [registerName setFont:FONT];
    
    [mainScrollView addSubview:registerName];
    
    UILabel *registerInfoName = [[UILabel alloc] initWithFrame:CGRectMake(registerName.frame.origin.x+registerName.frame.size.width, registerName.frame.origin.y, 100.0, 20.0)];
    
    [registerInfoName setText:@"2013年1月1日"];
    
    [registerInfoName setFont:FONT];
    
    [mainScrollView addSubview:registerInfoName];
    
    UILabel *acceptName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, registerName.frame.origin.y+registerName.frame.size.height, FOUR_WIDTH, 20.0)];
    
    [acceptName setText:@"接单次数："];
    
    [acceptName setFont:FONT];
    
    [mainScrollView addSubview:acceptName];
    
    UILabel *acceptInfoName = [[UILabel alloc] initWithFrame:CGRectMake(acceptName.frame.origin.x+acceptName.frame.size.width, acceptName.frame.origin.y, 100.0, 20.0)];
    
    [acceptInfoName setText:@"99"];
    
    [acceptInfoName setFont:FONT];
    
    [mainScrollView addSubview:acceptInfoName];
    
    UILabel *queryName = [[UILabel alloc] initWithFrame:CGRectMake(userName.frame.origin.x, acceptName.frame.origin.y+acceptName.frame.size.height, FOUR_WIDTH, 20.0)];
    
    [queryName setText:@"查询信息："];
    
    [queryName setFont:FONT];
    
    [mainScrollView addSubview:queryName];
    
    UILabel *queryInfoName = [[UILabel alloc] initWithFrame:CGRectMake(queryName.frame.origin.x+queryName.frame.size.width, queryName.frame.origin.y, 100.0, 20.0)];
    
    [queryInfoName setText:@"199"];
    
    [queryInfoName setFont:FONT];
    
    [mainScrollView addSubview:queryInfoName];
    
    
    CarInfoTopView *carInfoTopView = [[CarInfoTopView alloc] initWithFrame:CGRectMake(0.0, queryName.frame.origin.y+queryName.frame.size.height, self.view.frame.size.width, 190)];
    
    CarInfo *carInfo = [[CarInfo alloc] init];
    
    [carInfo setPeople:@"皇太极"];
    
    [carInfo setAddress:@"青岛港"];
    
    [carInfo setPhone:@"12345678901"];
    
    [carInfo setOtherInfo:@"其他信息其他信息其他信息其他信息其他信息其他信息其他信息其他信息其他信息其他信息其他信息其他信息其他信息其他信息其他信息其他信息"];
    
    [carInfo setGetTime:@"2014-10-10 00:02:04"];
    
    [carInfo setBoxType:@"20小柜"];
    
    [carInfo setCreateTime:@"2014-6-26 08:09:08"];
    
    [carInfo setPrice:@"电议面谈"];
    
    [carInfo setInfoType:@"紧急派车"];
    
    [carInfo setWeight:@"10吨"];
    
    [carInfo setPort:@"青岛港"];
    
    [carInfo setTransportType:@"出口"];
    
    [carInfoTopView set_carInfo:carInfo];
    
    [carInfoTopView setBackgroundColor:[UIColor whiteColor]];
    
    [mainScrollView addSubview:carInfoTopView];
    
    CarInfoCell *carInfoCell = [[CarInfoCell alloc] init];
    
    [carInfoCell setCompanyName:@"我是公司名称"];
    
    [carInfoCell setCompanyAddress:@"我是公司地址"];
    
    [carInfoCell setCompanyType:@"工厂"];
    
    [carInfoCell setPeople:@"王先生"];
    
    [carInfoCell setEmail:@"88888888888@163.com"];
    
    [carInfoCell setCompanyPhone:@"027-883569873"];
    
    [carInfoCell setPhone:@"15945678912"];
    
    [carInfoCell setFaxNum:@"0532-8685201216/0532-8685201314"];
    
    CarInfoAcceptBottomView *bottomView =  [[CarInfoAcceptBottomView alloc] initWithFrame:CGRectMake(0.0, carInfoTopView.frame.origin.y+carInfoTopView.frame.size.height, self.view.frame.size.width, 120.0)];
    
    [bottomView setBackgroundColor:[UIColor whiteColor]];
    
    [bottomView set_carInfoCell:carInfoCell];
    
    [mainScrollView addSubview:bottomView];
    
    // Do any additional setup after loading the view.
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
