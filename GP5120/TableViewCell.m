//
//  TableViewCell.m
//  GP5120
//
//  Created by lele126 on 14-8-12.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize cellLabel;

@synthesize cellButton;

@synthesize treeNode;

@synthesize isExpanded;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        CGRect cellLabelFrame = CGRectMake(101.0, (37-20)/2, 200.0, 20.0);
        
        CGRect buttonFrame = CGRectMake(0.0, (37-11)/2, 11.0, 11.0);
        
        self.cellButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        self.cellButton.frame = buttonFrame;
        
        [self.cellButton addTarget:self action:@selector(expand:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.cellButton];
        
        self.cellLabel=[[UILabel alloc] initWithFrame:cellLabelFrame];
        
        [self addSubview:self.cellLabel];
        
    }
    return self;
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
    [self.cellButton setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

-(void)expand:(id)sender{

    self.treeNode.isExpanded = !self.treeNode.isExpanded;
    
    [self setSelected:NO animated:YES];
    
    NSDictionary *userInfODictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%i",self.treeNode.index],@"index",[NSString stringWithFormat:@"%i",self.treeNode.nodeLevel],@"level", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ProjectTreeNodeButtonClicked" object:self userInfo:userInfODictionary];
    
}

@end
