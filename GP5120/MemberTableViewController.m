//
//  MemberTableViewController.m
//  GP5120
//
//  Created by lele126 on 14-8-12.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "MemberTableViewController.h"

#define FONT [UIFont fontWithName:@"Helvetica" size:14.0]

@interface MemberTableViewController ()

@end

@implementation MemberTableViewController

@synthesize _displayArray;

@synthesize _nodes;

@synthesize _activeIndex;

@synthesize _clickIndex;

@synthesize _memberInfo;

@synthesize _hub;

@synthesize _appUserInfo;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        self.title=@"会员信息";
        
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _memberInfo = [[NSMutableArray alloc] init];
    
    _activeIndex = [[NSNumber alloc] initWithInt:-1];
    
    _clickIndex = [[NSNumber alloc] initWithInt:-1];
    
    [self.tableView setScrollEnabled:YES];
    
    [self setExtraCellLineHidden:self.tableView];
    
    _hub = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
    [self.navigationController.view addSubview:_hub];
    
    _hub.delegate = self;
    
    _hub.labelText = @"加载中...";
    
    [_hub showWhileExecuting:@selector(getMemberData) onTarget:self withObject:nil animated:YES];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)expandCollapseNode:(NSNotification *)notification{
    
    NSDictionary *dirctionaryInfo = (NSDictionary*)notification.userInfo;
    
    NSLog(@"当前点击第%@个单元格",[dirctionaryInfo objectForKey:@"index"]);
    
    NSLog(@"当前点击第%@层",[dirctionaryInfo objectForKey:@"level"]);
    
    [self fillDisplayArray:dirctionaryInfo];
    
    [self.tableView reloadData];
    
}

-(void)fillNodesArray{
    
    _nodes = [[NSMutableArray alloc] init];

    TreeViewNode *levelNode = [[TreeViewNode alloc] init];
    
    levelNode.nodeLevel = 0;
    
    levelNode.nodeObject = [NSString stringWithFormat:@"我收到的消息提醒"];
    
    levelNode.isExpanded = YES;
    
    levelNode.nodeChildren =[[self fillChildrenForNode] mutableCopy];
    
    levelNode.index=0;
    
    [_nodes addObject:levelNode];
    
    TreeViewNode *levelNode1 = [[TreeViewNode alloc] init];
    
    levelNode1.nodeLevel = 0;
    
    levelNode1.nodeObject = [NSString stringWithFormat:@"我发布的信息"];
    
    levelNode1.isExpanded = NO;
    
    levelNode1.nodeChildren =[[self fillChildrenForNode1] mutableCopy];
    
    levelNode1.index=1;
    
    [_nodes addObject:levelNode1];
    
    TreeViewNode *levelNode2 = [[TreeViewNode alloc] init];
    
    levelNode2.nodeLevel = 0;
    
    levelNode2.nodeObject = [NSString stringWithFormat:@"投诉和评价"];
    
    levelNode2.isExpanded = NO;
    
    levelNode2.nodeChildren =[[self fillChildrenForNode2] mutableCopy];
    
    levelNode2.index=2;
    
    [_nodes addObject:levelNode2];
    
    TreeViewNode *levelNode3 = [[TreeViewNode alloc] init];
    
    levelNode3.nodeLevel = 0;
    
    levelNode3.nodeObject = [NSString stringWithFormat:@"查看我的资料"];
    
    levelNode3.isExpanded = NO;
    
    levelNode3.nodeChildren =[[self fillChildrenForNode3] mutableCopy];
    
    levelNode3.index=3;
    
    [_nodes addObject:levelNode3];
    
}

