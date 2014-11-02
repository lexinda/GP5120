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

@synthesize _queryOtherTime;

@synthesize _phoneArray;

@synthesize _meddleTextField;

@synthesize _meddleTextFieldTwo;

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
    
    _meddleTextField = [[MeddleTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 150.0)];
    
    [_meddleTextField set_pushViewDelegate:self];
    
    [_meddleTextField set_oneText:@"输入司机用户名"];
    
    [_meddleTextField set_twoText:@"输入司机手机号"];
    
    [_meddleTextField setBackgroundColor:[UIColor whiteColor]];
    
    [_meddleView addSubview:_meddleTextField];
    
    _meddleTextFieldTwo = [[MeddleTextFieldTwo alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 150.0)];
    
    [_meddleTextFieldTwo setHidden:YES];
    
    [_meddleTextFieldTwo set_pushViewDelegate:self];
    
    [_meddleTextFieldTwo set_oneText:@"输入集装箱港口"];
    
    [_meddleTextFieldTwo set_twoText:@"输入大陆地区县级或地级市"];
    
    [_meddleTextFieldTwo setBackgroundColor:[UIColor whiteColor]];
    
    [_meddleView addSubview:_meddleTextFieldTwo];
    
    [self setupRefresh:@"zhaogui"];

    
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
            
            cell.textLabel.text = [NSString stringWithFormat:@"[%@]%@",appUserInfo.COMPANY_TYPE,appUserInfo.PORT];
            
        }if ([object isKindOfClass:[Table class]]) {
            
            Table *tableInfo = (Table *)object;
            
            cell.textLabel.numberOfLines=0;  //可多行显示
            
            cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
            
            cell.textLabel.text = [NSString stringWithFormat:@"[%@]%@进柜急需司机，希望尽快联系",tableInfo.INFO_TYPE,tableInfo.PORT];
            
        }else if([object isKindOfClass:[AdList class]]){
        
            AdList *adList = (AdList *)object;
            cell.textLabel.numberOfLines=0;  //可多行显示
            
            cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
            
            NSString *adText = [NSString stringWithFormat:@"[活动通知]%@%@",adList.PORT,adList.AD_CONTENT];
            
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
        
        //AppUserInfo *appUserInfo = (AppUserInfo *)object;
        
        RecommandTeamTableView *recommandTeamTableView = [[RecommandTeamTableView alloc] init];
        
        [self.navigationController pushViewController:recommandTeamTableView animated:YES];
        
    }if ([object isKindOfClass:[Table class]]) {
        
        //Table *tableInfo = (Table *)object;
        
        FindPortTableView *findPortTableView = [[FindPortTableView alloc] init];
        
        [self.navigationController pushViewController:findPortTableView animated:YES];
        
    }else if([object isKindOfClass:[AdList class]]){
        
        //AdList *adList = (AdList *)object;
        
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
        
    }else if([object isKindOfClass:[Table class]]){
        
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
        
        Table *tableInfo = (Table *)object;
        
        NSString *content = [NSString stringWithFormat:@"[%@]%@进柜急需司机，希望尽快联系",tableInfo.INFO_TYPE,tableInfo.PORT];
        
        CGSize size=[content boundingRectWithSize:CGSizeMake(156, 1000)//最大限制宽和高
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:attribute
                                                    context:nil].size;
        
        return size.height+20.0;
        
    }else{
    
        return 40.0;
        
    }

    
}

