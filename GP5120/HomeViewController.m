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

@synthesize _datePicker;

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
    
    MeddleTextField *meddleTextField = [[MeddleTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 150.0)];
    
    [meddleTextField set_pushViewDelegate:self];
    
    [meddleTextField set_oneText:@"输入司机用户名"];
    
    [meddleTextField set_twoText:@"输入司机手机号"];
    
    [meddleTextField setBackgroundColor:[UIColor whiteColor]];
    
    [_meddleView addSubview:meddleTextField];
    
    _fakeData = [NSMutableArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, _meddleView.frame.origin.y+100.0, self.view.frame.size.width, _meddleView.frame.size.height-150.0)];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [_meddleView addSubview:_tableView];
    
    [self.view addSubview:_meddleView];
    
    [self setupRefresh:@"paiche"];
    
    FootButtonView *footButtonView = [[FootButtonView alloc] initWithFrame:CGRectMake(0.0,_meddleView.frame.size.height+_meddleView.frame.origin.y, self.view.frame.size.width, 49)];
    
    [self.view addSubview:footButtonView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupRefresh:(NSString *)type{
    
    if ([type isEqualToString:@"paiche"]) {
        
        [_tableView addHeaderWithTarget:self action:@selector(paicheHeaderRereshing)];
        
        [_tableView headerBeginRefreshing];
        
    }else{
        
        [_tableView addHeaderWithTarget:self action:@selector(zhaoguiHeaderRereshing)];
        
        [_tableView headerBeginRefreshing];
    
    }

    //[_tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
}

-(void)showDataPicker{
    
    BOOL isHave=NO;
    
    for (UIView *view in [self.view subviews]){
    
        if ([_datePicker isKindOfClass:view.class]) {
            isHave=YES;
        }
        
    }
    
    if (isHave) {
        _datePicker.hidden=NO;
        [_datePicker setNeedsDisplay];
    }else{
    
        _datePicker = [[DatePickerView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-240+24, self.view.frame.size.width,240)];
        
        [_datePicker setBackgroundColor:[UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0]];
        
        _datePicker.delegateView = self;
        
        [self.view addSubview:_datePicker];
    }
    
}

-(NSString *)getRequestData:(NSString *)serverUrl
             withRequestTag:(int) tag withDataArray:(NSArray *) dataArray{
    
    NSMutableString *reqeustData = [[NSMutableString alloc] init];
    
    [reqeustData appendString:[NSString stringWithFormat:@"%@",serverUrl]];
    
    for (NSDictionary *data in dataArray) {
        
        NSArray *keys = [data allKeys];
        
        int count = [keys count];
        
        int i = 0;
        
        NSString *key,*value;
        
        for (i = 0; i < count; i++)
        {
            key = [keys objectAtIndex: i];
            
            value = [data objectForKey: key];
            
            //设置需要POST的数据，这里提交两个数据，A=a&B=b
            //[requestForm setPostValue:@"a" forKey:@"A"];
            
            [reqeustData appendString:[NSString stringWithFormat:@"&%@=%@",key,value]];
        }
        
    }
    
     NSLog (@"serverUrlAndparam:%@", reqeustData);
    
    ASIFormDataRequest *requestForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:reqeustData]];
    
    [requestForm startSynchronous];
    
    
    NSString *str=[requestForm responseString];
    //解决乱码问题
//    const char *c=[str cStringUsingEncoding:NSISOLatin1StringEncoding];
//    
//    NSString *newString = [[NSString alloc] initWithCString:c encoding:NSUTF8StringEncoding];
    
    //输入返回的信息
    NSLog(@"response\n%@",str);

    return str;

}

- (void)zhaoguiHeaderRereshing
{
    [_fakeData removeAllObjects];
    
    NSDictionary *dataFlag = [NSDictionary dictionaryWithObject:@"8" forKey:@"flag"];
        
    NSArray *dataArray = [NSArray arrayWithObject:dataFlag];
        
    NSString *requestStr = [self getRequestData:SERVER_URL withRequestTag:1 withDataArray:dataArray];
    
    NSArray *responseData = [requestStr componentsSeparatedByString:@"$$"];
    
    if(responseData.count>0){
        for (int i=0; i<responseData.count; i++) {
            
            if (i==0) {
                
                NSDictionary *tableData = [[responseData objectAtIndex:i] objectFromJSONString];
                
                NSArray *tableArray = [tableData objectForKey:@"Table"];
                
                if(tableArray.count>0){
                    
                    for (NSDictionary *tableDictionary in tableArray) {
                        
                        Table *tableInfo = [[Table alloc] getTableInfo:tableDictionary];
                        
                        [_fakeData addObject:tableInfo];
                    }
                    
                }
                
            }else if(i==1){
                
                NSDictionary *adListData = [[responseData objectAtIndex:i] objectFromJSONString];
                
                NSArray *adListArray = [adListData objectForKey:@"AD_LIST"];
                
                if (adListArray.count>0) {
                    
                    for (NSDictionary *adListDictionary in adListArray) {
                        
                        AdList *adList = [[AdList alloc] getAdList:adListDictionary];
                        
                        [_fakeData addObject:adList];
                        
                    }
                    
                }
               
            }
        }
    }
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [_tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [_tableView headerEndRefreshing];
    });
}