-(NSMutableArray *)fillChildrenForNode1{
    
    NSMutableArray *childrenArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<_memberInfo.count; i++) {
        
        if ([[_memberInfo objectAtIndex:i] isKindOfClass:[Table class]]) {
            
            Table *table = (Table *)[_memberInfo objectAtIndex:i];
            
            TreeViewNode *secondLevelNode = [[TreeViewNode alloc] init];
            
            secondLevelNode.nodeLevel=1;
            
            secondLevelNode.isExpanded=NO;
            
            secondLevelNode.nodeObjectDetail = table;
            
            secondLevelNode.nodeObjectType=@"table";
            
            secondLevelNode.nodeObject = [NSString stringWithFormat:@"%@\n尊敬的%@用户，你发布的派单信息已经成功了",table.releasetime,table.CONTACT_PERSON];
            
            secondLevelNode.index=i;
            
            [childrenArray addObject:secondLevelNode];
            
        }
        
    }
    
    return childrenArray;
    
}

-(NSMutableArray *)fillChildrenForNode{
    
    NSMutableArray *childrenArrays = [[NSMutableArray alloc] init];
    
    int index=0;
    
    for (int i=0; i<_memberInfo.count; i++) {
        
        if ([[_memberInfo objectAtIndex:i] isKindOfClass:[ViewReleaseInfoDriverOrder class]]) {
            
            ViewReleaseInfoDriverOrder *order = (ViewReleaseInfoDriverOrder *)[_memberInfo objectAtIndex:i];
            
            TreeViewNode *secondLevelNode = [[TreeViewNode alloc] init];
            
            secondLevelNode.nodeLevel=1;
            
            secondLevelNode.isExpanded=NO;
            
            secondLevelNode.nodeObjectDetail=order;
            
            secondLevelNode.nodeObjectType=@"order";
            
            if ([[order.remark stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"2"]) {
                
                secondLevelNode.nodeObject = [NSString stringWithFormat:@"%@\n尊敬的%@用户，你发布的派单信息已经被%@用户成功接收",order.insertTime,order.releasePerson,order.usr];
                
                secondLevelNode.nodeRemarkOrIsBid = @"2";
                
            }else if([[order.remark stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"3"]){
                
                secondLevelNode.nodeObject = [NSString stringWithFormat:@"%@\n尊敬的%@用户，你发布的派单信息已经被%@用户成功送达",order.insertTime,order.releasePerson,order.usr];
                
                secondLevelNode.nodeRemarkOrIsBid = @"3";

            }
            
            secondLevelNode.index=index;
            
            [childrenArrays addObject:secondLevelNode];
            
        }else if([[_memberInfo objectAtIndex:i] isKindOfClass:[UsrInGpMemberOrder class]]){
            
            UsrInGpMemberOrder *usrOrder = (UsrInGpMemberOrder *)[_memberInfo objectAtIndex:i];
            
            TreeViewNode *secondLevelNode = [[TreeViewNode alloc] init];
            
            secondLevelNode.nodeLevel=1;
            
            secondLevelNode.isExpanded=NO;
            
            secondLevelNode.index=index;
            
            secondLevelNode.nodeObjectDetail = usrOrder;
            
            secondLevelNode.nodeObjectType=@"usrOrder";
            
            if ([usrOrder.isBid isEqualToString:@"1"]) {
                
                secondLevelNode.nodeObject = [NSString stringWithFormat:@"%@\n尊敬的xxx用户，你接收了新的的派单申请",usrOrder.insertTime];
                
                [childrenArrays addObject:secondLevelNode];
                
                secondLevelNode.nodeRemarkOrIsBid = @"1";
                
                
            }else if([usrOrder.isBid isEqualToString:@"4"]){
            
                secondLevelNode.nodeObject = [NSString stringWithFormat:@"%@\n尊敬的xxx用户，你接收的%@用户的派单信息对方已经确认完成了",
                                              usrOrder.insertTime,usrOrder.usr];
                
                [childrenArrays addObject:secondLevelNode];
                
                secondLevelNode.nodeRemarkOrIsBid = @"4";
                
            }
            
        }
        
        index++;
        
    }
    
    return childrenArrays;
    
}

-(NSMutableArray *)fillChildrenForNode2{
    
     NSMutableArray *childrenArray = [[NSMutableArray alloc] init];
    
    TreeViewNode *secondLevelNode = [[TreeViewNode alloc] init];
    
    secondLevelNode.nodeLevel=1;
    
    secondLevelNode.isExpanded=NO;
    
    secondLevelNode.nodeObject = [NSString stringWithFormat:@"暂无信息！"];
    
    secondLevelNode.index=0;
    
    [childrenArray addObject:secondLevelNode];
    
    return childrenArray;
    
}

-(NSMutableArray *)fillChildrenForNode3{
    
    NSMutableArray *childrenArray = [[NSMutableArray alloc] init];
    
    TreeViewNode *secondLevelNode = [[TreeViewNode alloc] init];
    
    secondLevelNode.nodeLevel=1;
    
    secondLevelNode.isExpanded=NO;
    
    secondLevelNode.nodeObject = [NSString stringWithFormat:@"MyInfo"];
    
    secondLevelNode.index=0;
    
    [childrenArray addObject:secondLevelNode];
    
    return childrenArray;
    
}

-(void)fillDisplayArray:(NSDictionary *)dirctionary{

    NSUInteger level = (NSUInteger)[dirctionary objectForKey:@"level"];
    
    NSUInteger index = (NSUInteger)[dirctionary objectForKey:@"index"];
    
    if (level==0) {
        if(index==0){
            
            
            
        }
    }
    
    _displayArray = [[NSMutableArray alloc] init];
    
    for (TreeViewNode *node in _nodes) {
        
        [_displayArray addObject:node];
        
        if (node.isExpanded) {
            
            [self fillNodeWithChildrenArray:node.nodeChildren];
            
        }
        
    }
    
}

-(void)fillNodeWithChildrenArray:(NSArray *)childrenArray{

    for (TreeViewNode *node in childrenArray) {
        
        [_displayArray addObject:node];
        
        if (node.isExpanded) {
            [self fillNodeWithChildrenArray:node.nodeChildren];
        }
        
    }
    
}

-(void)excpandAll:(id)sender{

    [self fillNodesArray];
    
    [self fillDisplayArray:nil];
    
    [self.tableView reloadData];
    
}

-(void)collapseAll:(id)sender{

    for (TreeViewNode *treeNode in _nodes) {
        
        treeNode.isExpanded = NO;
        
    }
    
    [self fillDisplayArray:nil];
    
    [self.tableView reloadData];
    
}

-(void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (_displayArray.count>0) {
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
    }
    
    return _displayArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TreeViewNode *node = [_displayArray objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"treeNodeCell";
    
    if (![node.nodeObject isEqualToString:@"MyInfo"]) {
        
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        //if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier treeViewNode:node];
        //}
        
        cell.treeNode = node;
        
        [cell.cellsLabel setFont:FONT];
        
        cell.cellsLabel.numberOfLines=0;  //可多行显示
        
        cell.cellsLabel.lineBreakMode=NSLineBreakByWordWrapping;
        
        cell.cellsLabel.text = node.nodeObject;
        
        NSLog(@"%@,%i",node.nodeObject,node.nodeLevel);
        
        cell.backgroundColor = [UIColor clearColor];
        
        [cell set_memberDelegate:self];
        
        [cell setTheButtonBackgroundImage:nil];
        
        if(cell.treeNode.nodeLevel==0){
            
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"_12"]];
            
            if (node.isExpanded) {
                
                [cell setTheButtonBackgroundImage:[UIImage imageNamed:@"close"]];
                
            }else{
                
                [cell setTheButtonBackgroundImage:[UIImage imageNamed:@"open"]];
                
            }
        }else{
            
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"releasesuccess_top"]];
            
        }
        
        return cell;
        
    }else{
    
        UserInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

        
        cell = [[UserInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier appUserInfo:_appUserInfo];
        
        return cell;
        
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    TreeViewNode *node = [_displayArray objectAtIndex:indexPath.row];
    
    if (node.nodeLevel==1) {
        
        TreeViewNode *threeLevelNode = [[TreeViewNode alloc] init];
        
        threeLevelNode.nodeLevel=2;
        
        threeLevelNode.isExpanded=NO;
        
        threeLevelNode.index=0;
        
        threeLevelNode.nodeObjectDetail = node.nodeObjectDetail;
        
        threeLevelNode.nodeObjectType = node.nodeObjectType;
        
        if ([node.nodeObjectDetail isKindOfClass:[Table class]]) {
            
            Table *table = (Table *)node.nodeObjectDetail;
            
            threeLevelNode.nodeObject = [NSString stringWithFormat:@"尊敬的%@用户，您于%@发布港口：%@,重量为：%@的派单信息已经成功发布了",table.CONTACT_PERSON,table.releasetime,table.port,table.WEIGHT];
            
            NSLog(@"%@",threeLevelNode.nodeObject);
            
        }else if([node.nodeObjectDetail isKindOfClass:[ViewReleaseInfoDriverOrder class]]){
            
            ViewReleaseInfoDriverOrder *viewReleaseInfoDriverOrder = (ViewReleaseInfoDriverOrder*)node.nodeObjectDetail;
            
            threeLevelNode.nodeObject = [NSString stringWithFormat:@"尊敬的%@用户，您于%@发布的派单信息已经被%@用户的成功接收了，请你在对方确认送到后去进行验收.",viewReleaseInfoDriverOrder.releasePerson,viewReleaseInfoDriverOrder.insertTime,viewReleaseInfoDriverOrder.usr];
            
        }else if([node.nodeObjectDetail isKindOfClass:[UsrInGpMemberOrder class]]){
        
        }
        
        NSLog(@"node%@",node.nodeObject);
        
        
        NSLog(@"%i",indexPath.row);
        
        NSLog(@"%i",_clickIndex.intValue);
        
        if (node.nodeLevel ==1) {
            
            NSLog(@"%i",_activeIndex.intValue);
            
            if (_activeIndex.intValue!=-1) {
                
                [_displayArray removeObjectAtIndex:_activeIndex.intValue];
                // Delete the row from the data source
                
                NSIndexPath *indexPathDelete = [NSIndexPath indexPathForRow:_activeIndex.intValue  inSection:indexPath.section];
                
                [tableView deleteRowsAtIndexPaths:@[indexPathDelete] withRowAnimation:UITableViewRowAnimationFade];
                
                _activeIndex = [NSNumber numberWithInt:-1];
                
                if (indexPath.row!=_clickIndex.intValue) {
                    
                    NSLog(@"%i",indexPath.row);
                    
                    //NSDictionary *infoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"six",@"name",@"0",@"type",nil];
                    
                    NSIndexPath *indexPathInsert;
                    
                    if (_clickIndex.intValue>indexPath.row) {
                        
                        [_displayArray insertObject:threeLevelNode atIndex:indexPath.row+1];
                        
                        indexPathInsert = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
                        
                        _activeIndex = [NSNumber numberWithInt:indexPath.row+1];
                    }else{
                        
                        [_displayArray insertObject:threeLevelNode atIndex:indexPath.row];
                        
                        indexPathInsert = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
                        
                        _activeIndex = [NSNumber numberWithInt:indexPath.row];
                    }
                    
                    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPathInsert] withRowAnimation:UITableViewRowAnimationBottom];
                    
                    
                }
                
                
            }else{
                
                //NSDictionary *infoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"six",@"name",@"0",@"levelType",nil];
                
                [_displayArray insertObject:threeLevelNode atIndex:indexPath.row+1];
                
                NSIndexPath *indexPathInsert = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
                
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPathInsert] withRowAnimation:UITableViewRowAnimationBottom];
                
                _activeIndex = [NSNumber numberWithInt:indexPath.row+1];
                
            }
        }
        
        _clickIndex = [NSNumber numberWithInt:indexPath.row];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    TreeViewNode *node = [_displayArray objectAtIndex:indexPath.row];
    
    if (node.nodeLevel==0) {
        
        return 37;
        
    }else if(node.nodeLevel==1){
    
        if ([node.nodeObject isEqualToString:@"MyInfo"]) {
            
            return 230.0;
            
        }else{
            
            return 70;
            
        }
        
    }else{
        if ([node.nodeObjectDetail isKindOfClass:[ViewReleaseInfoDriverOrder class]]||[node.nodeObjectDetail isKindOfClass:[UsrInGpMemberOrder class]]) {
            
            return 130;
            
        }else{
        
            return 80;
            
        }
    }
    
}

