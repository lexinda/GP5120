//
//  MemberTableViewController.m
//  GP5120
//
//  Created by lele126 on 14-8-12.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "MemberTableViewController.h"

@interface MemberTableViewController ()

@end

@implementation MemberTableViewController

@synthesize _displayArray;

@synthesize _nodes;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView setScrollEnabled:NO];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(expandCollapseNode:) name:@"ProjectTreeNodeButtonClicked" object:nil];
    
    [self fillNodesArray];
    
    [self fillDisplayArray:nil];
    
    [self.tableView reloadData];
    
    
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

    TreeViewNode *levelNode = [[TreeViewNode alloc] init];
    
    levelNode.nodeLevel = 0;
    
    levelNode.nodeObject = [NSString stringWithFormat:@"我收到的消息提醒"];
    
    levelNode.isExpanded = YES;
    
    levelNode.nodeChildren =[[self fillChildrenForNode] mutableCopy];
    
    levelNode.index=0;
    
    TreeViewNode *levelNode1 = [[TreeViewNode alloc] init];
    
    levelNode1.nodeLevel = 0;
    
    levelNode1.nodeObject = [NSString stringWithFormat:@"我发布的信息"];
    
    levelNode1.isExpanded = NO;
    
    levelNode1.nodeChildren =[[self fillChildrenForNode1] mutableCopy];
    
    levelNode1.index=1;
    
    TreeViewNode *levelNode2 = [[TreeViewNode alloc] init];
    
    levelNode2.nodeLevel = 0;
    
    levelNode2.nodeObject = [NSString stringWithFormat:@"投诉和评价"];
    
    levelNode2.isExpanded = NO;
    
    levelNode2.nodeChildren =[[self fillChildrenForNode2] mutableCopy];
    
    levelNode2.index=2;
    
    TreeViewNode *levelNode3 = [[TreeViewNode alloc] init];
    
    levelNode3.nodeLevel = 0;
    
    levelNode3.nodeObject = [NSString stringWithFormat:@"查看我的资料"];
    
    levelNode3.isExpanded = NO;
    
    levelNode3.nodeChildren =[[self fillChildrenForNode3] mutableCopy];
    
    levelNode3.index=3;
    
    _nodes = [NSMutableArray arrayWithObjects:levelNode,levelNode1,levelNode2,levelNode3, nil];
    
}

-(NSArray *)fillChildrenForNode{

    TreeViewNode *secondLevelNode = [[TreeViewNode alloc] init];
    
    secondLevelNode.nodeLevel=1;
    
    secondLevelNode.isExpanded=NO;
    
    secondLevelNode.nodeObject = [NSString stringWithFormat:@"second"];
    
    secondLevelNode.index=0;
    
    TreeViewNode *secondLevelNode1 = [[TreeViewNode alloc] init];
    
    secondLevelNode1.nodeLevel=1;
    
    secondLevelNode1.isExpanded=NO;
    
    secondLevelNode1.nodeObject = [NSString stringWithFormat:@"three"];
    
    secondLevelNode1.index=1;
    
    TreeViewNode *secondLevelNode2 = [[TreeViewNode alloc] init];
    
    secondLevelNode2.nodeLevel=1;
    
    secondLevelNode2.isExpanded=NO;
    
    secondLevelNode2.nodeObject = [NSString stringWithFormat:@"four"];
    
    secondLevelNode2.index=2;
    
    NSArray *childrenArray = [NSArray arrayWithObjects:secondLevelNode,secondLevelNode1,secondLevelNode2, nil];
    
    return childrenArray;
    
}

-(NSArray *)fillChildrenForNode1{
    
    TreeViewNode *secondLevelNode = [[TreeViewNode alloc] init];
    
    secondLevelNode.nodeLevel=1;
    
    secondLevelNode.isExpanded=NO;
    
    secondLevelNode.nodeObject = [NSString stringWithFormat:@"second"];
    
    secondLevelNode.index=0;
    
    NSArray *childrenArray = [NSArray arrayWithObjects:secondLevelNode, nil];
    
    return childrenArray;
    
}

-(NSArray *)fillChildrenForNode2{
    
    TreeViewNode *secondLevelNode = [[TreeViewNode alloc] init];
    
    secondLevelNode.nodeLevel=1;
    
    secondLevelNode.isExpanded=NO;
    
    secondLevelNode.nodeObject = [NSString stringWithFormat:@"second"];
    
    secondLevelNode.index=0;
    
    NSArray *childrenArray = [NSArray arrayWithObjects:secondLevelNode, nil];
    
    return childrenArray;
    
}

-(NSArray *)fillChildrenForNode3{
    
    TreeViewNode *secondLevelNode = [[TreeViewNode alloc] init];
    
    secondLevelNode.nodeLevel=1;
    
    secondLevelNode.isExpanded=NO;
    
    secondLevelNode.nodeObject = [NSString stringWithFormat:@"second"];
    
    secondLevelNode.index=0;
    
    NSArray *childrenArray = [NSArray arrayWithObjects:secondLevelNode, nil];
    
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
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    
    return _displayArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TreeViewNode *node = [_displayArray objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"treeNodeCell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.treeNode = node;
    
    cell.cellLabel.text = node.nodeObject;
    
    NSLog(@"%@,%i",node.nodeObject,node.nodeLevel);
    
    cell.backgroundColor = [UIColor clearColor];
    
    [cell setTheButtonBackgroundImage:nil];
    
    if(cell.treeNode.nodeLevel==0){
        
        cell.backgroundColor = [UIColor redColor];
        
        if (node.isExpanded) {
            
            [cell setTheButtonBackgroundImage:[UIImage imageNamed:@"close"]];
            
        }else{
            
            [cell setTheButtonBackgroundImage:[UIImage imageNamed:@"open"]];
            
        }
    }else{
        
        cell.backgroundColor = [UIColor grayColor];
        
    }
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
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
