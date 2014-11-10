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

@synthesize _hud;

@synthesize _table;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
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
    
    [_hud showWhileExecuting:@selector(pushCarInfoView) onTarget:self withObject:nil animated:YES];
    
    // Do any additional setup after loading the view.
}

-(void)pushCarInfoView{

    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    NSString *username = [defaults objectForKey:@"username"];
    
    NSString *haveCarInfo = [NSString stringWithFormat:@"%@&flag=611&username=%@",SERVER_URL,username];
    
    ASIFormDataRequest *haveCarInfoForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:haveCarInfo]];
    
    [haveCarInfoForm startSynchronous];
    
    NSString *haveCarInfoResult = [haveCarInfoForm responseString];
    
    NSLog(@"%@",haveCarInfoResult);
    
    NSArray *haveCarInfoData = [haveCarInfoResult componentsSeparatedByString:@"$$"];
    
    CarInfoDetailView *carInfoTopView = nil;
    if(haveCarInfoData.count>0){
        for (int i=0; i<haveCarInfoData.count; i++) {
            
            if (i==0) {
                
                NSDictionary *tableData = [[haveCarInfoData objectAtIndex:i] objectFromJSONString];
                
                NSArray *tableArray = [tableData objectForKey:@"Table"];
                
                if(tableArray.count>0){
                    
                    for (NSDictionary *tableDictionary in tableArray) {
                        
                        _table = [[Table alloc] getTableInfo:tableDictionary];
                        
                    }
                    
                }
                
                carInfoTopView = [[CarInfoDetailView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 160)];
                
                CarInfo *carInfo = [[CarInfo alloc] init];
                
                NSArray *contract = [_table.CONTRACT componentsSeparatedByString:@"/"];
                
                [carInfo setPeople:[contract objectAtIndex:0]];
                
                [carInfo setAddress:_table.DESTINATION];
                
                [carInfo setPhone:[contract objectAtIndex:1]];
                
                [carInfo setOtherInfo:_table.ESPECIAL_REQUEST];
                
                [carInfo setGetTime:_table.LAST_OUT];
                
                [carInfo setBoxType:_table.CHUNK_TYPE];
                
                [carInfo setCreateTime:_table.STOWAGE_TIME];
                
                [carInfo setPrice:_table.PRICE];
                
                [carInfo setInfoType:_table.INFO_TYPE];
                
                [carInfo setWeight:_table.WEIGHT];
                
                [carInfo setPort:_table.PORT];
                
                [carInfo setTransportType:_table.TRAFFIC_TYPE];
                
                [carInfoTopView set_carInfo:carInfo];
                
                [carInfoTopView setBackgroundColor:[UIColor whiteColor]];
                
                [self.view addSubview:carInfoTopView];
                
            }else if(i==1){
            
                if(![[haveCarInfoData objectAtIndex:i] isEqualToString:@"5"]){
                    
                    _fakeData = [NSMutableArray array];
                    
                    for (int i = 0; i<12; i++) {
                        [_fakeData addObject:MJRandomData];
                    }
                    
                    _bottomTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, carInfoTopView.frame.origin.y+carInfoTopView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-carInfoTopView.frame.size.height-64-49)];
                    
                    _bottomTableView.dataSource = self;
                    
                    _bottomTableView.delegate = self;
                    
                    [self.view addSubview:_bottomTableView];
                    
                    [self setupRefresh];
                }
                
            }
        }
    }
    
    FootButtonView *footButtonView = [[FootButtonView alloc] initWithFrame:CGRectMake(0.0,self.view.frame.size.height-49.0, self.view.frame.size.width, 49)];
    
    [self.view addSubview:footButtonView];
    
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
