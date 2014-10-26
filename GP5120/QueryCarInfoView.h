//
//  QueryCarInfoView.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/26.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppUserInfo.h"

#import "Table.h"

#import "ReleasePersonInfo.h"

@interface QueryCarInfoView : UIView

@property(strong,nonatomic)AppUserInfo *_appUserInfo;

@property(strong,nonatomic)Table *_table;

@property(strong,nonatomic)ReleasePersonInfo *_releasePersonInfo;

@property(strong,nonatomic)UIButton *gotoPhoto;

@property(strong,nonatomic)UIImageView *photoImageView;

@property(strong,nonatomic)UILabel *userName;

@property(strong,nonatomic)UILabel *userActive;

@property(strong,nonatomic)UILabel *userLevel;

@property(strong,nonatomic)UILabel *registerTime;

@property(strong,nonatomic)UILabel *notice;

@property(strong,nonatomic)UILabel *queryInfo;


@property(strong,nonatomic)UILabel *contract;

@property(strong,nonatomic)UILabel *address;

@property(strong,nonatomic)UILabel *contractPhone;

@property(strong,nonatomic)UILabel *especialRequest;

@property(strong,nonatomic)UILabel *stowageTime;

@property(strong,nonatomic)UILabel *chunkType;

@property(strong,nonatomic)UILabel *releaseTime;

@property(strong,nonatomic)UILabel *price;

@property(strong,nonatomic)UILabel *infoType;

@property(strong,nonatomic)UILabel *weight;

@property(strong,nonatomic)UILabel *port;

@property(strong,nonatomic)UILabel *trafficType;


@property(strong,nonatomic)UILabel *companyName;

@property(strong,nonatomic)UILabel *companyAddress;

@property(strong,nonatomic)UILabel *companyType;

@property(strong,nonatomic)UILabel *concatPeople;

@property(strong,nonatomic)UILabel *concatEmail;

@property(strong,nonatomic)UILabel *concatPhone;

@property(strong,nonatomic)UILabel *phone;

@end