-(void)showCarDetail{
    
    NSDictionary *userLoginInfo = [[ValidataLogin alloc] validataUserInfo];
    
    if (![[userLoginInfo objectForKey:@"password"] isEqualToString:@""]) {
        
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        
        NSString *username = [defaults objectForKey:@"username"];
        
        NSString *isPush = [NSString stringWithFormat:@"%@&flag=610&username=%@",SERVER_URL,username];
        
        ASIFormDataRequest *isPushForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:isPush]];
        
        [isPushForm startSynchronous];
        
        NSString *pushResult = [isPushForm responseString];
        
        if ([pushResult isEqualToString:@"0"]) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alertView show];
            
        }else if([pushResult isEqualToString:@"1"]){
            
            CarInfoViewController *carInfoViewController = [[CarInfoViewController alloc] init];
            
            [self.navigationController pushViewController:carInfoViewController animated:YES];
            
        }else if([pushResult isEqualToString:@"4"]){
            
            QueryCarInfoViewController *queryCarInfoViewController = [[QueryCarInfoViewController alloc] init];
            
            [self.navigationController pushViewController:queryCarInfoViewController animated:YES];
        
        }
        
    }else{
        
        LoginAndRegisterViewController *loginAndRegisterViewController = [[LoginAndRegisterViewController alloc] init];
        
        
        
        [self.navigationController pushViewController:loginAndRegisterViewController animated:YES];
    }
    
}