- (void)setExtraCellLineHidden: (UITableView *)tableView{
    
    UIView *view =[ [UIView alloc]init];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
    [tableView setTableHeaderView:view];
}

-(NSString *)getMemberData{
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    NSString *username = [defaults objectForKey:@"username"];
    
    NSString *requestData = [NSString stringWithFormat:@"%@&flag=11&username=%@",SERVER_URL,username];

    ASIFormDataRequest *requestForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:requestData]];
    
    [requestForm startSynchronous];
    
    
    NSString *responseStr=[requestForm responseString];
    
    NSLog(@"%@",responseStr);
    
    NSArray *responseData = [responseStr componentsSeparatedByString:@"$$"];
    
    if(responseData.count>0){
        for (int i=0; i<responseData.count; i++) {
            
            if (i==0) {
                
                NSString *strData = [responseData objectAtIndex:i];
                
                if(![strData isEqualToString:@"3"]){
                    
                    NSDictionary *tableData = [strData objectFromJSONString];
                    
                    NSArray *tableArray = [tableData objectForKey:@"Table"];
                    
                    if(tableArray.count>0){
                        
                        for (NSDictionary *tableDictionary in tableArray) {
                            
                            Table *tableInfo = [[Table alloc] getTableInfo:tableDictionary];
                            
                            [_memberInfo addObject:tableInfo];
                        }
                        
                    }
                
                }
                
            }else if(i==1){
                
                NSString *strData = [responseData objectAtIndex:i];
                
                if (![strData isEqualToString:@"5"]) {
                    
                    NSDictionary *orderData = [[responseData objectAtIndex:i] objectFromJSONString];
                    
                    NSArray *orderArray = [orderData objectForKey:@"VIEW_RELEASE_INFO_DRIVER_ORDER"];
                    
                    if (orderArray.count>0) {
                        
                        for (NSDictionary *adListDictionary in orderArray) {
                            
                            ViewReleaseInfoDriverOrder *viewReleaseInfoDriverOrder = [[ViewReleaseInfoDriverOrder alloc] getViewReleaseInfoDriverOrder:adListDictionary];
                            
                            [_memberInfo addObject:viewReleaseInfoDriverOrder];
                            
                        }
                        
                    }
                    
                }
                
            }
            else if(i==2){
                
                NSString *strData = [responseData objectAtIndex:i];
                
                if (![strData isEqualToString:@"5"]) {
                    
                    NSDictionary *orderData = [[responseData objectAtIndex:i] objectFromJSONString];
                    
                    NSArray *orderArray = [orderData objectForKey:@"VIEW_RELEASE_INFO_DRIVER_ORDER"];
                    
                    if (orderArray.count>0) {
                        
                        for (NSDictionary *adListDictionary in orderArray) {
                            
                            ViewReleaseInfoDriverOrder *viewReleaseInfoDriverOrder = [[ViewReleaseInfoDriverOrder alloc] getViewReleaseInfoDriverOrder:adListDictionary];
                            
                            [_memberInfo addObject:viewReleaseInfoDriverOrder];
                            
                        }
                        
                    }
                    
                }
                
            }
            else if(i==3){
                
                NSString *usrOrder = [responseData objectAtIndex:i];
                
                NSDictionary *listData = [usrOrder objectFromJSONString];
                
                NSArray *listArray = [listData objectForKey:@"USR_IN_GP_MEMBER_ORDER"];
                
                if (listArray.count>0) {
                    
                    for (NSDictionary *dictionary in listArray) {
                        
                        UsrInGpMemberOrder *usrInGpMemberOrder = [[UsrInGpMemberOrder alloc] getUsrInGpMemberOrder:dictionary];
                        
                        [_memberInfo addObject:usrInGpMemberOrder];
                        
                    }
                    
                }
                
            }
        }
    }
    
    NSString *requestUserData = [NSString stringWithFormat:@"%@&flag=21&username=%@",SERVER_URL,username];
    
    ASIFormDataRequest *requestUserForm = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:requestUserData]];
    
    [requestUserForm startSynchronous];
    
    
    NSString *responseUserStr=[requestUserForm responseString];
    
    NSLog(@"%@",responseUserStr);
    
    NSDictionary *userData = [responseUserStr objectFromJSONString];//USER_INFO
    
    NSLog(@"%@",userData);
    
    NSArray *userInfoData = [userData objectForKey:@"USER_INFO"];
    
    _appUserInfo = nil;
    
    for (NSDictionary *dictionary in userInfoData) {
        
        _appUserInfo = [[AppUserInfo alloc] getAppUserInfo:dictionary];
        
    }
    
     NSLog(@"%@",userInfoData);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(expandCollapseNode:) name:@"ProjectTreeNodeButtonClicked" object:nil];
    
    [self fillNodesArray];
    
    [self fillDisplayArray:nil];
    
    [self.tableView reloadData];
    
    //sleep(3);

    return responseStr;
    
}

