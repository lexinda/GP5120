//
//  FindPortTableView.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "FindPortTableView.h"

@interface FindPortTableView ()

@end

@implementation FindPortTableView

@synthesize _dataArray;

@synthesize _activeIndex;

@synthesize _clickIndex;

@synthesize _page;

@synthesize _hud;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        self.title = @"找港柜";
        
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

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:YES];
    
    [self.tableView setEditing:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _activeIndex = [[NSNumber alloc] initWithInt:-1];
    
    _clickIndex = [[NSNumber alloc] initWithInt:-1];
    
    _page = 1;
    
    _dataArray = [NSMutableArray array];
    
    //去掉多余的表格分割线
    [self setExtraCellLineHidden:self.tableView];
    
    [self setupRefresh];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)setupRefresh{
    
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    [self.tableView headerBeginRefreshing];
    
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
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

- (void)headerRereshing
{
    [_dataArray removeAllObjects];
    
    _page = 1;
    
    NSDictionary *dataFlag = [NSDictionary dictionaryWithObject:@"4" forKey:@"flag"];
    
    NSDictionary *dataFlag1 = [NSDictionary dictionaryWithObject:@"" forKey:@"username"];
    
    NSDictionary *dataFlag2 = [NSDictionary dictionaryWithObject:@"1" forKey:@"page"];
    
    NSArray *dataArray = [NSArray arrayWithObjects:dataFlag,dataFlag1,dataFlag2,nil];
    
    NSString *requestStr = [self getRequestData:SERVER_URL withRequestTag:1 withDataArray:dataArray];
    
    NSArray *responseData = [requestStr componentsSeparatedByString:@"$$"];
    
    if(responseData.count>0){
        for (int i=0; i<responseData.count; i++) {
            
            if ([[responseData objectAtIndex:i] isEqualToString:@"0"]) {
                
                [self showWithLabel:@"系统出错"];
                
                // 2.2秒后刷新表格UI
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
                    [self.tableView headerEndRefreshing];
                });
                
            }else if ([[responseData objectAtIndex:i] isEqualToString:@"2"]) {
                
                [self showWithLabel:@"参数出错"];
                
                // 2.2秒后刷新表格UI
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
                    [self.tableView headerEndRefreshing];
                });
                
            }else if ([[responseData objectAtIndex:i] isEqualToString:@"3"]) {
                
                [self showWithLabel:@"暂无车队信息"];
                
                // 2.2秒后刷新表格UI
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
                    [self.tableView headerEndRefreshing];
                });
                
            }else if (![[responseData objectAtIndex:i] isEqualToString:@""]) {
                
                NSDictionary *appUserInfoData = [[responseData objectAtIndex:i] objectFromJSONString];
                
                NSArray *appUserInfoArray = [appUserInfoData objectForKey:@"APP_USER_INFO"];
                
                if(appUserInfoArray.count>0){
                    
                    for (NSDictionary *appUserInfoDictionary in appUserInfoArray) {
                        
                        AppUserInfo *appUserInfo = [[AppUserInfo alloc] getAppUserInfo:appUserInfoDictionary];
                        
                        [_dataArray addObject:appUserInfo];
                    }
                    
                }
                
                // 2.2秒后刷新表格UI
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    // 刷新表格
                    [self.tableView reloadData];
                    
                    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
                    [self.tableView headerEndRefreshing];
                });
                
            }
            
        }
    }
}

