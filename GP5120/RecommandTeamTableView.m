//
//  RecommandTeamTableView.m
//  GP5120
//
//  Created by lele126 on 14-8-9.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "RecommandTeamTableView.h"

@interface RecommandTeamTableView ()

@end

@implementation RecommandTeamTableView

@synthesize _dataArray;

@synthesize _activeIndex;

@synthesize _clickIndex;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    
    NSDictionary *infoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"one",@"name",@"1",@"type",nil];
    
    NSDictionary *infoDictionary1 = [NSDictionary dictionaryWithObjectsAndKeys:@"two",@"name",@"1",@"type",nil];
    
    NSDictionary *infoDictionary2 = [NSDictionary dictionaryWithObjectsAndKeys:@"three",@"name",@"1",@"type",nil];
    
    NSDictionary *infoDictionary3 = [NSDictionary dictionaryWithObjectsAndKeys:@"four",@"name",@"1",@"type",nil];
    
    NSDictionary *infoDictionary4 = [NSDictionary dictionaryWithObjectsAndKeys:@"five",@"name",@"1",@"type",nil];
    
    _dataArray = [NSMutableArray arrayWithObjects:infoDictionary,infoDictionary1,infoDictionary2,infoDictionary3,infoDictionary4, nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    NSDictionary *info = [_dataArray objectAtIndex:indexPath.row];
    
    static NSString *reuseIdentifier = @"tableCell";
    
    if ([[info objectForKey:@"type"] isEqualToString:@"1"]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
            
            cell.textLabel.text = [info objectForKey:@"name"];
        }
        
        return cell;
    }else{
        
        RecommandTeam *recommandTeam = [[RecommandTeam alloc] init];
        
        [recommandTeam setAddress:@"湖北省洪山区光谷广场"];
        
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
        
        if (cell == nil) {
            cell = [[RecommandTeamCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier withRecomandTeam:recommandTeam];
        
            [cell setBackgroundColor:[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0]];
            
            [cell set_pushViewDelegate:self];
            
        }
        
        return  cell;
        
    }
    
    
    
    // Configure the cell...
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%i",indexPath.row);
    
     NSLog(@"%i",_clickIndex.intValue);
    
    NSDictionary *info = [_dataArray objectAtIndex:indexPath.row];
            
    if ([[info objectForKey:@"type"] isEqualToString:@"1"]) {
        
         NSLog(@"%i",_activeIndex.intValue);
        
        if (_activeIndex.intValue!=-1) {
                
                [_dataArray removeObjectAtIndex:_activeIndex.intValue];
                // Delete the row from the data source
                
                NSIndexPath *indexPathDelete = [NSIndexPath indexPathForRow:_activeIndex.intValue  inSection:indexPath.section];
            
                [tableView deleteRowsAtIndexPaths:@[indexPathDelete] withRowAnimation:UITableViewRowAnimationFade];
            
            _activeIndex = [NSNumber numberWithInt:-1];
            
            if (indexPath.row!=_clickIndex.intValue) {
                
                NSLog(@"%i",indexPath.row);
                
                NSDictionary *infoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"six",@"name",@"0",@"type",nil];
                
                NSIndexPath *indexPathInsert;
                
                if (_clickIndex.intValue>indexPath.row) {
                    
                    [_dataArray insertObject:infoDictionary atIndex:indexPath.row+1];
                    
                    indexPathInsert = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
                    
                    _activeIndex = [NSNumber numberWithInt:indexPath.row+1];
                }else{
                    
                    [_dataArray insertObject:infoDictionary atIndex:indexPath.row];
                    
                    indexPathInsert = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
                    
                    _activeIndex = [NSNumber numberWithInt:indexPath.row];
                }
                
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPathInsert] withRowAnimation:UITableViewRowAnimationBottom];
                
                
            }

            
        }else{
            
            NSDictionary *infoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"six",@"name",@"0",@"type",nil];
            
            [_dataArray insertObject:infoDictionary atIndex:indexPath.row+1];
            
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
        
        NSDictionary *infoDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"six",@"name",@"0",@"type",nil];
        
        [_dataArray insertObject:infoDictionary atIndex:(_dataArray.count-1)];
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

    NSDictionary *info = [_dataArray objectAtIndex:indexPath.row];
    
    if ([[info objectForKey:@"type"] isEqualToString:@"1"]) {
        
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

@end
