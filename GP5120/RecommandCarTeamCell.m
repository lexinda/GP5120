//
//  RecommandCarTeamCell.m
//  GP5120
//
//  Created by 朱孟乐 on 14/11/2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "RecommandCarTeamCell.h"

#define FONT_STR [UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]

#define LABEL_HEIGHT 20.0

#define TWO_WIDTH 50.0

#define THREE_WIDTH 60.0

#define FOUR_WIDTH 75.0

#define LEFT_WIDTH 10.0

@implementation RecommandCarTeamCell

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

@synthesize _rankInfo;

@synthesize _createTimelabel;

@synthesize _createTimeInfoLabel;

@synthesize _companyIntro;

@synthesize _companyIntroInfo;

@synthesize _queryTimesLabel;

@synthesize _queryTimesInfoLabel;

@synthesize _smsTimeslabel;

@synthesize _smsTimeInfoLabel;

@synthesize _systemTimesLabel;

@synthesize _systemTimesInfoLabel;

@synthesize _pushViewDelegate;

@synthesize _releaseInfo;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, 0.0, TWO_WIDTH, LABEL_HEIGHT)];
        
        [_addressLabel setText:@"地址："];
        
        [_addressLabel setFont:FONT_STR];
        
        [self addSubview:_addressLabel];
        
        _addressInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_addressLabel.frame.origin.x+_addressLabel.frame.size.width, _addressLabel.frame.origin.y, (self.frame.size.width-TWO_WIDTH-FOUR_WIDTH-LEFT_WIDTH*2)/2, LABEL_HEIGHT)];
        
        [_addressInfoLabel setFont:FONT_STR];
        
        [self addSubview:_addressInfoLabel];
        
        _boxTypelabel = [[UILabel alloc] initWithFrame:CGRectMake(_addressInfoLabel.frame.origin.x+_addressInfoLabel.frame.size.width, _addressLabel.frame.origin.y, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [_boxTypelabel setText:@"公司名称："];
        
        [_boxTypelabel setFont:FONT_STR];
        
        [self addSubview:_boxTypelabel];
        
        _boxTypeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_boxTypelabel.frame.origin.x+_boxTypelabel.frame.size.width, _boxTypelabel.frame.origin.y, (self.frame.size.width-TWO_WIDTH-FOUR_WIDTH-LEFT_WIDTH*2)/2, LABEL_HEIGHT)];
        
        [_boxTypeInfoLabel setFont:FONT_STR];
        
        [self addSubview:_boxTypeInfoLabel];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _addressLabel.frame.origin.y+_addressLabel.frame.size.height, THREE_WIDTH, LABEL_HEIGHT)];
        [_dateLabel setText:@"联系人："];
        
        [_dateLabel setFont:FONT_STR];
        
        [self addSubview:_dateLabel];
        
        _dateInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_dateLabel.frame.origin.x+_dateLabel.frame.size.width, _dateLabel.frame.origin.y, self.frame.size.width-FOUR_WIDTH-LEFT_WIDTH*2, LABEL_HEIGHT)];
        
        [_dateInfoLabel setFont:FONT_STR];
        
        [self addSubview:_dateInfoLabel];
        
        _boxlabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _dateLabel.frame.origin.y+_dateLabel.frame.size.height, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [_boxlabel setText:@"联系电话："];
        
        [_boxlabel setFont:FONT_STR];
        
        [self addSubview:_boxlabel];
        
        _boxInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_boxlabel.frame.origin.x+_boxlabel.frame.size.width, _boxlabel.frame.origin.y, self.frame.size.width-FOUR_WIDTH-LEFT_WIDTH*2, LABEL_HEIGHT)];
        
        [_boxInfoLabel setFont:FONT_STR];
        
        [self addSubview:_boxInfoLabel];
        
        _inputLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _boxlabel.frame.origin.y+_boxlabel.frame.size.height, FOUR_WIDTH, LABEL_HEIGHT)];
        [_inputLabel setText:@"企业类型："];
        
        [_inputLabel setFont:FONT_STR];
        
        [self addSubview:_inputLabel];
        
        _inputInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_inputLabel.frame.origin.x+_inputLabel.frame.size.width, _inputLabel.frame.origin.y, (self.frame.size.width-TWO_WIDTH-FOUR_WIDTH-LEFT_WIDTH*2)/2, LABEL_HEIGHT)];
        
        [_inputInfoLabel setFont:FONT_STR];
        
        [self addSubview:_inputInfoLabel];
        
        _peoplelabel = [[UILabel alloc] initWithFrame:CGRectMake(_inputInfoLabel.frame.origin.x+_inputInfoLabel.frame.size.width, _inputInfoLabel.frame.origin.y, THREE_WIDTH, LABEL_HEIGHT)];
        
        [_peoplelabel setText:@"港口："];
        
        [_peoplelabel setFont:FONT_STR];
        
        [self addSubview:_peoplelabel];
        
        _peopleInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_peoplelabel.frame.origin.x+_peoplelabel.frame.size.width, _peoplelabel.frame.origin.y, (self.frame.size.width-TWO_WIDTH-FOUR_WIDTH-LEFT_WIDTH*2)/2, LABEL_HEIGHT)];
        
        [_peopleInfoLabel setFont:FONT_STR];
        
        [self addSubview:_peopleInfoLabel];
        
        _rankLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _inputLabel.frame.origin.y+_inputLabel.frame.size.height, TWO_WIDTH, LABEL_HEIGHT)];
        [_rankLabel setText:@"等级："];
        
        [_rankLabel setFont:FONT_STR];
        
        [self addSubview:_rankLabel];
        
        _rankInfo = [[UIImageView alloc] initWithFrame:CGRectMake(_rankLabel.frame.origin.x+_rankLabel.frame.size.width, _rankLabel.frame.origin.y, (self.frame.size.width-TWO_WIDTH-TWO_WIDTH-LEFT_WIDTH*2)/2, LABEL_HEIGHT)];
        
        [self addSubview:_rankInfo];
        
        _createTimelabel = [[UILabel alloc] initWithFrame:CGRectMake(_rankInfo.frame.size.width+_rankInfo.frame.origin.x, _rankInfo.frame.origin.y, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [_createTimelabel setText:@"qq："];
        
        [_createTimelabel setFont:FONT_STR];
        
        [self addSubview:_createTimelabel];
        
        _createTimeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_createTimelabel.frame.origin.x+_createTimelabel.frame.size.width, _createTimelabel.frame.origin.y, (self.frame.size.width-TWO_WIDTH-TWO_WIDTH-LEFT_WIDTH*2)/2, LABEL_HEIGHT)];
        
        [_createTimeInfoLabel setFont:FONT_STR];
        
        [self addSubview:_createTimeInfoLabel];
        
        _companyIntro = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _createTimelabel.frame.origin.y+_createTimelabel.frame.size.height, FOUR_WIDTH, LABEL_HEIGHT)];
        
        [_companyIntro setText:@"公司简介："];
        
        [_companyIntro setFont:FONT_STR];
        
        [self addSubview:_companyIntro];
        
        _companyIntroInfo = [[UILabel alloc] initWithFrame:CGRectMake(_companyIntro.frame.origin.x+_companyIntro.frame.size.width, _companyIntro.frame.origin.y, self.frame.size.width-FOUR_WIDTH-LEFT_WIDTH*2, LABEL_HEIGHT)];
        
        [_companyIntroInfo setFont:FONT_STR];
        
        [self addSubview:_companyIntroInfo];
        
        _queryTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _companyIntroInfo.frame.origin.y+_companyIntroInfo.frame.size.height, 100.0, LABEL_HEIGHT)];
        [_queryTimesLabel setText:@"被查询次数："];
        
        [_queryTimesLabel setFont:FONT_STR];
        
        //[self addSubview:_queryTimesLabel];
        
        _queryTimesInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_queryTimesLabel.frame.origin.x+_queryTimesLabel.frame.size.width, _queryTimesLabel.frame.origin.y, 30.0, LABEL_HEIGHT)];
        
        [_queryTimesInfoLabel setFont:FONT_STR];
        
        [_queryTimesInfoLabel setTextColor:[UIColor redColor]];
        
        //[self addSubview:_queryTimesInfoLabel];
        
        _smsTimeslabel = [[UILabel alloc] initWithFrame:CGRectMake(_queryTimesInfoLabel.frame.origin.x+_queryTimesInfoLabel.frame.size.width, _queryTimesInfoLabel.frame.origin.y, 120, LABEL_HEIGHT)];
        
        [_smsTimeslabel setText:@"短信提醒次数："];
        
        [_smsTimeslabel setFont:FONT_STR];
        
        //[self addSubview:_smsTimeslabel];
        
        _smsTimeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_smsTimeslabel.frame.origin.x+_smsTimeslabel.frame.size.width, _smsTimeslabel.frame.origin.y, 30.0, LABEL_HEIGHT)];
        
        [_smsTimeInfoLabel setFont:FONT_STR];
        
        [_smsTimeInfoLabel setTextColor:[UIColor redColor]];
        
        //[self addSubview:_smsTimeInfoLabel];
        
        _systemTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_WIDTH, _queryTimesLabel.frame.origin.y+_queryTimesLabel.frame.size.height, 120.0, LABEL_HEIGHT)];
        [_systemTimesLabel setText:@"系统推送次数："];
        
        [_systemTimesLabel setFont:FONT_STR];
        
        //[self addSubview:_systemTimesLabel];
        
        _systemTimesInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_systemTimesLabel.frame.origin.x+_systemTimesLabel.frame.size.width, _systemTimesLabel.frame.origin.y, 30.0, LABEL_HEIGHT)];
        
        [_systemTimesInfoLabel setFont:FONT_STR];
        
        [_systemTimesInfoLabel setTextColor:[UIColor redColor]];
        
        //[self addSubview:_systemTimesInfoLabel];
        
        
        UIButton *showInfoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [showInfoButton setBackgroundImage:[UIImage imageNamed:@"recommandcars"] forState:UIControlStateNormal];
        
        [showInfoButton setFrame:CGRectMake(self.frame.size.width-150-10, _systemTimesLabel.frame.origin.y+_systemTimesLabel.frame.size.height, 150, 30)];
        
        [showInfoButton addTarget:self action:@selector(showInfoView:) forControlEvents:UIControlEventTouchUpInside];
        
        //[self addSubview:showInfoButton];
        
    }
    return self;
}

