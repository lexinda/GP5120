//
//  AppUserInfo.h
//  GP5120
//
//  Created by 朱孟乐 on 14-10-16.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUserInfo : NSObject

@property(strong,nonatomic)NSString *USER_NAME;

@property(strong,nonatomic)NSString *USER_PASSWORD;

@property(strong,nonatomic)NSString *USER_COMPANY_NAME;

@property(strong,nonatomic)NSString *E_MAIL;

@property(strong,nonatomic)NSString *CONTACT_PERSON;

@property(strong,nonatomic)NSString *CONTACT_TEL;

@property(strong,nonatomic)NSString *COMPANY_INTRODUCTION;

@property(strong,nonatomic)NSString *COMPANY_PROVINCE;

@property(strong,nonatomic)NSString *COMPANY_CITY;

@property(strong,nonatomic)NSString *COMPANY_SECTION;

@property(strong,nonatomic)NSString *COMPANY_POISION;

@property(strong,nonatomic)NSString *LAST_LOGIN_IP;

@property(strong,nonatomic)NSString *LAST_LOGIN_TIME;

@property(strong,nonatomic)NSString *LOGIN_COUNT;

@property(strong,nonatomic)NSString *RELEASE_COUNT;

@property(strong,nonatomic)NSString *PORT;

@property(strong,nonatomic)NSString *QUESTION;

@property(strong,nonatomic)NSString *ANSWER;

@property(strong,nonatomic)NSString *COMPANY_TYPE;

@property(strong,nonatomic)NSString *LOGIN_COUNT_TIME;

@property(strong,nonatomic)NSString *REG_TIME;

@property(strong,nonatomic)NSString *MOBILE;

@property(strong,nonatomic)NSString *MSG_YES;

@property(strong,nonatomic)NSString *FEE_SUPLUS;

@property(strong,nonatomic)NSString *XUNGUI_MSG_YES;

@property(strong,nonatomic)NSString *DES_ORDERED;

@property(strong,nonatomic)NSString *PORT_ORDERED;

@property(strong,nonatomic)NSString *ACTIVE_INDEX;

@property(strong,nonatomic)NSString *MSN;

@property(strong,nonatomic)NSString *QQ;

@property(strong,nonatomic)NSString *VERIFY_YES;

@property(strong,nonatomic)NSString *VERIFY_TIME;

@property(strong,nonatomic)NSString *QUERY_COUNT;

@property(strong,nonatomic)NSString *FEE_TYPE;

@property(strong,nonatomic)NSString *GRADE;

@property(strong,nonatomic)NSString *FEE_PerMonth;

@property(strong,nonatomic)NSString *levelType;

-(AppUserInfo *)getAppUserInfo:(NSDictionary *)appUserInfoDictionary;

-(AppUserInfo *)getAppUserInfoDemo;

@end
