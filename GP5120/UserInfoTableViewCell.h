//
//  UserInfoTableViewCell.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/25.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppUserInfo.h"

@interface UserInfoTableViewCell : UITableViewCell

@property(strong,nonatomic)UIButton *gotoPhoto;

@property(strong,nonatomic)UIImageView *photoImageView;

@property(strong,nonatomic)UILabel *userName;

@property(strong,nonatomic)UILabel *userActive;

@property(strong,nonatomic)UILabel *userLevel;

@property(strong,nonatomic)UILabel *registerTime;

@property(strong,nonatomic)UILabel *notice;

@property(strong,nonatomic)UILabel *queryInfo;

@property(strong,nonatomic)UILabel *companyName;

@property(strong,nonatomic)UILabel *companyAddress;

@property(strong,nonatomic)UILabel *companyType;

@property(strong,nonatomic)UILabel *concatPeople;

@property(strong,nonatomic)UILabel *concatEmail;

@property(strong,nonatomic)UILabel *concatPhone;

@property(strong,nonatomic)UILabel *phone;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier appUserInfo:(AppUserInfo *)appUserInfo;

@end
