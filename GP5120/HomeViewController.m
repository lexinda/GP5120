//
//  HomeViewController.m
//  GP5120
//
//  Created by lele126 on 14-8-2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "HomeViewController.h"

/**
 *  随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize _tableView;

@synthesize _fakeData;

@synthesize _meddleView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"小柜双背";
        
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"releasesuccess_top"] forBarMetrics:UIBarMetricsDefault];
        
        UIImage *rightOneImage = [UIImage imageNamed:@"releasesuccess_top_1"];
        
        UIButton *rightOneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [rightOneButton setBackgroundImage:rightOneImage forState:UIControlStateNormal];
        
        [rightOneButton setFrame:CGRectMake(3.0, 0.0, 22.0, 22.0)];
        
        [rightOneButton addTarget:self action:@selector(showActionSheet:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *rightTwoImage = [UIImage imageNamed:@"releasesuccess_top_2"];
        
        UIButton *rightTwoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [rightTwoButton setBackgroundImage:rightTwoImage forState:UIControlStateNormal];
        
        [rightTwoButton setFrame:CGRectMake(rightOneButton.frame.size.width+10.0, 0.0, 22.0, 22.0)];
        
        [rightTwoButton addTarget:self action:@selector(showActionSheet1:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 22.0)];
        
        [rightView addSubview:rightOneButton];
        
        [rightView addSubview:rightTwoButton];
        
        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:rightView];
        
        self.navigationItem.rightBarButtonItem = rightBarButton;
        
        
    }
    return self;
}

-(void)loadView{

    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UIView *mainView = [[UIView alloc] initWithFrame:rect];
    
    [mainView setBackgroundColor:[UIColor whiteColor]];
    
    self.view = mainView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TopButtonView *topButtonView = [[TopButtonView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 40.0)];
    
    [topButtonView setBackgroundColor:[UIColor whiteColor]];
    
    [topButtonView set_pushViewDelegate:self];
    
    [self.view addSubview:topButtonView];
    
    _meddleView = [[UIView alloc] initWithFrame:CGRectMake(topButtonView.frame.origin.x, topButtonView.frame.origin.y+topButtonView.frame.size.height+10.0, self.view.frame.size.width, self.view.frame.size.height-topButtonView.frame.size.height-49-64)];
    
    MeddleTextField *meddleTextField = [[MeddleTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 100.0)];
    
    [meddleTextField set_pushViewDelegate:self];
    
    [meddleTextField set_oneText:@"输入司机用户名"];
    
    [meddleTextField set_twoText:@"输入司机手机号"];
    
    [meddleTextField setBackgroundColor:[UIColor whiteColor]];
    
    [_meddleView addSubview:meddleTextField];
    
    _fakeData = [NSMutableArray array];
    
    for (int i = 0; i<12; i++) {
        [_fakeData addObject:MJRandomData];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, _meddleView.frame.origin.y+50.0, self.view.frame.size.width, _meddleView.frame.size.height-100.0)];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [_meddleView addSubview:_tableView];
    
    [self.view addSubview:_meddleView];
    
    [self setupRefresh];
    
    FootButtonView *footButtonView = [[FootButtonView alloc] initWithFrame:CGRectMake(0.0,_meddleView.frame.size.height+_meddleView.frame.origin.y, self.view.frame.size.width, 49)];
    
    [self.view addSubview:footButtonView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupRefresh{
    
    [_tableView addHeaderWithTarget:self action:@selector(headerRereshing)];

    [_tableView headerBeginRefreshing];

    [_tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
}

-(void)showDataPicker{
//    UIDatePicker *datePicker = [ [ UIDatePicker alloc] initWithFrame:CGRectMake(0.0,0.0,0.0,0.0)];
//    [datePicker setCenter:self.view.center];
//    datePicker.datePickerMode = UIDatePickerModeDate;
//    datePicker.minuteInterval = 5;
//    
//    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
//    
//    [datePicker setLocale:locale];
//    
//    NSString *minStrDate = @"1900-01-01";
//    
//    NSString *maxStrDate = @"2099-01-01";
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    
//    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
//    
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
//    
//    NSDate* minDate = [dateFormatter dateFromString:minStrDate];
//    
//    NSDate* maxDate = [dateFormatter dateFromString:maxStrDate];
//    
//    datePicker.minimumDate = minDate;
//    
//    datePicker.maximumDate = maxDate;
//    
//    datePicker.date = [NSDate date];
//    
//    [datePicker setDate:maxDate animated:YES];
//    
//    [self.view addSubview:datePicker];
    
    DateAndTimePickerViewController *dateAndTimePickerViewController = [[DateAndTimePickerViewController alloc] init];
    
    [self.navigationController pushViewController:dateAndTimePickerViewController animated:YES];
    
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
        [_tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [_tableView headerEndRefreshing];
    });
}

-(void)footerRereshing{

    for (int i = 0; i<5; i++) {
        
        [_fakeData addObject:MJRandomData];
        
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [_tableView reloadData];
        
        [_tableView footerEndRefreshing];
        
    });
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _fakeData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdetify = @"tableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdetify];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdetify];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.showsReorderControl = YES;
    }
    
    cell.textLabel.text = _fakeData[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%i",indexPath.row);
    
    RecommandTeamTableView *recommandTeamTableView = [[RecommandTeamTableView alloc] init];
    
    [self.navigationController pushViewController:recommandTeamTableView animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 40.0;
    
}

-(void)setupCarInfo{
    
    SetupCarInfoViewController *setupCarInfoViewController = [[SetupCarInfoViewController alloc] init];
    
    [self.navigationController pushViewController:setupCarInfoViewController animated:YES];
    
//    MapDataViewController *mapDataViewController = [[MapDataViewController alloc] init];
//    
//    [self.navigationController pushViewController:mapDataViewController animated:YES];
    
}

-(void)showCarDetail{
    CarInfoViewController *carInfoViewController = [[CarInfoViewController alloc] init];
    
    [self.navigationController pushViewController:carInfoViewController animated:YES];
}

-(void) showActionSheet:(id)sender forEvent:(UIEvent*)event
{
    TSActionSheet *actionSheet = [[TSActionSheet alloc] initWithTitle:nil];
    [actionSheet addButtonWithTitle:@"会员信息" block:^{
        NSLog(@"pushed hoge1 button");
        
        MemberTableViewController *memberTableViewController = [[MemberTableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        [self.navigationController pushViewController:memberTableViewController animated:YES];
        
    }];
    [actionSheet addButtonWithTitle:@"相册" block:^{
        NSLog(@"pushed hoge1 button");
        
        PhotoSetViewController *photoSetViewController = [[PhotoSetViewController alloc] init];
        
        [self.navigationController pushViewController:photoSetViewController animated:YES];
        
    }];
    [actionSheet addButtonWithTitle:@"设置" block:^{
        NSLog(@"pushed hoge2 button");
    }];
    [actionSheet addButtonWithTitle:@"修改密码" block:^{
        NSLog(@"pushed hoge2 button");
    }];
    [actionSheet cancelButtonWithTitle:@"意见反馈" block:nil];
    actionSheet.cornerRadius = 5;
    
    [actionSheet showWithTouch:event];
}

-(void) showActionSheet1:(id)sender forEvent:(UIEvent*)event
{
    TSActionSheet *actionSheet = [[TSActionSheet alloc] initWithTitle:nil];
    [actionSheet destructiveButtonWithTitle:@"一键注册" block:nil];
    [actionSheet addButtonWithTitle:@"支付管理" block:^{
        NSLog(@"pushed hoge1 button");
        
        MemberTableViewController *memberTableViewController = [[MemberTableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        [self.navigationController pushViewController:memberTableViewController animated:YES];
        
    }];
    [actionSheet addButtonWithTitle:@"消费查询" block:^{
        NSLog(@"pushed hoge2 button");
    }];
    [actionSheet addButtonWithTitle:@"推荐朋友" block:^{
        NSLog(@"pushed hoge2 button");
    }];
    actionSheet.cornerRadius = 5;
    
    [actionSheet showWithTouch:event];
}

-(void)swapView:(int)id{

    if(id==1){
    
        for(UIView *view in [_meddleView subviews]){
            
            if([view isKindOfClass:[MeddleTextField class]]||[view isKindOfClass:[MeddleTextFieldTwo class]]){
                
                [view removeFromSuperview];
                
            }
            
        }
        
        MeddleTextFieldTwo *meddleTextField = [[MeddleTextFieldTwo alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 100.0)];
        
        [meddleTextField set_pushViewDelegate:self];
        
        [meddleTextField set_oneText:@"输入集装箱港口"];
        
        [meddleTextField set_twoText:@"输入大陆地区县级或地级市"];
        
        [meddleTextField setBackgroundColor:[UIColor whiteColor]];
        
        [_meddleView addSubview:meddleTextField];
        
    }else if(id==2){
        
        for(UIView *view in [_meddleView subviews]){
            
            if([view isKindOfClass:[MeddleTextField class]]||[view isKindOfClass:[MeddleTextFieldTwo class]]){
                
                [view removeFromSuperview];
                
            }
            
        }
        
        MeddleTextField *meddleTextField = [[MeddleTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 100.0)];
        
        [meddleTextField set_pushViewDelegate:self];
        
        [meddleTextField set_oneText:@"输入司机用户名"];
        
        [meddleTextField set_twoText:@"输入司机手机号"];
        
        [meddleTextField setBackgroundColor:[UIColor whiteColor]];
        
        [_meddleView addSubview:meddleTextField];
    
    }else if(id==3){
    
    }
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