-(void) showActionSheet:(id)sender forEvent:(UIEvent*)event
{
    TSActionSheet *actionSheet = [[TSActionSheet alloc] initWithTitle:nil];
    
    [actionSheet addButtonWithTitle:@"会员信息" block:^{
        
        NSDictionary *userLoginInfo = [[ValidataLogin alloc] validataUserInfo];
        
        if (![[userLoginInfo objectForKey:@"password"] isEqualToString:@""]) {
            
            MemberTableViewController *memberTableViewController = [[MemberTableViewController alloc] initWithStyle:UITableViewStylePlain];
            
            [self.navigationController pushViewController:memberTableViewController animated:YES];
            
        }else{
            
            LoginAndRegisterViewController *loginAndRegisterViewController = [[LoginAndRegisterViewController alloc] init];
            
            
            
            [self.navigationController pushViewController:loginAndRegisterViewController animated:YES];
        }
        
    }];
    
    [actionSheet addButtonWithTitle:@"相册" block:^{
        
        NSDictionary *userLoginInfo = [[ValidataLogin alloc] validataUserInfo];
        
        if (![[userLoginInfo objectForKey:@"password"] isEqualToString:@""]) {
            
            PhotoSetViewController *photoSetViewController = [[PhotoSetViewController alloc] init];
            
            [self.navigationController pushViewController:photoSetViewController animated:YES];
            
        }else{
            
            LoginAndRegisterViewController *loginAndRegisterViewController = [[LoginAndRegisterViewController alloc] init];
            
            [self.navigationController pushViewController:loginAndRegisterViewController animated:YES];
        }
        
    }];
    
    [actionSheet addButtonWithTitle:@"设置" block:^{
        
        NSDictionary *userLoginInfo = [[ValidataLogin alloc] validataUserInfo];
        
        if (![[userLoginInfo objectForKey:@"password"] isEqualToString:@""]) {
            
            SetupUserInfoViewController *setupUserInfoViewController = [[SetupUserInfoViewController alloc] init];
            
            [self.navigationController pushViewController:setupUserInfoViewController animated:YES];
            
        }else{
            
            LoginAndRegisterViewController *loginAndRegisterViewController = [[LoginAndRegisterViewController alloc] init];
            
            [self.navigationController pushViewController:loginAndRegisterViewController animated:YES];
        }
        
    }];
    
    [actionSheet addButtonWithTitle:@"修改密码" block:^{
        
        NSDictionary *userLoginInfo = [[ValidataLogin alloc] validataUserInfo];
        
        if (![[userLoginInfo objectForKey:@"password"] isEqualToString:@""]) {
            
            ChangePasswordViewController *changePasswordViewController = [[ChangePasswordViewController alloc] init];
            
            [self.navigationController pushViewController:changePasswordViewController animated:YES];
            
        }else{
            
            LoginAndRegisterViewController *loginAndRegisterViewController = [[LoginAndRegisterViewController alloc] init];
            
            [self.navigationController pushViewController:loginAndRegisterViewController animated:YES];
        }
        
    }];
    
    [actionSheet cancelButtonWithTitle:@"意见反馈" block:^{
        
        NSDictionary *userLoginInfo = [[ValidataLogin alloc] validataUserInfo];
        
        if (![[userLoginInfo objectForKey:@"password"] isEqualToString:@""]) {
            
            FeedbackViewController *feedbackViewController = [[FeedbackViewController alloc] init];
            
            [self.navigationController pushViewController:feedbackViewController animated:YES];
            
        }else{
            
            LoginAndRegisterViewController *loginAndRegisterViewController = [[LoginAndRegisterViewController alloc] init];
            
            [self.navigationController pushViewController:loginAndRegisterViewController animated:YES];
        }
        
    }];
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
    
    for(UIView *view in [_meddleView subviews]){
            
        if([view isKindOfClass:[MeddleTextField class]]||[view isKindOfClass:[MeddleTextFieldTwo class]]){
            
            [view setHidden:YES];
            
        }
        
    }

    if(id==1){
        
        [_meddleTextFieldTwo setHidden:NO];
        
        [self setupRefresh:@"zhaogui"];
        
    }else if(id==2){
        
        [_meddleTextField setHidden:NO];
        
        [self setupRefresh:@"paiche"];
    
    }else if(id==3){
        
        ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
        
        picker.peoplePickerDelegate = self;
        
        [self presentViewController:picker animated:YES completion:^{
        
            NSLog(@"载入通讯录！");
            
        }];
        
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

-(void)loginAndRegister{

    LoginAndRegisterViewController *loginAndRegisterViewController = [[LoginAndRegisterViewController alloc] init];
    
    [self.navigationController pushViewController:loginAndRegisterViewController animated:YES];
    
}

-(void)getDatePickerViewData:(NSString *)data{

    _queryOtherTime = data;
    
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

-(void)pushCarInfoView:(HomeInfoModel *)homeInfoModel{

    if ([[homeInfoModel queryTime] isEqualToString:@"other"]) {
        if ([_queryOtherTime isEqualToString:@""]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"日期不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
            
        }else{
        
            [homeInfoModel setQueryTime:_queryOtherTime];
            
            SetupCarInfoViewController *setupCarInfoViewController = [[SetupCarInfoViewController alloc] init];
            
            [setupCarInfoViewController set_homeInfoModel:homeInfoModel];
            
            [self.navigationController pushViewController:setupCarInfoViewController animated:YES];
            
        }
    }else{
    
        SetupCarInfoViewController *setupCarInfoViewController = [[SetupCarInfoViewController alloc] init];
        
        [setupCarInfoViewController set_homeInfoModel:homeInfoModel];
        
        [self.navigationController pushViewController:setupCarInfoViewController animated:YES];
    
    }
    
}

-(void)pushPortInfoView:(HomeInfoModel *)homeInfoModel{
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    NSString *username = [defaults objectForKey:@"username"];

    if ([[homeInfoModel queryTime] isEqualToString:@"other"]) {
        if ([_queryOtherTime isEqualToString:@""]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"日期不能空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alert show];
            
        }else{
            
            [homeInfoModel setQueryTime:_queryOtherTime];
            
//            NSString *queryPortUrl = [NSString stringWithFormat:@"%@&flag=91&username=%@&port=%@&address=%@&pack_date=%@&find_type=%@",SERVER_URL,username,homeInfoModel.oneField,homeInfoModel.twoField,homeInfoModel.queryTime,homeInfoModel.portType];
            
            NSString *queryPortUrl = [NSString stringWithFormat:@"%@&flag=91&username=%@&port=青岛港&address=里叽叽叽叽&pack_date=2014-11-02&find_type=in",SERVER_URL,username];
            
            ASIFormDataRequest *queryPortForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:queryPortUrl]];
            
            [queryPortForm startSynchronous];
            
            NSLog(@"%@",[queryPortForm responseString]);
            
//            AcceptInfoViewController *acceptInfoViewController = [[AcceptInfoViewController alloc] init];
//            
//            //[acceptInfoViewController set_homeInfoModel:homeInfoModel];
//            
//            [self.navigationController pushViewController:acceptInfoViewController animated:YES];
            
        }
    }else{
        
        AcceptInfoViewController *acceptInfoViewController = [[AcceptInfoViewController alloc] init];
        
        //[acceptInfoViewController set_homeInfoModel:homeInfoModel];
        
        [self.navigationController pushViewController:acceptInfoViewController animated:YES];
        
    }
    
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker {
    
    [peoplePicker dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"退出通讯录");
        
    }];
    
}

