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
    
    [self.view addSubview:topButtonView];
    
    MeddleTextField *meddleTextField = [[MeddleTextField alloc] initWithFrame:CGRectMake(0.0, topButtonView.frame.origin.y+topButtonView.frame.size.height+10.0, self.view.frame.size.width, 100.0)];
    
    [meddleTextField set_pushViewDelegate:self];
    
    [meddleTextField set_oneText:@"输入司机用户名"];
    
    [meddleTextField set_twoText:@"输入司机手机号"];
    
    [meddleTextField setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:meddleTextField];
    
    _fakeData = [NSMutableArray array];
    
    for (int i = 0; i<12; i++) {
        [_fakeData addObject:MJRandomData];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, meddleTextField.frame.origin.y+meddleTextField.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-meddleTextField.frame.size.height-topButtonView.frame.size.height-64-49)];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    [self setupRefresh];
    
    FootButtonView *footButtonView = [[FootButtonView alloc] initWithFrame:CGRectMake(0.0,_tableView.frame.size.height+_tableView.frame.origin.y, self.view.frame.size.width, 49)];
    
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