-(void)footerRereshing{
    
    if (_activeIndex.intValue!=-1) {
        
        [_dataArray removeObjectAtIndex:_activeIndex.intValue];
        
        _activeIndex = [NSNumber numberWithInt:-1];
    }
    
    _page++;
    
    _activeIndex = [[NSNumber alloc] initWithInt:-1];
    
    _clickIndex = [[NSNumber alloc] initWithInt:-1];
    
    NSDictionary *dataFlag = [NSDictionary dictionaryWithObject:@"92" forKey:@"flag"];
    
    NSDictionary *dataFlag2 = [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%i",_page] forKey:@"page"];
    
    NSArray *dataArray = [NSArray arrayWithObjects:dataFlag,dataFlag2,nil];
    
    NSString *requestStr = [self getRequestData:SERVER_URL withRequestTag:1 withDataArray:dataArray];
    
    NSArray *responseData = [requestStr componentsSeparatedByString:@"$$"];
    
    if(responseData.count>0){
        for (int i=0; i<responseData.count; i++) {
            
            if ([[responseData objectAtIndex:i] isEqualToString:@"0"]) {
                
                [self showWithLabel:@"系统出错"];
                
                // 2.2秒后刷新表格UI
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
                    [self.tableView footerEndRefreshing];
                });
                
            }else if ([[responseData objectAtIndex:i] isEqualToString:@"4"]) {
                
                [self showWithLabel:@"无集装箱信息"];
                
                // 2.2秒后刷新表格UI
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
                    [self.tableView footerEndRefreshing];
                });
                
            }else if (![[responseData objectAtIndex:i] isEqualToString:@""]) {
                
                NSDictionary *appUserInfoData = [[responseData objectAtIndex:i] objectFromJSONString];
                
                NSArray *appUserInfoArray = [appUserInfoData objectForKey:@"APP_USER_INFO"];
                
                if(appUserInfoArray.count>0){
                    
                    for (NSDictionary *appUserInfoDictionary in appUserInfoArray) {
                        
                        AppUserInfo *appUserInfo = [[AppUserInfo alloc] getAppUserInfo:appUserInfoDictionary];
                        
                        [_dataArray insertObject:appUserInfo atIndex:[_dataArray count]];
                    }
                    
                }
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [self.tableView reloadData];
                    
                    [self.tableView footerEndRefreshing];
                    
                });
                
            }
            
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%i",indexPath.row);
    
    AppUserInfo *info = (AppUserInfo *)[_dataArray objectAtIndex:indexPath.row];
    
    static NSString *reuseIdentifier = @"tableCell";
    
    if ([info.levelType isEqualToString:@"1"]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        
        //if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        //}
        
        cell.textLabel.text = info.USER_NAME;
        
        return cell;
    }else{
        
        RecommandTeam *recommandTeam = [[RecommandTeam alloc] init];
        
        [recommandTeam setAddress:[NSString stringWithFormat:@"湖北省洪山区光谷广场%i",indexPath.row]];
        
        [recommandTeam setBoxType:@"20小箱"];
        
        [recommandTeam setDate:@"2014年6月24日"];
        
        [recommandTeam setBox:@"20"];
        
        [recommandTeam setInput:@"进港"];
        
        [recommandTeam setPeople:@"小明"];
        
        [recommandTeam setRank:@"3"];
        
        [recommandTeam setCreateTime:@"2014年6月24日"];
        
        [recommandTeam setQueryTimes:@"20"];
        
        [recommandTeam setSmsTimes:@"20"];
        
        [recommandTeam setSystemTimes:@"10"];
        
        RecommandTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        
        
        
        //if (cell == nil) {
        
        cell = [[RecommandTeamCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        
        //}
        
        [cell setRecommandTeamInfo:recommandTeam];
        
        [cell setBackgroundColor:[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0]];
        
        [cell set_pushViewDelegate:self];
        
        return  cell;
        
    }
    
    
    
    // Configure the cell...
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%i",indexPath.row);
    
    NSLog(@"%i",_clickIndex.intValue);
    
    AppUserInfo *info = (AppUserInfo *)[_dataArray objectAtIndex:indexPath.row];
    
    if ([info.levelType isEqualToString:@"1"]) {
        
        NSLog(@"%i",_activeIndex.intValue);
        
        if (_activeIndex.intValue!=-1) {
            
            [_dataArray removeObjectAtIndex:_activeIndex.intValue];
            // Delete the row from the data source
            
            NSIndexPath *indexPathDelete = [NSIndexPath indexPathForRow:_activeIndex.intValue  inSection:indexPath.section];
            
            [tableView deleteRowsAtIndexPaths:@[indexPathDelete] withRowAnimation:UITableViewRowAnimationFade];
            
            _activeIndex = [NSNumber numberWithInt:-1];
            
            if (indexPath.row!=_clickIndex.intValue) {
                
                NSLog(@"%i",indexPath.row);
                
                AppUserInfo *appUserInfo = [[AppUserInfo alloc] getAppUserInfoDemo];
                
                //NSDictionary *infoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"six",@"name",@"0",@"type",nil];
                
                NSIndexPath *indexPathInsert;
                
                if (_clickIndex.intValue>indexPath.row) {
                    
                    [_dataArray insertObject:appUserInfo atIndex:indexPath.row+1];
                    
                    indexPathInsert = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
                    
                    _activeIndex = [NSNumber numberWithInt:indexPath.row+1];
                }else{
                    
                    [_dataArray insertObject:appUserInfo atIndex:indexPath.row];
                    
                    indexPathInsert = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
                    
                    _activeIndex = [NSNumber numberWithInt:indexPath.row];
                }
                
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPathInsert] withRowAnimation:UITableViewRowAnimationBottom];
                
                
            }
            
            
        }else{
            
            AppUserInfo *appUserInfo = [[AppUserInfo alloc] getAppUserInfoDemo];
            
            //NSDictionary *infoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"six",@"name",@"0",@"levelType",nil];
            
            [_dataArray insertObject:appUserInfo atIndex:indexPath.row+1];
            
            NSIndexPath *indexPathInsert = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
            
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPathInsert] withRowAnimation:UITableViewRowAnimationBottom];
            
            _activeIndex = [NSNumber numberWithInt:indexPath.row+1];
            
        }
    }
    
    _clickIndex = [NSNumber numberWithInt:indexPath.row];
    
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_dataArray removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        AppUserInfo *appUserInfo = [[AppUserInfo alloc] getAppUserInfoDemo];
        
        //NSDictionary *infoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"six",@"name",@"0",@"type",nil];
        
        [_dataArray insertObject:appUserInfo atIndex:(_dataArray.count-1)];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *info = [_dataArray objectAtIndex:indexPath.row];
    
    if ([[info objectForKey:@"type"] isEqualToString:@"1"]) {
        return UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AppUserInfo *info = (AppUserInfo *)[_dataArray objectAtIndex:indexPath.row];
    
    if ([info.levelType isEqualToString:@"1"]) {
        
        return 50.0;
        
    }else{
        
        return 150.0;
        
    }
    
}

-(void)showInfoDetailView{
    
    //    CarInfoViewController *carInfoViewController = [[CarInfoViewController alloc] init];
    
    AcceptInfoViewController *acceptInfoViewController = [[AcceptInfoViewController alloc] init];
    
    //    [self.navigationController pushViewController:carInfoViewController animated:YES];
    
    [self.navigationController pushViewController:acceptInfoViewController animated:YES];
    
}

- (void)showWithLabel:(NSString *)labelText {
    
    _hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:_hud];
    
    _hud.delegate = self;
    _hud.labelText = labelText;
    
    [_hud showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}

- (void)myTask {
    // Do something usefull in here instead of sleeping ...
    sleep(3);
}

- (void)setExtraCellLineHidden: (UITableView *)tableView{
    UIView *view =[ [UIView alloc]init];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
    [tableView setTableHeaderView:view];
}

-(void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