-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person{

    _phoneArray = [[NSMutableArray alloc] init];
    
    ABMultiValueRef telRef;
    telRef = ABRecordCopyValue(person,  kABPersonPhoneProperty);
    if (ABMultiValueGetCount(telRef) > 0) {
        for (int i=0; i<ABMultiValueGetCount(telRef); i++) {
            NSString * tel = (__bridge NSString *)ABMultiValueCopyValueAtIndex(telRef, i);
            NSLog(@"电话号码：%@",[tel stringByReplacingOccurrencesOfString:@"-"withString:@""]);
            [_phoneArray addObject:[tel stringByReplacingOccurrencesOfString:@"-"withString:@""]];
        }
    }
    
    if (_phoneArray.count>0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"推荐给此朋友！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        
        [alertView setTag:1];
        
        [alertView show];
        
    }else{
    
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"号码为空请重新选择！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView setTag:2];
        
        [alertView show];
        
    }
    
    
    
//    NSString *firstName, *lastName;
//    
//    //对于地址薄中的firstName, lastName都是唯一的不会重复，故直接转化字符串
//    firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//    lastName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
//    
//    //电话是多个, 要用数组来处理
//    ABMultiValueRef telRef;
//    telRef = ABRecordCopyValue(person,  kABPersonPhoneProperty);
//    if (ABMultiValueGetCount(telRef) > 0) {
//        for (int i=0; i<ABMultiValueGetCount(telRef); i++) {
//            
//            NSString * tel = (__bridge NSString *)ABMultiValueCopyValueAtIndex(telRef, i);
//            
//            NSLog(@"电话号码：%@",tel);
//        }
//    }
//    //Email 和电话类似
//    ABMultiValueRef emailRef;
//    emailRef = ABRecordCopyValue(person, kABPersonEmailProperty);
//    if (ABMultiValueGetCount(emailRef) > 0) {
//        NSString *email = (__bridge NSString *)ABMultiValueCopyValueAtIndex(emailRef, 0);
//        NSLog(@"游戏：%@",email);
//    }
//    
//    //而相对于地址来说比较复杂。 地址信息包含信息量比较大
//    ABMultiValueRef addressRef;
//    NSDictionary *addressDic;
//    NSString *zipCode;
//    
//    addressRef = ABRecordCopyValue(person, kABPersonAddressProperty);
//    if (ABMultiValueGetCount(addressRef) > 0) {
//        addressDic = (__bridge NSDictionary *)ABMultiValueCopyValueAtIndex(addressRef, 0);
//        zipCode = [addressDic objectForKey: @"ZIP"];
//        
//    }
//    
//    //关闭模态
//    [self dismissViewControllerAnimated: YES completion: ^{
//    
//        NSLog(@"关闭通讯录！");
//        
//    }];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    NSLog(@"%i",alertView.tag);
    
    if (alertView.tag==1) {
        if (buttonIndex==0) {
            NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
            
            NSString *result = @"0";
            
            if (_phoneArray.count>0) {
                for (int i=0; i<_phoneArray.count; i++) {
                    
                    NSString *phone = [_phoneArray objectAtIndex:i];
                    
                    NSString *phoneUrl = [NSString stringWithFormat:@"%@&flag=10&username=%@&mobile=%@",SERVER_URL,[defaults objectForKey:@"username"],phone];
                    
                    ASIFormDataRequest *phoneForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:phoneUrl]];
                    
                    [phoneForm startSynchronous];
                    
                    result = [phoneForm responseString];
                    
                }
            }
            
            if ([result isEqualToString:@"0"]) {
                [self showAlert:@"推荐失败"];
            }else if ([result isEqualToString:@"1"]) {
                [self showAlert:@"推荐成功"];
            }else if ([result isEqualToString:@"2"]) {
                [self showAlert:@"参数出错"];
            }else if ([result isEqualToString:@"3"]) {
                [self showAlert:@"推荐成功，但加积分失败"];
            }
        }
    }
    
}

