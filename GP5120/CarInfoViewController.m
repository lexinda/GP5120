//
//  CarInfoViewController.m
//  GP5120
//
//  Created by lele126 on 14-8-6.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "CarInfoViewController.h"

/**
 *  随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface CarInfoViewController ()

@end

@implementation CarInfoViewController

@synthesize _bottomTableView;

@synthesize _fakeData;

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
    
    CarInfoTopView *carInfoTopView = [[CarInfoTopView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 190)];
    
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
    
    [self.view addSubview:carInfoTopView];
    
    _fakeData = [NSMutableArray array];
    
    for (int i = 0; i<12; i++) {
        [_fakeData addObject:MJRandomData];
    }
    
    _bottomTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, carInfoTopView.frame.origin.y+carInfoTopView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-carInfoTopView.frame.size.height-64-49)];
    
    _bottomTableView.dataSource = self;
    
    _bottomTableView.delegate = self;
    
    [self.view addSubview:_bottomTableView];
    
    [self setupRefresh];
    
    FootButtonView *footButtonView = [[FootButtonView alloc] initWithFrame:CGRectMake(0.0,_bottomTableView.frame.size.height+_bottomTableView.frame.origin.y+10.0, self.view.frame.size.width, 49)];
    
    [self.view addSubview:footButtonView];
    
    // Do any additional setup after loading the view.
}

-(void)setupRefresh{
    
    [_bottomTableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    [_bottomTableView headerBeginRefreshing];
    
    [_bottomTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
}

- (void)headerRereshing
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [_fakeData insertObject:MJRandomData atIndex:0];
    }
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [_bottomTableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [_bottomTableView headerEndRefreshing];
    });
}

-(void)footerRereshing{
    
    for (int i = 0; i<5; i++) {
        
        [_fakeData addObject:MJRandomData];
        
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [_bottomTableView reloadData];
        
        [_bottomTableView footerEndRefreshing];
        
    });
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _fakeData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdetify = @"tableViewCell";
    
    CarInfoCell *carInfoCell = [[CarInfoCell alloc] init];
    
    [carInfoCell setCompanyName:@"我是公司名称"];
    
    [carInfoCell setCompanyAddress:@"我是公司地址"];
    
    [carInfoCell setCompanyType:@"工厂"];
    
    [carInfoCell setPeople:@"王先生"];
    
    [carInfoCell setEmail:@"88888888888@163.com"];
    
    [carInfoCell setCompanyPhone:@"027-883569873"];
    
    [carInfoCell setPhone:@"15945678912"];
    
    [carInfoCell setFaxNum:@"0532-8685201216/0532-8685201314"];
    
    CarInfoBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdetify];
    
    if (!cell) {
        
        cell = [[CarInfoBottomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdetify withCarInfoCell:carInfoCell];
        
        cell._pushViewDelegate = self;
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%i",indexPath.row);
    
    CarInfoViewController *carInfoViewController = [[CarInfoViewController alloc] init];
    
    [self.navigationController pushViewController:carInfoViewController animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120.0;
    
}

-(void)showAcceptView{
    
    AcceptInfoViewController *acceptInfoViewController = [[AcceptInfoViewController alloc] init];
    
    [self.navigationController pushViewController:acceptInfoViewController animated:YES];
    
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
