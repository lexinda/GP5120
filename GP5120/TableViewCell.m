//
//  TableViewCell.m
//  GP5120
//
//  Created by lele126 on 14-8-12.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize cellsLabel;

@synthesize cellsButton;

@synthesize treeNode;

@synthesize _memberDelegate;

@synthesize isExpanded;

@synthesize _memberDictionary;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier treeViewNode:(TreeViewNode *)treeNodeInfo
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect cellLabelFrame;
        
        if (treeNodeInfo.nodeLevel==0) {
            
            cellLabelFrame = CGRectMake(101.0, (37-20)/2, 200.0, 20.0);
            
            CGRect buttonFrame = CGRectMake(0.0, (37-11)/2, 11.0, 11.0);
            
            self.cellsButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            self.cellsButton.frame = buttonFrame;
            
            [self.cellsButton addTarget:self action:@selector(expand:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:self.cellsButton];
            
            self.cellsLabel=[[UILabel alloc] initWithFrame:cellLabelFrame];
            
            [self addSubview:self.cellsLabel];
            
        }else if(treeNodeInfo.nodeLevel==1){
            
            cellLabelFrame = CGRectMake(5.0, (70-68)/2, self.frame.size.width-10.0, 68.0);
            
            CGRect buttonFrame = CGRectMake(0.0, (37-11)/2, 11.0, 11.0);
            
            self.cellsButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            self.cellsButton.frame = buttonFrame;
            
            [self.cellsButton addTarget:self action:@selector(expand:) forControlEvents:UIControlEventTouchUpInside];
            
            //[self addSubview:self.cellButton];
            
            self.cellsLabel=[[UILabel alloc] initWithFrame:cellLabelFrame];
            
            [self addSubview:self.cellsLabel];
            
        }else if(treeNodeInfo.nodeLevel==2){
            
            if (treeNodeInfo.nodeObjectDetail!=nil) {
                
                if ([treeNodeInfo.nodeObjectType isEqualToString:@"order"]) {
                    
                    ViewReleaseInfoDriverOrder *viewReleaseInfoDriverOrder = (ViewReleaseInfoDriverOrder *)treeNodeInfo.nodeObjectDetail;
                    
                    _memberDictionary = [NSDictionary dictionaryWithObjectsAndKeys:viewReleaseInfoDriverOrder.releasePerson,@"username",viewReleaseInfoDriverOrder.infoNo,@"info_no",viewReleaseInfoDriverOrder.usr,@"deal_name", nil];
                    
                }
                
            }
            
            if ([treeNodeInfo.nodeObjectDetail isKindOfClass:[ViewReleaseInfoDriverOrder class]]||[treeNodeInfo.nodeObjectDetail isKindOfClass:[UsrInGpMemberOrder class]]) {
                
                cellLabelFrame = CGRectMake(10.0, (130-129)/2, self.frame.size.width-20.0, 88.0);
                
                CGRect buttonFrame = CGRectMake(0.0, (37-11)/2, 11.0, 11.0);
                
                self.cellsButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
                
                self.cellsButton.frame = buttonFrame;
                
                [self.cellsButton addTarget:self action:@selector(expand:) forControlEvents:UIControlEventTouchUpInside];
                
                //[self addSubview:self.cellButton];
                
                self.cellsLabel=[[UILabel alloc] initWithFrame:cellLabelFrame];
                
                UILabel *youcanlabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, self.cellsLabel.frame.origin.y+self.cellsLabel.frame.size.height, 85, 20.0)];
                
                [youcanlabel setFont: [UIFont fontWithName:@"Helvetica" size:14.0]];
                
                [youcanlabel setText:@"现在就去："];
                
                [self addSubview:youcanlabel];
                
                if ([treeNodeInfo.nodeObjectType isEqualToString:@"order"]) {
                    
                    if ([treeNodeInfo.nodeRemarkOrIsBid isEqualToString:@"2"]) {
                        
                        UIButton *oneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                        
                        [oneButton setTitle:@"已经完成，确认送达！" forState:UIControlStateNormal];
                        
                        [oneButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
                        
                        [oneButton setFrame:CGRectMake(youcanlabel.frame.origin.x+youcanlabel.frame.size.width, youcanlabel.frame.origin.y, 150.0, 20.0)];
                        
                        [self addSubview:oneButton];
                        
                        UIButton *twoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                        
                        [twoButton setTitle:@"举报对方未完成工作！" forState:UIControlStateNormal];
                        
                        [twoButton addTarget:self action:@selector(accusation) forControlEvents:UIControlEventTouchUpInside];
                        
                        [twoButton setFrame:CGRectMake(oneButton.frame.origin.x, oneButton.frame.origin.y+oneButton.frame.size.height, 150.0, 20.0)];
                        
                        [self addSubview:twoButton];
                        
                    }else if([treeNodeInfo.nodeRemarkOrIsBid isEqualToString:@"3"]){
                    
                        UIButton *oneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                        
                        [oneButton setTitle:@"确认付款！" forState:UIControlStateNormal];
                        
                        [oneButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
                        
                        [oneButton setFrame:CGRectMake(youcanlabel.frame.origin.x+youcanlabel.frame.size.width, youcanlabel.frame.origin.y, 150.0, 20.0)];
                        
                        [self addSubview:oneButton];
                        
                    }
                    
                    
                }else if([treeNodeInfo.nodeObjectType isEqualToString:@"usrOrder"]){
                    
                    if([treeNodeInfo.nodeRemarkOrIsBid isEqualToString:@"4"]){
                        
                        UIButton *oneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                        
                        [oneButton setTitle:@"双方互评！" forState:UIControlStateNormal];
                        
                        [oneButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
                        
                        [oneButton setFrame:CGRectMake(youcanlabel.frame.origin.x+youcanlabel.frame.size.width, youcanlabel.frame.origin.y, 150.0, 20.0)];
                        
                        [self addSubview:oneButton];
                        
                    }
                
                }
                
                [self addSubview:self.cellsLabel];
            
            }else{
            
                cellLabelFrame = CGRectMake(10.0, (80-79)/2, self.frame.size.width-20.0, 79.0);
                
                CGRect buttonFrame = CGRectMake(0.0, (37-11)/2, 11.0, 11.0);
                
                self.cellsButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
                
                self.cellsButton.frame = buttonFrame;
                
                [self.cellsButton addTarget:self action:@selector(expand:) forControlEvents:UIControlEventTouchUpInside];
                
                //[self addSubview:self.cellButton];
                
                self.cellsLabel=[[UILabel alloc] initWithFrame:cellLabelFrame];
                
                [self addSubview:self.cellsLabel];
                
            }
            
            
        }
        
    }
    return self;
}

-(void)confirm{

    [_memberDelegate confirm:_memberDictionary];
}

-(void)accusation{

    [_memberDelegate accusation:_memberDictionary];
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTheButtonBackgroundImage:(UIImage *)backgroundImage
{
    [self.cellsButton setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

-(void)expand:(id)sender{

    self.treeNode.isExpanded = !self.treeNode.isExpanded;
    
    [self setSelected:NO animated:YES];
    
    NSDictionary *userInfODictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%i",self.treeNode.index],@"index",[NSString stringWithFormat:@"%i",self.treeNode.nodeLevel],@"level", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ProjectTreeNodeButtonClicked" object:self userInfo:userInfODictionary];
    
}

@end
