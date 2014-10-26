//
//  QueryCarInfoView.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/26.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "QueryCarInfoView.h"

#define FONT [UIFont fontWithName:@"Helvetica" size:13.0]

@implementation QueryCarInfoView

@synthesize _appUserInfo;

@synthesize _releasePersonInfo;

@synthesize _table;

@synthesize gotoPhoto;

@synthesize photoImageView;

@synthesize userName;

@synthesize userActive;

@synthesize userLevel;

@synthesize registerTime;

@synthesize notice;

@synthesize queryInfo;

@synthesize contract;

@synthesize address;

@synthesize contractPhone;

@synthesize especialRequest;

@synthesize stowageTime;

@synthesize chunkType;

@synthesize releaseTime;

@synthesize price;

@synthesize infoType;

@synthesize weight;

@synthesize port;

@synthesize trafficType;

@synthesize companyName;

@synthesize companyAddress;

@synthesize companyType;

@synthesize concatPeople;

@synthesize concatEmail;

@synthesize concatPhone;

@synthesize phone;

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.gotoPhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [self.gotoPhoto setTitle:@"查看相册>" forState:UIControlStateNormal];
    
    [self.gotoPhoto setFrame:CGRectMake(10.0, 0.0, 80.0, 20.0)];
    
    [self addSubview:self.gotoPhoto];
    
    self.photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.gotoPhoto.frame.origin.x, self.gotoPhoto.frame.origin.y+self.gotoPhoto.frame.size.height, 80.0, 90.0)];
    
    [self.photoImageView setImage:[UIImage imageNamed:@"car"]];
    
    [self addSubview:self.photoImageView];
    
    self.userName = [[UILabel alloc] initWithFrame:CGRectMake(self.photoImageView.frame.origin.x+self.photoImageView.frame.size.width, self.gotoPhoto.frame.origin.y, self.frame.size.width-20.0-self.photoImageView.frame.size.width, 20.0)];
    
    [self.userName setFont:FONT];
    
    [self addSubview:self.userName];
    
    self.userActive = [[UILabel alloc] initWithFrame:CGRectMake(self.userName.frame.origin.x, self.userName.frame.origin.y+self.userName.frame.size.height, self.userName.frame.size.width, 20.0)];
    
    [self.userActive setFont:FONT];
    
    [self addSubview:self.userActive];
    
    self.userLevel = [[UILabel alloc] initWithFrame:CGRectMake(self.userActive.frame.origin.x, self.userActive.frame.origin.y+self.userActive.frame.size.height, self.userActive.frame.size.width, 20.0)];
    
    [self.userLevel setFont:FONT];
    
    [self addSubview:self.userLevel];
    
    self.registerTime = [[UILabel alloc] initWithFrame:CGRectMake(self.userLevel.frame.origin.x, self.userLevel.frame.origin.y+self.userLevel.frame.size.height, self.userLevel.frame.size.width, 20.0)];
    
    [self.registerTime setFont:FONT];
    
    [self addSubview:self.registerTime];
    
    self.notice = [[UILabel alloc] initWithFrame:CGRectMake(self.registerTime.frame.origin.x, self.registerTime.frame.origin.y+self.registerTime.frame.size.height, self.registerTime.frame.size.width, 20.0)];
    
    [self.notice setFont:FONT];
    
    [self addSubview:self.notice];
    
    self.queryInfo = [[UILabel alloc] initWithFrame:CGRectMake(self.notice.frame.origin.x, self.notice.frame.origin.y+self.notice.frame.size.height, self.notice.frame.size.width, 20.0)];
    
    [self.queryInfo setFont:FONT];
    
    [self addSubview:self.queryInfo];
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    self.contract = [[UILabel alloc] initWithFrame:CGRectMake(10.0,self.queryInfo.frame.origin.y+self.queryInfo.frame.size.height, (self.frame.size.width-20.0)/2, 20.0)];
    
    [self.contract setFont:FONT];
    
    [self addSubview:self.contract];
    
    self.address = [[UILabel alloc] initWithFrame:CGRectMake(self.contract.frame.origin.x+self.contract.frame.size.width, self.contract.frame.origin.y, (self.frame.size.width-20.0)/2, 20.0)];
    
    [self.address setFont:FONT];
    
    [self addSubview:self.address];
    
    self.contractPhone = [[UILabel alloc] initWithFrame:CGRectMake(self.contract.frame.origin.x, self.contract.frame.origin.y+self.contract.frame.size.height, self.frame.size.width-20.0, 20.0)];
    
    [self.contractPhone setFont:FONT];
    
    [self addSubview:self.contractPhone];
    
    self.especialRequest = [[UILabel alloc] initWithFrame:CGRectMake(self.contractPhone.frame.origin.x, self.contractPhone.frame.origin.y+self.contractPhone.frame.size.height, self.frame.size.width-20.0, 20.0)];
    
    [self.especialRequest setFont:FONT];
    
    [self addSubview:self.especialRequest];
    
    self.stowageTime = [[UILabel alloc] initWithFrame:CGRectMake(self.especialRequest.frame.origin.x, self.especialRequest.frame.origin.y+self.especialRequest.frame.size.height, self.frame.size.width-20.0, 20.0)];
    
    [self.stowageTime setFont:FONT];
    
    [self addSubview:self.stowageTime];
    
    self.chunkType = [[UILabel alloc] initWithFrame:CGRectMake(self.stowageTime.frame.origin.x, self.stowageTime.frame.origin.y+self.stowageTime.frame.size.height, self.frame.size.width-20.0, 20.0)];
    
    [self.chunkType setFont:FONT];
    
    [self addSubview:self.chunkType];
    
    self.releaseTime = [[UILabel alloc] initWithFrame:CGRectMake(self.chunkType.frame.origin.x, self.chunkType.frame.origin.y+self.chunkType.frame.size.height, self.frame.size.width-20.0, 20.0)];
    
    [self.releaseTime setFont:FONT];
    
    [self addSubview:self.releaseTime];
    
    self.price = [[UILabel alloc] initWithFrame:CGRectMake(self.releaseTime.frame.origin.x, self.releaseTime.frame.origin.y+self.releaseTime.frame.size.height, self.frame.size.width-20.0, 20.0)];
    
    [self.price setFont:FONT];
    
    [self addSubview:self.price];
    
    self.infoType = [[UILabel alloc] initWithFrame:CGRectMake(10.0,self.price.frame.origin.y+self.price.frame.size.height, (self.frame.size.width-20.0)/2, 20.0)];
    
    [self.infoType setFont:FONT];
    
    [self addSubview:self.infoType];
    
    self.weight = [[UILabel alloc] initWithFrame:CGRectMake(self.infoType.frame.origin.x+self.infoType.frame.size.width, self.infoType.frame.origin.y, (self.frame.size.width-20.0)/2, 20.0)];
    
    [self.weight setFont:FONT];
    
    [self addSubview:self.weight];
    
    self.port = [[UILabel alloc] initWithFrame:CGRectMake(10.0,self.infoType.frame.origin.y+self.infoType.frame.size.height, (self.frame.size.width-20.0)/2, 20.0)];
    
    [self.port setFont:FONT];
    
    [self addSubview:self.port];
    
    self.trafficType = [[UILabel alloc] initWithFrame:CGRectMake(self.port.frame.origin.x+self.port.frame.size.width, self.port.frame.origin.y, (self.frame.size.width-20.0)/2, 20.0)];
    
    [self.trafficType setFont:FONT];
    
    [self addSubview:self.trafficType];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    self.companyName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, self.port.frame.origin.y+self.port.frame.size.height, self.frame.size.width-20.0, 20.0)];
    
    [self.companyName setFont:FONT];
    
    [self addSubview:self.companyName];
    
    self.companyAddress = [[UILabel alloc] initWithFrame:CGRectMake(self.companyName.frame.origin.x, self.companyName.frame.origin.y+self.companyName.frame.size.height, self.companyName.frame.size.width, 20.0)];
    
    [self.companyAddress setFont:FONT];
    
    [self addSubview:self.companyAddress];
    
    self.companyType = [[UILabel alloc] initWithFrame:CGRectMake(self.companyAddress.frame.origin.x, self.companyAddress.frame.origin.y+self.companyAddress.frame.size.height, self.companyAddress.frame.size.width, 20.0)];
    
    [self.companyType setFont:FONT];
    
    [self addSubview:self.companyType];
    
    self.concatPeople = [[UILabel alloc] initWithFrame:CGRectMake(self.companyType.frame.origin.x, self.companyType.frame.origin.y+self.companyType.frame.size.height, (self.frame.size.width-20.0)/2, 20.0)];
    
    [self.concatPeople setFont:FONT];
    
    [self addSubview:self.concatPeople];
    
    self.concatEmail = [[UILabel alloc] initWithFrame:CGRectMake(self.concatPeople.frame.origin.x+self.concatPeople.frame.size.width, self.concatPeople.frame.origin.y, (self.frame.size.width-20.0)/2, 20.0)];
    
    [self.concatEmail setFont:FONT];
    
    [self addSubview:self.concatEmail];
    
    self.concatPhone = [[UILabel alloc] initWithFrame:CGRectMake(self.concatPeople.frame.origin.x, self.concatPeople.frame.origin.y+self.concatPeople.frame.size.height, (self.frame.size.width-20.0)/2, 20.0)];
    
    [self.concatPhone setFont:FONT];
    
    [self addSubview:self.concatPhone];
    
    self.phone = [[UILabel alloc] initWithFrame:CGRectMake(self.concatPhone.frame.origin.x+self.concatPhone.frame.size.width, self.concatPhone.frame.origin.y, (self.frame.size.width-20.0)/2, 20.0)];
    
    [self.phone setFont:FONT];
    
    [self addSubview:self.phone];

    
    [self.userName setText:[NSString stringWithFormat:@"用户名：%@",_appUserInfo.USER_NAME]];
    
    [self.userActive setText:[NSString stringWithFormat:@"活跃度：%@",_appUserInfo.ACTIVE_INDEX]];
    
    [self.userLevel setText:[NSString stringWithFormat:@"用户等级：%@",_appUserInfo.GRADE]];
    
    [self.registerTime setText:[NSString stringWithFormat:@"注册时间：%@",_appUserInfo.REG_TIME]];
    
    [self.notice setText:[NSString stringWithFormat:@"发布消息：%@",_appUserInfo.MSG_YES]];
    
    [self.queryInfo setText:[NSString stringWithFormat:@"查询消息：%@",_appUserInfo.QUERY_COUNT]];
    
    
     NSArray *contractData = [_table.CONTRACT componentsSeparatedByString:@"/"];
    
    [self.contract setText:[NSString stringWithFormat:@"发布人：%@",[contractData objectAtIndex:0]]];
    
    [self.address setText:[NSString stringWithFormat:@"目的地：%@",_table.DESTINATION]];;
    
    [self.contractPhone setText:[NSString stringWithFormat:@"联系方式：%@",[contractData objectAtIndex:1]]];;
    
    [self.especialRequest setText:[NSString stringWithFormat:@"其他要求：%@",_table.ESPECIAL_REQUEST]];;
    
    [self.stowageTime setText:[NSString stringWithFormat:@"提箱时间：%@",_table.STOWAGE_TIME]];;
    
    [self.chunkType setText:[NSString stringWithFormat:@"箱型：%@",_table.CHUNK_TYPE]];;
    
    [self.releaseTime setText:[NSString stringWithFormat:@"发布时间：%@",_table.RELEASE_TIME]];;
    
    [self.price setText:[NSString stringWithFormat:@"价格：%@",_table.PRICE]];;
    
    [self.infoType setText:[NSString stringWithFormat:@"信息类型：%@",_table.INFO_TYPE]];;
    
    [self.weight setText:[NSString stringWithFormat:@"重量：%@",_table.WEIGHT]];;
    
    [self.port setText:[NSString stringWithFormat:@"港口：%@",_table.PORT]];;
    
    [self.trafficType setText:[NSString stringWithFormat:@"进口：%@",_table.TRAFFIC_TYPE]];;
    
    
    [self.companyName setText:[NSString stringWithFormat:@"公司名称：%@",_releasePersonInfo.userCompanyName]];
    
    [self.companyAddress setText:[NSString stringWithFormat:@"公司地址：%@",_releasePersonInfo.companyPoision]];
    
    [self.companyType setText:[NSString stringWithFormat:@"公司类型：%@",_releasePersonInfo.companyType]];
    
    [self.concatPeople setText:[NSString stringWithFormat:@"联系人：%@",_releasePersonInfo.concatPerson]];
    
    [self.concatEmail setText:[NSString stringWithFormat:@"E_mail：%@",_releasePersonInfo.email]];
    
    [self.concatPhone setText:[NSString stringWithFormat:@"联系电话：%@",_releasePersonInfo.concatTel]];
    
    [self.phone setText:[NSString stringWithFormat:@"手机：%@",_releasePersonInfo.mobile]];
    
    
}


@end
