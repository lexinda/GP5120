//
//  CarInfoTopView.m
//  GP5120
//
//  Created by lele126 on 14-8-6.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "CarInfoTopView.h"

@implementation CarInfoTopView

@synthesize _carInfo;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UILabel *peopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, 60.0, 20.0)];
    
    [peopleLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [peopleLabel setText:@"发布人："];
    
    [self addSubview:peopleLabel];
    
    UILabel *peopleInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(peopleLabel.frame.origin.x+peopleLabel.frame.size.width, 0.0, (self.frame.size.width-60-60)/2, 20.0)];
    
    [peopleInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [peopleInfoLabel setText:[_carInfo people]];
    
    [self addSubview:peopleInfoLabel];
    
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(peopleInfoLabel.frame.origin.x+peopleInfoLabel.frame.size.width, 0.0, 60.0, 20.0)];
    
    [addressLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [addressLabel setText:@"目的地："];
    
    [self addSubview:addressLabel];
    
    UILabel *addressInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(addressLabel.frame.origin.x+addressLabel.frame.size.width, 0.0, (self.frame.size.width-60-60)/2, 20.0)];
    
    [addressInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [addressInfoLabel setText:[_carInfo address]];
    
    [self addSubview:addressInfoLabel];
    
    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(peopleLabel.frame.origin.x, peopleLabel.frame.origin.y+peopleLabel.frame.size.height, 70.0, 20.0)];
    
    [phoneLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [phoneLabel setText:@"联系方式："];
    
    [self addSubview:phoneLabel];
    
    UILabel *phoneInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(phoneLabel.frame.origin.x+phoneLabel.frame.size.width, phoneLabel.frame.origin.y, 100.0, 20.0)];
    
    [phoneInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [phoneInfoLabel setText:[_carInfo phone]];
    
    [self addSubview:phoneInfoLabel];
    
    UILabel *otherLabel = [[UILabel alloc] initWithFrame:CGRectMake(phoneLabel.frame.origin.x, phoneLabel.frame.origin.y+phoneLabel.frame.size.height, self.frame.size.width-20.0, 30.0)];
    
    [otherLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    NSString *otherStr = [NSString stringWithFormat:@"其他要求：%@",[_carInfo otherInfo]];
    
    [otherLabel setText:otherStr];
    
    otherLabel.textAlignment = NSTextAlignmentLeft;
    //自动折行设置
    otherLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    otherLabel.numberOfLines = 0;
    
    [self addSubview:otherLabel];
    
    UILabel *getTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(otherLabel.frame.origin.x, otherLabel.frame.origin.y+otherLabel.frame.size.height, 70.0, 20.0)];
    
    [getTimeLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [getTimeLabel setText:@"出港时间："];
    
    [self addSubview:getTimeLabel];
    
    UILabel *getTimeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(getTimeLabel.frame.origin.x+getTimeLabel.frame.size.width, getTimeLabel.frame.origin.y, 150.0, 20.0)];
    
    [getTimeInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [getTimeInfoLabel setText:[_carInfo getTime]];
    
    [self addSubview:getTimeInfoLabel];
    
    UILabel *createTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(getTimeLabel.frame.origin.x, getTimeLabel.frame.origin.y+getTimeLabel.frame.size.height, 70.0, 20.0)];
    
    [createTimeLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [createTimeLabel setText:@"发布时间："];
    
    [self addSubview:createTimeLabel];
    
    UILabel *createTimeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(createTimeLabel.frame.origin.x+createTimeLabel.frame.size.width, createTimeLabel.frame.origin.y, 150.0, 20.0)];
    
    [createTimeInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [createTimeInfoLabel setText:[_carInfo createTime]];
    
    [self addSubview:createTimeInfoLabel];
    
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(phoneInfoLabel.frame.origin.x+phoneInfoLabel.frame.size.width-10.0, phoneInfoLabel.frame.origin.y, 50.0, 20.0)];
    
    [priceLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [priceLabel setText:@"价格："];
    
    [self addSubview:priceLabel];
    
    UILabel *priceInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(priceLabel.frame.origin.x+priceLabel.frame.size.width-10.0, priceLabel.frame.origin.y, 60.0, 20.0)];
    
    [priceInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [priceInfoLabel setText:[_carInfo price]];
    
    [self addSubview:priceInfoLabel];
    
    UILabel *infoTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(createTimeLabel.frame.origin.x,createTimeLabel.frame.origin.y+createTimeLabel.frame.size.height, 70.0, 20.0)];
    
    [infoTypeLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [infoTypeLabel setText:@"信息类型："];
    
    [self addSubview:infoTypeLabel];
    
    UILabel *infoTypeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(infoTypeLabel.frame.origin.x+infoTypeLabel.frame.size.width, infoTypeLabel.frame.origin.y, 70.0, 20.0)];
    
    [infoTypeInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [infoTypeInfoLabel setText:[_carInfo infoType]];
    
    [self addSubview:infoTypeInfoLabel];
    
    UILabel *boxLabel = [[UILabel alloc] initWithFrame:CGRectMake(infoTypeInfoLabel.frame.origin.x+infoTypeInfoLabel.frame.size.width-10.0, infoTypeInfoLabel.frame.origin.y, 50.0, 20.0)];
    
    [boxLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [boxLabel setText:@"箱型："];
    
    [self addSubview:boxLabel];
    
    UILabel *boxInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(boxLabel.frame.origin.x+boxLabel.frame.size.width-10.0, boxLabel.frame.origin.y, 60.0, 20.0)];
    
    [boxInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [boxInfoLabel setText:[_carInfo boxType]];
    
    [self addSubview:boxInfoLabel];
    
    UILabel *weightLabel = [[UILabel alloc] initWithFrame:CGRectMake(infoTypeInfoLabel.frame.origin.x+infoTypeInfoLabel.frame.size.width, infoTypeInfoLabel.frame.origin.y, 50.0, 20.0)];
    
    [weightLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [weightLabel setText:@"重量："];
    
    //[self addSubview:weightLabel];
    
    UILabel *weightInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(weightLabel.frame.origin.x+weightLabel.frame.size.width-10.0, weightLabel.frame.origin.y, 50.0, 20.0)];
    
    [weightInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [weightInfoLabel setText:[_carInfo weight]];
    
    //[self addSubview:weightInfoLabel];
    
    UILabel *portLabel = [[UILabel alloc] initWithFrame:CGRectMake(infoTypeLabel.frame.origin.x, infoTypeLabel.frame.origin.y+infoTypeLabel.frame.size.height, 50.0, 20.0)];
    
    [portLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [portLabel setText:@"港口："];
    
    [self addSubview:portLabel];
    
    UILabel *portInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(portLabel.frame.origin.x+portLabel.frame.size.width-10.0, portLabel.frame.origin.y, 70.0, 20.0)];
    
    [portInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [portInfoLabel setText:[_carInfo port]];
    
    [self addSubview:portInfoLabel];
    
    UILabel *transportTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(infoTypeLabel.frame.origin.x,infoTypeLabel.frame.origin.y+infoTypeLabel.frame.size.height, 70.0, 20.0)];
    
    [transportTypeLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    //[transportTypeLabel setText:@"信息类型："];
    
    [self addSubview:transportTypeLabel];
    
    UILabel *transportInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(transportTypeLabel.frame.origin.x+transportTypeLabel.frame.size.width, transportTypeLabel.frame.origin.y, 100.0, 20.0)];
    
    [transportInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
    
    [transportInfoLabel setText:[_carInfo transportType]];
    
    //[self addSubview:transportInfoLabel];

    
}


@end