-(void)confirm:(NSDictionary *)dictionary{
    
    NSString *confirmUrl = [NSString stringWithFormat:@"%@&flag=13&username=%@&info_no=%@&deal_name=%@",SERVER_URL,[dictionary objectForKey:@"username"],[dictionary objectForKey:@"info_no"],[dictionary objectForKey:@"deal_name"]];
    
    NSLog(@"%@",confirmUrl);
    
    ASIFormDataRequest *confirmRequest = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:confirmUrl]];
    
    [confirmRequest startSynchronous];
    
    NSString *responseStr = [confirmRequest responseString];
    
    if ([responseStr isEqualToString:@"0"]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"系统错误！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
        
    }else if ([responseStr isEqualToString:@"1"]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"成功确认！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
        
    }else{
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"参数错误！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
    
    }

}

-(void)accusation:(NSDictionary *)dictionary{

    NSString *confirmUrl = [NSString stringWithFormat:@"%@&flag=15&username=%@&info_no=%@&deal_name=%@",SERVER_URL,[dictionary objectForKey:@"username"],[dictionary objectForKey:@"info_no"],[dictionary objectForKey:@"deal_name"]];
    
    NSLog(@"%@",confirmUrl);
    
    ASIFormDataRequest *confirmRequest = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:confirmUrl]];
    
    [confirmRequest startSynchronous];
    
    NSString *responseStr = [confirmRequest responseString];
    
    if ([responseStr isEqualToString:@"3"]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"系统错误！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
        
    }else if ([responseStr isEqualToString:@"1"]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"成功确认！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
        
    }else if ([responseStr isEqualToString:@"4"]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有该登录用户！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
        
    }else{
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"参数错误！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
        
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

        _hub = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
        [self.navigationController.view addSubview:_hub];
    
        _hub.delegate = self;
    
        _hub.labelText = @"加载中...";
    
        [_hub showWhileExecuting:@selector(reloadTableView) onTarget:self withObject:nil animated:YES];
    
}

-(void)reloadTableView{
    
    _activeIndex = [[NSNumber alloc] initWithInt:-1];
    
    _clickIndex = [[NSNumber alloc] initWithInt:-1];
    
    TreeViewNode *treeNode = [_displayArray objectAtIndex:0];
    
    NSDictionary *userInfODictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%i",treeNode.index],@"index",[NSString stringWithFormat:@"%i",treeNode.nodeLevel],@"level", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ProjectTreeNodeButtonClicked" object:self userInfo:userInfODictionary];
                                                                        
};

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;ß
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