- (void)paicheHeaderRereshing
{
    [_fakeData removeAllObjects];
    
    NSDictionary *dataFlag = [NSDictionary dictionaryWithObject:@"1" forKey:@"flag"];
    
    NSArray *dataArray = [NSArray arrayWithObject:dataFlag];
    
    NSString *requestStr = [self getRequestData:SERVER_URL withRequestTag:1 withDataArray:dataArray];
    
    NSArray *responseData = [requestStr componentsSeparatedByString:@"$$"];
    
    if(responseData.count>0){
        for (int i=0; i<responseData.count; i++) {
            
            if (i==0) {
                
                NSDictionary *appUserInfoData = [[responseData objectAtIndex:i] objectFromJSONString];
                
                NSArray *appUserInfoArray = [appUserInfoData objectForKey:@"APP_USER_INFO"];
                
                if(appUserInfoArray.count>0){
                    
                    for (NSDictionary *appUserInfoDictionary in appUserInfoArray) {
                        
                        AppUserInfo *appUserInfo = [[AppUserInfo alloc] getAppUserInfo:appUserInfoDictionary];
                        
                        [_fakeData addObject:appUserInfo];
                    }
                    
                }
                
            }else if(i==1){
                
                NSDictionary *adListData = [[responseData objectAtIndex:i] objectFromJSONString];
                
                NSArray *adListArray = [adListData objectForKey:@"AD_LIST"];
                
                if (adListArray.count>0) {
                    
                    for (NSDictionary *adListDictionary in adListArray) {
                        
                        AdList *adList = [[AdList alloc] getAdList:adListDictionary];
                        
                        [_fakeData addObject:adList];
                        
                    }
                    
                }
                
            }
        }
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
    
    for (int i=0; i<_fakeData.count; i++) {
        
        NSObject *object = [_fakeData objectAtIndex:indexPath.row];
        
        if ([object isKindOfClass:[AppUserInfo class]]) {
            
            AppUserInfo *appUserInfo = (AppUserInfo *)object;
            
            cell.textLabel.text = [NSString stringWithFormat:@"[派车]%@",appUserInfo.USER_COMPANY_NAME];
            
        }if ([object isKindOfClass:[Table class]]) {
            
            Table *tableInfo = (Table *)object;
            
            cell.textLabel.text = [NSString stringWithFormat:@"[%@]%@",tableInfo.TRAFFIC_TYPE,tableInfo.USER_COMPANY_NAME];
            
        }else if([object isKindOfClass:[AdList class]]){
        
            AdList *adList = (AdList *)object;
            cell.textLabel.numberOfLines=0;  //可多行显示
            
            cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
            
            NSString *adText = [NSString stringWithFormat:@"[活动通知]%@",adList.AD_CONTENT];
            
            cell.textLabel.text = [adText stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n"];
            
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%i",indexPath.row);
    
    NSObject *object = [_fakeData objectAtIndex:indexPath.row];
    
    if ([object isKindOfClass:[AppUserInfo class]]) {
        
        AppUserInfo *appUserInfo = (AppUserInfo *)object;
        
        RecommandTeamTableView *recommandTeamTableView = [[RecommandTeamTableView alloc] init];
        
        [self.navigationController pushViewController:recommandTeamTableView animated:YES];
        
    }if ([object isKindOfClass:[Table class]]) {
        
        Table *tableInfo = (Table *)object;
        
        FindPortTableView *findPortTableView = [[FindPortTableView alloc] init];
        
        [self.navigationController pushViewController:findPortTableView animated:YES];
        
    }else if([object isKindOfClass:[AdList class]]){
        
        AdList *adList = (AdList *)object;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
    NSLog(@"%i",indexPath.row);
    
    NSObject *object = [_fakeData objectAtIndex:indexPath.row];
    
    if([object isKindOfClass:[AdList class]]){
        
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
        
        AdList *adList = (AdList *)object;
        
        CGSize size=[adList.AD_CONTENT boundingRectWithSize:CGSizeMake(156, 1000)//最大限制宽和高
                                                              options:NSStringDrawingUsesLineFragmentOrigin
                                                           attributes:attribute
                                                              context:nil].size;
        
        return size.height+20.0;
        
    }else{
    
        return 40.0;
        
    }

    
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
        
        [self setupRefresh:@"zhaogui"];
        
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
        
        [self setupRefresh:@"paiche"];
    
    }else if(id==3){
    
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    if (![_datePicker isExclusiveTouch]) {
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
                              _datePicker.hidden = YES;
                             
                         }
                         completion:^(BOOL finished){
                             
                             
                         }];
    }
}

-(void)getDatePickerViewData:(NSString *)data{

    NSLog(@"%@",data);
    
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                       _datePicker.hidden = YES;
                         
                     }
                     completion:^(BOOL finished){
                         
                         
                     }];
    
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
