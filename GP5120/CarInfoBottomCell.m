//
//  CarInfoBottomCell.m
//  GP5120
//
//  Created by lele126 on 14-8-7.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "CarInfoBottomCell.h"

@implementation CarInfoBottomCell

@synthesize _pushViewDelegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withCarInfoCell:(CarInfoCell*)_carInfoCell
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UILabel *companyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, 70.0, 20.0)];
        
        [companyLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [companyLabel setText:@"公司名称："];
        
        [self addSubview:companyLabel];
        
        UILabel *companyInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(companyLabel.frame.origin.x+companyLabel.frame.size.width, companyLabel.frame.origin.y, 150.0, 20.0)];
        
        [companyInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [companyInfoLabel setText:[_carInfoCell companyName]];
        
        [self addSubview:companyInfoLabel];
        
        UIButton *sendCarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [sendCarButton setFrame:CGRectMake(self.frame.size.width-90.0, 10.0, 70.0, 20.0)];
        
        [sendCarButton addTarget:self action:@selector(showAcceptView) forControlEvents:UIControlEventTouchUpInside];
        
        [sendCarButton setTitle:@"立即派车" forState:UIControlStateNormal];
        
        [self addSubview:sendCarButton];
        
        UILabel *companyAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(companyLabel.frame.origin.x, companyLabel.frame.origin.y+companyLabel.frame.size.height, 70.0, 20.0)];
        
        [companyAddressLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [companyAddressLabel setText:@"公司地址："];
        
        [self addSubview:companyAddressLabel];
        
        UILabel *companyAddressInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(companyAddressLabel.frame.origin.x+companyAddressLabel.frame.size.width, companyAddressLabel.frame.origin.y, 250.0, 20.0)];
        
        [companyAddressInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [companyAddressInfoLabel setText:[_carInfoCell companyAddress]];
        
        [self addSubview:companyAddressInfoLabel];
        
        UILabel *companyTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(companyAddressLabel.frame.origin.x, companyAddressLabel.frame.origin.y+companyAddressLabel.frame.size.height, 70.0, 20.0)];
        
        [companyTypeLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [companyTypeLabel setText:@"公司类型："];
        
        [self addSubview:companyTypeLabel];
        
        UILabel *companyTypeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(companyTypeLabel.frame.origin.x+companyTypeLabel.frame.size.width, companyTypeLabel.frame.origin.y, 250.0, 20.0)];
        
        [companyTypeInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [companyTypeInfoLabel setText:[_carInfoCell companyAddress]];
        
        [self addSubview:companyTypeInfoLabel];
        
        UILabel *peopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(companyTypeLabel.frame.origin.x, companyTypeLabel.frame.origin.y+companyTypeLabel.frame.size.height, 60.0, 20.0)];
        
        [peopleLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [peopleLabel setText:@"联系人："];
        
        [self addSubview:peopleLabel];
        
        UILabel *peopleInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(peopleLabel.frame.origin.x+peopleLabel.frame.size.width-10.0,peopleLabel.frame.origin.y, 50.0, 20.0)];
        
        [peopleInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [peopleInfoLabel setText:[_carInfoCell people]];
        
        [self addSubview:peopleInfoLabel];
        
        UILabel *emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(peopleInfoLabel.frame.origin.x+peopleInfoLabel.frame.size.width, peopleInfoLabel.frame.origin.y, 60.0, 20.0)];
        
        [emailLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [emailLabel setText:@"E-mail："];
        
        [self addSubview:emailLabel];
        
        UILabel *emailInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(emailLabel.frame.origin.x+emailLabel.frame.size.width-10.0, emailLabel.frame.origin.y, 160.0, 20.0)];
        
        [emailInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [emailInfoLabel setText:[_carInfoCell email]];
        
        [self addSubview:emailInfoLabel];
        
        UILabel *companyPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(peopleLabel.frame.origin.x, peopleLabel.frame.origin.y+peopleLabel.frame.size.height, 70.0, 20.0)];
        
        [companyPhoneLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [companyPhoneLabel setText:@"联系电话："];
        
        [self addSubview:companyPhoneLabel];
        
        UILabel *companyPhoneInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(companyPhoneLabel.frame.origin.x+companyPhoneLabel.frame.size.width, companyPhoneLabel.frame.origin.y, 100.0, 20.0)];
        
        [companyPhoneInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [companyPhoneInfoLabel setText:[_carInfoCell companyPhone]];
        
        [self addSubview:companyPhoneInfoLabel];
        
        UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(companyPhoneInfoLabel.frame.origin.x+companyPhoneInfoLabel.frame.size.width, companyPhoneInfoLabel.frame.origin.y, 60.0, 20.0)];
        
        [phoneLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [phoneLabel setText:@"手机："];
        
        [self addSubview:phoneLabel];
        
        UILabel *phoneInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(phoneLabel.frame.origin.x+phoneLabel.frame.size.width-20.0, phoneLabel.frame.origin.y, 100.0, 20.0)];
        
        [phoneInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [phoneInfoLabel setText:[_carInfoCell phone]];
        
        [self addSubview:phoneInfoLabel];
        
        UILabel *faxLabel = [[UILabel alloc] initWithFrame:CGRectMake(companyLabel.frame.origin.x, companyPhoneLabel.frame.origin.y+companyPhoneLabel.frame.size.height, 50.0, 20.0)];
        
        [faxLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [faxLabel setText:@" 传真："];
        
        [self addSubview:faxLabel];
        
        UILabel *faxInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(faxLabel.frame.origin.x+faxLabel.frame.size.width, faxLabel.frame.origin.y, 250.0, 20.0)];
        
        [faxInfoLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14.0]];
        
        [faxInfoLabel setText:[_carInfoCell faxNum]];
        
        [self addSubview:faxInfoLabel];
        
        
    }
    return self;
}

-(void)showAcceptView{

    [_pushViewDelegate showAcceptView];
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

@end