- (void)timerFireMethod:(NSTimer*)theTimer//弹出框
{
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert =NULL;
}


- (void)showAlert:(NSString *) _message{//时间
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:_message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:1.5f
                                     target:self
                                   selector:@selector(timerFireMethod:)
                                   userInfo:promptAlert
                                    repeats:YES];
    [promptAlert show];
}

//-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person {
//    
//    NSString *firstName, *lastName;
//    
//    //对于地址薄中的firstName, lastName都是唯一的不会重复，故直接转化字符串
//    firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//    lastName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
//    
//    //电话是多个, 要用数组来处理
//    ABMultiValueRef telRef;
//    telRef = ABRecordCopyValue(person,  kABPersonPhoneProperty);
//    if (ABMultiValueGetCount(telRef) > 0) {
//        NSString * tel = (__bridge NSString *)ABMultiValueCopyValueAtIndex(telRef, 1);
//    }
//    //Email 和电话类似
//    ABMultiValueRef emailRef;
//    emailRef = ABRecordCopyValue(person, kABPersonEmailProperty);
//    if (ABMultiValueGetCount(emailRef) > 0) {
//        NSString *email = (__bridge NSString *)ABMultiValueCopyValueAtIndex(emailRef, 0);
//    }
//    
//    //而相对于地址来说比较复杂。 地址信息包含信息量比较大
//    ABMultiValueRef addressRef;
//    NSDictionary *addressDic;
//    NSString *zipCode;
//    
//    addressRef = ABRecordCopyValue(person, kABPersonAddressProperty);
//    if (ABMultiValueGetCount(addressRef) > 0) {
//        addressDic = (__bridge NSDictionary *)ABMultiValueCopyValueAtIndex(addressRef, 0);
//        zipCode = [addressDic objectForKey: @"ZIP"];
//        
//    }
//    
//    //关闭模态
//    [self dismissViewControllerAnimated: YES completion: nil];
//    return  NO;
//}
//
//- (BOOL)peoplePickerNavigationController: (ABPeoplePickerNavigationController *)peoplePicker
//      shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
//{
//    NSString *firstName, *lastName;
//    
//    //对于地址薄中的firstName, lastName都是唯一的不会重复，故直接转化字符串
//    firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//    lastName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
//    
//    return NO;
//}

////  展示所有联系人
//- (void)getAllPerson{
//    
//    CFArrayRef allPerson = ABAddressBookCopyArrayOfAllPeople(_personPickVC.addressBook);
//    for (id person in ((__bridge NSArray *)allPerson)) {
//        
//        NSString *firstName = (__bridge NSString*)ABRecordCopyValue((__bridge ABRecordRef)person, kABPersonFirstNameProperty);
//        NSLog(@"firstName = %@",firstName);
//        
//        //  因为一个用户可能有多个电话,所以需要循环调取
//        ABMultiValueRef phones = ABRecordCopyValue((__bridge ABRecordRef)person,kABPersonPhoneProperty);
//        for (int i = 0; i < ABMultiValueGetCount(phones); i++) {
//            NSString *phone = (__bridge NSString *)(ABMultiValueCopyValueAtIndex(phones, i));
//            NSLog(@"telephone = %@",phone);
//        }
//        
//    }
//}

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
