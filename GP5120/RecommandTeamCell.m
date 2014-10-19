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

@synthesize _addressLabel;

@synthesize _addressInfoLabel;

@synthesize _boxTypelabel;

@synthesize _boxTypeInfoLabel;

@synthesize _dateLabel;

@synthesize _dateInfoLabel;

@synthesize _boxlabel;

@synthesize _boxInfoLabel;

@synthesize _inputLabel;

@synthesize _inputInfoLabel;

@synthesize _peoplelabel;

@synthesize _peopleInfoLabel;

@synthesize _rankLabel;

@synthesize _rankInfoLabel;

@synthesize _createTimelabel;

@synthesize _createTimeInfoLabel;

@synthesize _queryTimesLabel;

@synthesize _queryTimesInfoLabel;

@synthesize _smsTimeslabel;

@synthesize _smsTimeInfoLabel;

@synthesize _systemTimesLabel;

@synthesize _systemTimesInfoLabel;

@synthesize _pushViewDelegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, 0.0, TWO_WIDTH, LABEL_HEIGHT)];
        [_addressLabel setText:@"地址："];
        
        [_addressLabel setFont:FONT_STR];
        
        [self addSubview:_addressLabel];
        
        _addressInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_addressLabel.frame.origin.x+_addressLabel.frame.size.width, _addressLabel.frame.origin.y, 150.0, LABEL_HEIGHT)];
        
        [_addressInfoLabel setFont:FONT_STR];
        
        [self addSubview:_addressInfoLabel];
        
        _boxTypelabel = [[UILabel alloc] initWithFrame:CGRectMake(_addressInfoLabel.frame.origin.x+_addressInfoLabel.frame.size.width, _addressLabel.frame.origin.y, TWO_WIDTH, LABEL_HEIGHT)];
        
        [_boxTypelabel setText:@"箱型："];
        
        [_boxTypelabel setFont:FONT_STR];
        
        [self addSubview:_boxTypelabel];
        
        _boxTypeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_boxTypelabel.frame.origin.x+_boxTypelabel.frame.size.width, _boxTypelabel.frame.origin.y, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [_boxTypeInfoLabel setFont:FONT_STR];
        
        [self addSubview:_boxTypeInfoLabel];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _addressLabel.frame.origin.y+_addressLabel.frame.size.height, TWO_WIDTH, LABEL_HEIGHT)];
        [_dateLabel setText:@"日期："];
        
        [_dateLabel setFont:FONT_STR];
        
        [self addSubview:_dateLabel];
        
        _dateInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_dateLabel.frame.origin.x+_dateLabel.frame.size.width, _dateLabel.frame.origin.y, 150.0, LABEL_HEIGHT)];
        
        [_dateInfoLabel setFont:FONT_STR];
        
        [self addSubview:_dateInfoLabel];
        
        _boxlabel = [[UILabel alloc] initWithFrame:CGRectMake(_dateInfoLabel.frame.origin.x+_dateInfoLabel.frame.size.width, _dateInfoLabel.frame.origin.y, TWO_WIDTH, LABEL_HEIGHT)];
        
        [_boxlabel setText:@"背箱："];
        
        [_boxlabel setFont:FONT_STR];
        
        [self addSubview:_boxlabel];
        
        _boxInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_boxlabel.frame.origin.x+_boxlabel.frame.size.width, _boxlabel.frame.origin.y, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [_boxInfoLabel setFont:FONT_STR];
        
        [self addSubview:_boxInfoLabel];
        
        _inputLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _dateLabel.frame.origin.y+_dateLabel.frame.size.height, TWO_WIDTH, LABEL_HEIGHT)];
        [_inputLabel setText:@"进港："];
        
        [_inputLabel setFont:FONT_STR];
        
        [self addSubview:_inputLabel];
        
        _inputInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_inputLabel.frame.origin.x+_inputLabel.frame.size.width, _inputLabel.frame.origin.y, 150.0, LABEL_HEIGHT)];
        
        [_inputInfoLabel setFont:FONT_STR];
        
        [self addSubview:_inputInfoLabel];
        
        _peoplelabel = [[UILabel alloc] initWithFrame:CGRectMake(_inputInfoLabel.frame.origin.x+_inputInfoLabel.frame.size.width, _inputInfoLabel.frame.origin.y, THREE_WIDTH, LABEL_HEIGHT)];
        
        [_peoplelabel setText:@"发布人："];
        
        [_peoplelabel setFont:FONT_STR];
        
        [self addSubview:_peoplelabel];
        
        _peopleInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_peoplelabel.frame.origin.x+_peoplelabel.frame.size.width, _peoplelabel.frame.origin.y, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [_peopleInfoLabel setFont:FONT_STR];
        
        [self addSubview:_peopleInfoLabel];
        
        _rankLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _inputLabel.frame.origin.y+_inputLabel.frame.size.height, TWO_WIDTH, LABEL_HEIGHT)];
        [_rankLabel setText:@"等级："];
        
        [_rankLabel setFont:FONT_STR];
        
        [self addSubview:_rankLabel];
        
        _rankInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_rankLabel.frame.origin.x+_rankLabel.frame.size.width, _rankLabel.frame.origin.y, 150.0, LABEL_HEIGHT)];
        
        [_rankInfoLabel setFont:FONT_STR];
        
        [self addSubview:_rankInfoLabel];
        
        _createTimelabel = [[UILabel alloc] initWithFrame:CGRectMake(_rankInfoLabel.frame.origin.x+_rankInfoLabel.frame.size.width-70.0, _rankInfoLabel.frame.origin.y, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [_createTimelabel setText:@"发布日期："];
        
        [_createTimelabel setFont:FONT_STR];
        
        [self addSubview:_createTimelabel];
        
        _createTimeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_createTimelabel.frame.origin.x+_createTimelabel.frame.size.width, _createTimelabel.frame.origin.y, 100.0, LABEL_HEIGHT)];
        
        [_createTimeInfoLabel setFont:FONT_STR];
        
        [self addSubview:_createTimeInfoLabel];
        
        _queryTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _rankLabel.frame.origin.y+_rankLabel.frame.size.height, 100.0, LABEL_HEIGHT)];
        [_queryTimesLabel setText:@"被查询次数："];
        
        [_queryTimesLabel setFont:FONT_STR];
        
        [self addSubview:_queryTimesLabel];
        
        _queryTimesInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_queryTimesLabel.frame.origin.x+_queryTimesLabel.frame.size.width, _queryTimesLabel.frame.origin.y, 50.0, LABEL_HEIGHT)];
        
        [_queryTimesInfoLabel setFont:FONT_STR];
        
        [_queryTimesInfoLabel setTextColor:[UIColor redColor]];
        
        [self addSubview:_queryTimesInfoLabel];
        
        _smsTimeslabel = [[UILabel alloc] initWithFrame:CGRectMake(_queryTimesInfoLabel.frame.origin.x+_queryTimesInfoLabel.frame.size.width, _queryTimesInfoLabel.frame.origin.y, 120, LABEL_HEIGHT)];
        
        [_smsTimeslabel setText:@"短信提醒次数："];
        
        [_smsTimeslabel setFont:FONT_STR];
        
        [self addSubview:_smsTimeslabel];
        
        UILabel *smsTimeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_smsTimeslabel.frame.origin.x+_smsTimeslabel.frame.size.width, _smsTimeslabel.frame.origin.y, 50.0, LABEL_HEIGHT)];
        
        [smsTimeInfoLabel setFont:FONT_STR];
        
        [smsTimeInfoLabel setTextColor:[UIColor redColor]];
        
        [self addSubview:smsTimeInfoLabel];
        
        _systemTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _queryTimesLabel.frame.origin.y+_queryTimesLabel.frame.size.height, 120.0, LABEL_HEIGHT)];
        [_systemTimesLabel setText:@"系统推送次数："];
        
        [_systemTimesLabel setFont:FONT_STR];
        
        [self addSubview:_systemTimesLabel];
        
        _systemTimesInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_systemTimesLabel.frame.origin.x+_systemTimesLabel.frame.size.width, _systemTimesLabel.frame.origin.y, 50.0, LABEL_HEIGHT)];
        
        [_systemTimesInfoLabel setFont:FONT_STR];
        
        [_systemTimesInfoLabel setTextColor:[UIColor redColor]];
        
        [self addSubview:_systemTimesInfoLabel];
        
        
        UIButton *showInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
                                    
        [showInfoButton setBackgroundImage:[UIImage imageNamed:@"recommandcars"] forState:UIControlStateNormal];
        
        [showInfoButton setFrame:CGRectMake(self.frame.size.width-150-10, _systemTimesLabel.frame.origin.y+_systemTimesLabel.frame.size.height, 150, 30)];
        
        [showInfoButton addTarget:self action:@selector(showInfoView:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:showInfoButton];
        
    }
    return self;
}

-(void)setRecommandTeamInfo:(RecommandTeam *)_recommandTeam{

    [_addressInfoLabel setText:[_recommandTeam address]];
    
    [_boxTypeInfoLabel setText:[_recommandTeam boxType]];
    
    [_dateInfoLabel setText:[_recommandTeam date]];
    
    [_boxInfoLabel setText:[_recommandTeam box]];
    
    [_inputInfoLabel setText:[_recommandTeam input]];
    
    [_peopleInfoLabel setText:[_recommandTeam people]];
    
    [_rankInfoLabel setText:[_recommandTeam rank]];
    
    [_createTimeInfoLabel setText:[_recommandTeam createTime]];
    
    NSString *queryTimesStr = [NSString stringWithFormat:@"%@次",[_recommandTeam queryTimes]];
    
    [_queryTimesInfoLabel setText:queryTimesStr];
    
    NSString *_smsTimesStr = [NSString stringWithFormat:@"%@次",[_recommandTeam smsTimes]];
    
    [_smsTimeInfoLabel setText:_smsTimesStr];
    
    NSString *systemTimesStr = [NSString stringWithFormat:@"%@次",[_recommandTeam systemTimes]];
    
    [_systemTimesInfoLabel setText:systemTimesStr];
    
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
