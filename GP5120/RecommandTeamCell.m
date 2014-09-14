//
//  RecommandTeamCell.m
//  GP5120
//
//  Created by lele126 on 14-8-9.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "RecommandTeamCell.h"

#define FONT_STR [UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]

#define LABEL_HEIGHT 20.0

#define TWO_WIDTH 50.0

#define THREE_WIDTH 60.0

#define FOUR_WIDTH 75.0

#define LEFT_WIDTH 10.0

@implementation RecommandTeamCell

@synthesize _pushViewDelegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withRecomandTeam:(RecommandTeam *)_recommandTeam
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, 0.0, TWO_WIDTH, LABEL_HEIGHT)];
        [addressLabel setText:@"地址："];
        
        [addressLabel setFont:FONT_STR];
        
        [self addSubview:addressLabel];
        
        UILabel *addressInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(addressLabel.frame.origin.x+addressLabel.frame.size.width, addressLabel.frame.origin.y, 150.0, LABEL_HEIGHT)];
        
        [addressInfoLabel setFont:FONT_STR];
        
        [addressInfoLabel setText:[_recommandTeam address]];
        
        [self addSubview:addressInfoLabel];
        
        UILabel *boxTypelabel = [[UILabel alloc] initWithFrame:CGRectMake(addressInfoLabel.frame.origin.x+addressInfoLabel.frame.size.width, addressLabel.frame.origin.y, TWO_WIDTH, LABEL_HEIGHT)];
        
        [boxTypelabel setText:@"箱型："];
        
        [boxTypelabel setFont:FONT_STR];
        
        [self addSubview:boxTypelabel];
        
        UILabel *boxTypeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(boxTypelabel.frame.origin.x+boxTypelabel.frame.size.width, boxTypelabel.frame.origin.y, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [boxTypeInfoLabel setFont:FONT_STR];
        
        [boxTypeInfoLabel setText:[_recommandTeam boxType]];
        
        [self addSubview:boxTypeInfoLabel];
        
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, addressLabel.frame.origin.y+addressLabel.frame.size.height, TWO_WIDTH, LABEL_HEIGHT)];
        [dateLabel setText:@"日期："];
        
        [dateLabel setFont:FONT_STR];
        
        [self addSubview:dateLabel];
        
        UILabel *dateInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(dateLabel.frame.origin.x+dateLabel.frame.size.width, dateLabel.frame.origin.y, 150.0, LABEL_HEIGHT)];
        
        [dateInfoLabel setFont:FONT_STR];
        
        [dateInfoLabel setText:[_recommandTeam date]];
        
        [self addSubview:dateInfoLabel];
        
        UILabel *boxlabel = [[UILabel alloc] initWithFrame:CGRectMake(dateInfoLabel.frame.origin.x+dateInfoLabel.frame.size.width, dateInfoLabel.frame.origin.y, TWO_WIDTH, LABEL_HEIGHT)];
        
        [boxlabel setText:@"背箱："];
        
        [boxlabel setFont:FONT_STR];
        
        [self addSubview:boxlabel];
        
        UILabel *boxInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(boxlabel.frame.origin.x+boxlabel.frame.size.width, boxlabel.frame.origin.y, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [boxInfoLabel setFont:FONT_STR];
        
        [boxInfoLabel setText:[_recommandTeam box]];
        
        [self addSubview:boxInfoLabel];
        
        UILabel *inputLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, dateLabel.frame.origin.y+dateLabel.frame.size.height, TWO_WIDTH, LABEL_HEIGHT)];
        [inputLabel setText:@"进港："];
        
        [inputLabel setFont:FONT_STR];
        
        [self addSubview:inputLabel];
        
        UILabel *inputInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(inputLabel.frame.origin.x+inputLabel.frame.size.width, inputLabel.frame.origin.y, 150.0, LABEL_HEIGHT)];
        
        [inputInfoLabel setFont:FONT_STR];
        
        [inputInfoLabel setText:[_recommandTeam input]];
        
        [self addSubview:inputInfoLabel];
        
        UILabel *peoplelabel = [[UILabel alloc] initWithFrame:CGRectMake(inputInfoLabel.frame.origin.x+inputInfoLabel.frame.size.width, inputInfoLabel.frame.origin.y, THREE_WIDTH, LABEL_HEIGHT)];
        
        [peoplelabel setText:@"发布人："];
        
        [peoplelabel setFont:FONT_STR];
        
        [self addSubview:peoplelabel];
        
        UILabel *peopleInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(peoplelabel.frame.origin.x+peoplelabel.frame.size.width, peoplelabel.frame.origin.y, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [peopleInfoLabel setFont:FONT_STR];
        
        [peopleInfoLabel setText:[_recommandTeam people]];
        
        [self addSubview:peopleInfoLabel];
        
        UILabel *rankLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, inputLabel.frame.origin.y+inputLabel.frame.size.height, TWO_WIDTH, LABEL_HEIGHT)];
        [rankLabel setText:@"等级："];
        
        [rankLabel setFont:FONT_STR];
        
        [self addSubview:rankLabel];
        
        UILabel *rankInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(rankLabel.frame.origin.x+rankLabel.frame.size.width, rankLabel.frame.origin.y, 150.0, LABEL_HEIGHT)];
        
        [rankInfoLabel setFont:FONT_STR];
        
        [rankInfoLabel setText:[_recommandTeam rank]];
        
        [self addSubview:rankInfoLabel];
        
        UILabel *createTimelabel = [[UILabel alloc] initWithFrame:CGRectMake(rankInfoLabel.frame.origin.x+rankInfoLabel.frame.size.width-70.0, rankInfoLabel.frame.origin.y, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [createTimelabel setText:@"发布日期："];
        
        [createTimelabel setFont:FONT_STR];
        
        [self addSubview:createTimelabel];
        
        UILabel *createTimeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(createTimelabel.frame.origin.x+createTimelabel.frame.size.width, createTimelabel.frame.origin.y, 100.0, LABEL_HEIGHT)];
        
        [createTimeInfoLabel setFont:FONT_STR];
        
        [createTimeInfoLabel setText:[_recommandTeam createTime]];
        
        [self addSubview:createTimeInfoLabel];
        
        UILabel *queryTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, rankLabel.frame.origin.y+rankLabel.frame.size.height, 100.0, LABEL_HEIGHT)];
        [queryTimesLabel setText:@"被查询次数："];
        
        [queryTimesLabel setFont:FONT_STR];
        
        [self addSubview:queryTimesLabel];
        
        UILabel *queryTimesInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(queryTimesLabel.frame.origin.x+queryTimesLabel.frame.size.width, queryTimesLabel.frame.origin.y, 50.0, LABEL_HEIGHT)];
        
        [queryTimesInfoLabel setFont:FONT_STR];
        
        [queryTimesInfoLabel setTextColor:[UIColor redColor]];
        
        NSString *queryTimesStr = [NSString stringWithFormat:@"%@次",[_recommandTeam queryTimes]];
        
        [queryTimesInfoLabel setText:queryTimesStr];
        
        [self addSubview:queryTimesInfoLabel];
        
        UILabel *smsTimeslabel = [[UILabel alloc] initWithFrame:CGRectMake(queryTimesInfoLabel.frame.origin.x+queryTimesInfoLabel.frame.size.width, queryTimesInfoLabel.frame.origin.y, 120, LABEL_HEIGHT)];
        
        [smsTimeslabel setText:@"短信提醒次数："];
        
        [smsTimeslabel setFont:FONT_STR];
        
        [self addSubview:smsTimeslabel];
        
        UILabel *smsTimeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(smsTimeslabel.frame.origin.x+smsTimeslabel.frame.size.width, smsTimeslabel.frame.origin.y, 50.0, LABEL_HEIGHT)];
        
        [smsTimeInfoLabel setFont:FONT_STR];
        
        [smsTimeInfoLabel setTextColor:[UIColor redColor]];
        
        NSString *smsTimesStr = [NSString stringWithFormat:@"%@次",[_recommandTeam smsTimes]];
        
        [smsTimeInfoLabel setText:smsTimesStr];
        
        [self addSubview:smsTimeInfoLabel];
        
        UILabel *systemTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, queryTimesLabel.frame.origin.y+queryTimesLabel.frame.size.height, 120.0, LABEL_HEIGHT)];
        [systemTimesLabel setText:@"系统推送次数："];
        
        [systemTimesLabel setFont:FONT_STR];
        
        [self addSubview:systemTimesLabel];
        
        UILabel *systemTimesInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(systemTimesLabel.frame.origin.x+systemTimesLabel.frame.size.width, systemTimesLabel.frame.origin.y, 50.0, LABEL_HEIGHT)];
        
        [systemTimesInfoLabel setFont:FONT_STR];
        
        [systemTimesInfoLabel setTextColor:[UIColor redColor]];
        
        NSString *systemTimesStr = [NSString stringWithFormat:@"%@次",[_recommandTeam systemTimes]];
        
        [systemTimesInfoLabel setText:systemTimesStr];
        
        [self addSubview:systemTimesInfoLabel];
        
        
        UIButton *showInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
                                    
        [showInfoButton setBackgroundImage:[UIImage imageNamed:@"recommandcars"] forState:UIControlStateNormal];
        
        [showInfoButton setFrame:CGRectMake(self.frame.size.width-150-10, systemTimesLabel.frame.origin.y+systemTimesLabel.frame.size.height, 150, 30)];
        
        [showInfoButton addTarget:self action:@selector(showInfoView:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:showInfoButton];
        
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

-(void)showInfoView:(id)action{
    
    [_pushViewDelegate showInfoDetailView];
    
}

@end