-(void)setAppUserInfo:(AppUserInfo *)_appUserInfo{
    
    [_addressInfoLabel setText:[_appUserInfo COMPANY_POISION]];
    
    [_boxTypeInfoLabel setText:[_appUserInfo USER_COMPANY_NAME]];
    
    [_dateInfoLabel setText:[_appUserInfo CONTACT_PERSON]];
    
    [_boxInfoLabel setText:[_appUserInfo MOBILE]];
    
    [_inputInfoLabel setText:[_appUserInfo COMPANY_TYPE]];
    
    [_peopleInfoLabel setText:[_appUserInfo PORT]];
    
    NSString *rank = [NSString stringWithFormat:@"%@",[_appUserInfo GRADE]];
    
    [_rankInfo setImage:[UIImage imageNamed:rank]];
    
    [_createTimeInfoLabel setText:[_appUserInfo QQ]];
    
    [_companyIntroInfo setText:[_appUserInfo COMPANY_INTRODUCTION]];
    
    NSString *queryTimesStr = [NSString stringWithFormat:@"%@次",[_appUserInfo QUERY_COUNT]];
    
    [_queryTimesInfoLabel setText:queryTimesStr];
    
    NSString *_smsTimesStr = [NSString stringWithFormat:@"%@次",[_appUserInfo RELEASE_COUNT]];
    
    [_smsTimeInfoLabel setText:_smsTimesStr];
    
    NSString *systemTimesStr = [NSString stringWithFormat:@"%@次",[_appUserInfo RELEASE_COUNT]];
    
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
    
    [_pushViewDelegate showInfoDetailView:_releaseInfo];
    
}


@end
