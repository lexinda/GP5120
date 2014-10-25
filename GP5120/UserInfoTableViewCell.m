//
//  UserInfoTableViewCell.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/25.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "UserInfoTableViewCell.h"

#define FONT [UIFont fontWithName:@"Helvetica" size:13.0]

@implementation UserInfoTableViewCell

@synthesize gotoPhoto;

@synthesize photoImageView;

@synthesize userName;

@synthesize userActive;

@synthesize userLevel;

@synthesize registerTime;

@synthesize notice;

@synthesize queryInfo;

@synthesize companyName;

@synthesize companyAddress;

@synthesize companyType;

@synthesize concatPeople;

@synthesize concatEmail;

@synthesize concatPhone;

@synthesize phone;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier appUserInfo:(AppUserInfo *)appUserInfo{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.gotoPhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [self.gotoPhoto setTitle:@"查看相册>" forState:UIControlStateNormal];
        
        [self.gotoPhoto setFrame:CGRectMake(10.0, 0.0, 80.0, 20.0)];
        
        [self addSubview:self.gotoPhoto];
        
        self.photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.gotoPhoto.frame.origin.x, self.gotoPhoto.frame.origin.y+self.gotoPhoto.frame.size.height, 80.0, 90.0)];
        
        [self.photoImageView setImage:[UIImage imageNamed:@"car"]];
        
        [self addSubview:self.photoImageView];
        
        self.userName = [[UILabel alloc] initWithFrame:CGRectMake(self.photoImageView.frame.origin.x+self.photoImageView.frame.size.width, self.gotoPhoto.frame.origin.y, self.frame.size.width-20.0-self.photoImageView.frame.size.width, 20.0)];
        
        [self.userName setText:[NSString stringWithFormat:@"用户名：%@",appUserInfo.USER_NAME]];
        
        [self.userName setFont:FONT];
        
        [self addSubview:self.userName];
        
        self.userActive = [[UILabel alloc] initWithFrame:CGRectMake(self.userName.frame.origin.x, self.userName.frame.origin.y+self.userName.frame.size.height, self.userName.frame.size.width, 20.0)];
        
        [self.userActive setText:[NSString stringWithFormat:@"活跃度：%@",appUserInfo.ACTIVE_INDEX]];
        
        [self.userActive setFont:FONT];
        
        [self addSubview:self.userActive];
        
        self.userLevel = [[UILabel alloc] initWithFrame:CGRectMake(self.userActive.frame.origin.x, self.userActive.frame.origin.y+self.userActive.frame.size.height, self.userActive.frame.size.width, 20.0)];
        
        [self.userLevel setText:[NSString stringWithFormat:@"用户等级：%@",appUserInfo.GRADE]];
        
        [self.userLevel setFont:FONT];
        
        [self addSubview:self.userLevel];
        
        self.registerTime = [[UILabel alloc] initWithFrame:CGRectMake(self.userLevel.frame.origin.x, self.userLevel.frame.origin.y+self.userLevel.frame.size.height, self.userLevel.frame.size.width, 20.0)];
        
        [self.registerTime setText:[NSString stringWithFormat:@"注册时间：%@",appUserInfo.REG_TIME]];
        
        [self.registerTime setFont:FONT];
        
        [self addSubview:self.registerTime];
        
        self.notice = [[UILabel alloc] initWithFrame:CGRectMake(self.registerTime.frame.origin.x, self.registerTime.frame.origin.y+self.registerTime.frame.size.height, self.registerTime.frame.size.width, 20.0)];
        
        [self.notice setText:[NSString stringWithFormat:@"发布消息：%@",appUserInfo.MSG_YES]];
        
        [self.notice setFont:FONT];
        
        [self addSubview:self.notice];
        
        self.queryInfo = [[UILabel alloc] initWithFrame:CGRectMake(self.notice.frame.origin.x, self.notice.frame.origin.y+self.notice.frame.size.height, self.notice.frame.size.width, 20.0)];
        
        [self.queryInfo setText:[NSString stringWithFormat:@"查询消息：%@",appUserInfo.QUERY_COUNT]];
        
        [self.queryInfo setFont:FONT];
        
        [self addSubview:self.queryInfo];
        
        self.companyName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, self.queryInfo.frame.origin.y+self.queryInfo.frame.size.height, self.frame.size.width-20.0, 20.0)];
        
        [self.companyName setText:[NSString stringWithFormat:@"公司名称：%@",appUserInfo.USER_COMPANY_NAME]];
        
        [self.companyName setFont:FONT];
        
        [self addSubview:self.companyName];
        
        self.companyAddress = [[UILabel alloc] initWithFrame:CGRectMake(self.companyName.frame.origin.x, self.companyName.frame.origin.y+self.companyName.frame.size.height, self.companyName.frame.size.width, 20.0)];
        
        [self.companyAddress setText:[NSString stringWithFormat:@"公司地址：%@",appUserInfo.COMPANY_POISION]];
        
        [self.companyAddress setFont:FONT];
        
        [self addSubview:self.companyAddress];
        
        self.companyType = [[UILabel alloc] initWithFrame:CGRectMake(self.companyAddress.frame.origin.x, self.companyAddress.frame.origin.y+self.companyAddress.frame.size.height, self.companyAddress.frame.size.width, 20.0)];
        
        [self.companyType setText:[NSString stringWithFormat:@"公司类型：%@",appUserInfo.COMPANY_TYPE]];
        
        [self.companyType setFont:FONT];
        
        [self addSubview:self.companyType];
        
        self.concatPeople = [[UILabel alloc] initWithFrame:CGRectMake(self.companyType.frame.origin.x, self.companyType.frame.origin.y+self.companyType.frame.size.height, (self.frame.size.width-20.0)/2, 20.0)];
        
        [self.concatPeople setText:[NSString stringWithFormat:@"联系人：%@",appUserInfo.CONTACT_PERSON]];
        
        [self.concatPeople setFont:FONT];
        
        [self addSubview:self.concatPeople];
        
        self.concatEmail = [[UILabel alloc] initWithFrame:CGRectMake(self.concatPeople.frame.origin.x+self.concatPeople.frame.size.width, self.concatPeople.frame.origin.y, (self.frame.size.width-20.0)/2, 20.0)];
        
        [self.concatEmail setText:[NSString stringWithFormat:@"联系人：%@",appUserInfo.E_MAIL]];
        
        [self.concatEmail setFont:FONT];
        
        [self addSubview:self.concatEmail];
        
        self.concatPhone = [[UILabel alloc] initWithFrame:CGRectMake(self.concatPeople.frame.origin.x, self.concatPeople.frame.origin.y+self.concatPeople.frame.size.height, (self.frame.size.width-20.0)/2, 20.0)];
        
        [self.concatPhone setText:[NSString stringWithFormat:@"联系电话：%@",appUserInfo.CONTACT_TEL]];
        
        [self.concatPhone setFont:FONT];
        
        [self addSubview:self.concatPhone];
        
        self.phone = [[UILabel alloc] initWithFrame:CGRectMake(self.concatPhone.frame.origin.x+self.concatPhone.frame.size.width, self.concatPhone.frame.origin.y, (self.frame.size.width-20.0)/2, 20.0)];
        
        [self.phone setText:[NSString stringWithFormat:@"手机：%@",appUserInfo.MOBILE]];
        
        [self.phone setFont:FONT];
        
        [self addSubview:self.phone];
        
    }
    
    return self;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
