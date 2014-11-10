//
//  AppUserInfo.m
//  GP5120
//
//  Created by 朱孟乐 on 14-10-16.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "AppUserInfo.h"

@implementation AppUserInfo

@synthesize USER_NAME;

@synthesize USER_PASSWORD;

@synthesize USER_COMPANY_NAME;

@synthesize E_MAIL;

@synthesize CONTACT_PERSON;

@synthesize CONTACT_TEL;

@synthesize COMPANY_INTRODUCTION;

@synthesize COMPANY_PROVINCE;

@synthesize COMPANY_CITY;

@synthesize COMPANY_SECTION;

@synthesize COMPANY_POISION;

@synthesize LAST_LOGIN_IP;

@synthesize LAST_LOGIN_TIME;

@synthesize LOGIN_COUNT;

@synthesize RELEASE_COUNT;

@synthesize PORT;

@synthesize QUESTION;

@synthesize ANSWER;

@synthesize COMPANY_TYPE;

@synthesize LOGIN_COUNT_TIME;

@synthesize REG_TIME;

@synthesize MOBILE;

@synthesize MSG_YES;

@synthesize FEE_SUPLUS;

@synthesize XUNGUI_MSG_YES;

@synthesize DES_ORDERED;

@synthesize PORT_ORDERED;

@synthesize ACTIVE_INDEX;

@synthesize MSN;

@synthesize QQ;

@synthesize VERIFY_YES;

@synthesize VERIFY_TIME;

@synthesize QUERY_COUNT;

@synthesize FEE_TYPE;

@synthesize GRADE;

@synthesize FEE_PerMonth;

@synthesize INCOME;

@synthesize DEFRAY;

@synthesize levelType;

-(AppUserInfo *)getAppUserInfo:(NSDictionary *)appUserInfoDictionary{
    
    AppUserInfo *appUserInfo = [[AppUserInfo alloc] init];
    
    [appUserInfo setUSER_NAME:[appUserInfoDictionary objectForKey:@"USER_NAME"]];
    
    [appUserInfo setUSER_PASSWORD:[appUserInfoDictionary objectForKey:@"USER_PASSWORD"]];
    
    [appUserInfo setUSER_COMPANY_NAME:[appUserInfoDictionary objectForKey:@"USER_COMPANY_NAME"]];
    
    [appUserInfo setE_MAIL:[appUserInfoDictionary objectForKey:@"E_MAIL"]];
    
    [appUserInfo setCONTACT_PERSON:[appUserInfoDictionary objectForKey:@"CONTACT_PERSON"]];
    
    [appUserInfo setCONTACT_TEL:[appUserInfoDictionary objectForKey:@"CONTACT_TEL"]];
    
    [appUserInfo setCOMPANY_INTRODUCTION:[appUserInfoDictionary objectForKey:@"COMPANY_INTRODUCTION"]];
    
    [appUserInfo setCOMPANY_PROVINCE:[appUserInfoDictionary objectForKey:@"COMPANY_PROVINCE"]];
    
    [appUserInfo setCOMPANY_CITY:[appUserInfoDictionary objectForKey:@"COMPANY_CITY"]];
    
    [appUserInfo setCOMPANY_SECTION:[appUserInfoDictionary objectForKey:@"COMPANY_SECTION"]];
    
    [appUserInfo setCOMPANY_POISION:[appUserInfoDictionary objectForKey:@"COMPANY_POISION"]];
    
    [appUserInfo setLAST_LOGIN_IP:[appUserInfoDictionary objectForKey:@"LAST_LOGIN_IP"]];
    
    [appUserInfo setLAST_LOGIN_TIME:[appUserInfoDictionary objectForKey:@"LAST_LOGIN_TIME"]];
    
    [appUserInfo setLOGIN_COUNT:[appUserInfoDictionary objectForKey:@"LOGIN_COUNT"]];
    
    [appUserInfo setRELEASE_COUNT:[appUserInfoDictionary objectForKey:@"RELEASE_COUNT"]];
    
    [appUserInfo setPORT:[appUserInfoDictionary objectForKey:@"PORT"]];
    
    [appUserInfo setQUESTION:[appUserInfoDictionary objectForKey:@"QUESTION"]];
    
    [appUserInfo setANSWER:[appUserInfoDictionary objectForKey:@"ANSWER"]];
    
    [appUserInfo setCOMPANY_TYPE:[appUserInfoDictionary objectForKey:@"COMPANY_TYPE"]];
    
    [appUserInfo setLOGIN_COUNT_TIME:[appUserInfoDictionary objectForKey:@"LOGIN_COUNT_TIME"]];
    
    [appUserInfo setREG_TIME:[appUserInfoDictionary objectForKey:@"REG_TIME"]];
    
    [appUserInfo setMOBILE:[appUserInfoDictionary objectForKey:@"MOBILE"]];
    
    [appUserInfo setMSG_YES:[appUserInfoDictionary objectForKey:@"MSG_YES"]];
    
    [appUserInfo setFEE_SUPLUS:[appUserInfoDictionary objectForKey:@"FEE_SUPLUS"]];
    
    [appUserInfo setXUNGUI_MSG_YES:[appUserInfoDictionary objectForKey:@"XUNGUI_MSG_YES"]];
    
    [appUserInfo setDES_ORDERED:[appUserInfoDictionary objectForKey:@"DES_ORDERED"]];
    
    [appUserInfo setPORT_ORDERED:[appUserInfoDictionary objectForKey:@"PORT_ORDERED"]];
    
    [appUserInfo setACTIVE_INDEX:[appUserInfoDictionary objectForKey:@"ACTIVE_INDEX"]];
    
    [appUserInfo setMSN:[appUserInfoDictionary objectForKey:@"MSN"]];
    
    [appUserInfo setQQ:[appUserInfoDictionary objectForKey:@"QQ"]];
    
    [appUserInfo setVERIFY_YES:[appUserInfoDictionary objectForKey:@"VERIFY_YES"]];
    
    [appUserInfo setVERIFY_TIME:[appUserInfoDictionary objectForKey:@"VERIFY_TIME"]];
    
    [appUserInfo setQUERY_COUNT:[appUserInfoDictionary objectForKey:@"QUERY_COUNT"]];
    
    [appUserInfo setFEE_TYPE:[appUserInfoDictionary objectForKey:@"FEE_TYPE"]];
    
    [appUserInfo setGRADE:[appUserInfoDictionary objectForKey:@"GRADE"]];
    
    [appUserInfo setFEE_PerMonth:[appUserInfoDictionary objectForKey:@"FEE_PerMonth"]];
    
    [appUserInfo setINCOME:[appUserInfoDictionary objectForKey:@"INCOME"]];
    
    [appUserInfo setDEFRAY:[appUserInfoDictionary objectForKey:@"DEFRAY"]];
    
    [appUserInfo setLevelType:@"1"];
    
    return appUserInfo;
}

-(AppUserInfo *)getAppUserInfoDemo{
    
    AppUserInfo *appUserInfo = [[AppUserInfo alloc] init];
    
    [appUserInfo setUSER_NAME:@"USER_NAME"];
    
    [appUserInfo setUSER_PASSWORD:@"USER_PASSWORD"];
    
    [appUserInfo setUSER_COMPANY_NAME:@"USER_COMPANY_NAME"];
    
    [appUserInfo setE_MAIL:@"E_MAIL"];
    
    [appUserInfo setCONTACT_PERSON:@"CONTACT_PERSON"];
    
    [appUserInfo setCONTACT_TEL:@"CONTACT_TEL"];
    
    [appUserInfo setCOMPANY_INTRODUCTION:@"COMPANY_INTRODUCTION"];
    
    [appUserInfo setCOMPANY_PROVINCE:@"COMPANY_PROVINCE"];
    
    [appUserInfo setCOMPANY_CITY:@"COMPANY_CITY"];
    
    [appUserInfo setCOMPANY_SECTION:@"COMPANY_SECTION"];
    
    [appUserInfo setCOMPANY_POISION:@"COMPANY_POISION"];
    
    [appUserInfo setLAST_LOGIN_IP:@"LAST_LOGIN_IP"];
    
    [appUserInfo setLAST_LOGIN_TIME:@"LAST_LOGIN_TIME"];
    
    [appUserInfo setLOGIN_COUNT:@"LOGIN_COUNT"];
    
    [appUserInfo setRELEASE_COUNT:@"RELEASE_COUNT"];
    
    [appUserInfo setPORT:@"PORT"];
    
    [appUserInfo setQUESTION:@"QUESTION"];
    
    [appUserInfo setANSWER:@"ANSWER"];
    
    [appUserInfo setCOMPANY_TYPE:@"COMPANY_TYPE"];
    
    [appUserInfo setLOGIN_COUNT_TIME:@"LOGIN_COUNT_TIME"];
    
    [appUserInfo setREG_TIME:@"REG_TIME"];
    
    [appUserInfo setMOBILE:@"MOBILE"];
    
    [appUserInfo setMSG_YES:@"MSG_YES"];
    
    [appUserInfo setFEE_SUPLUS:@"FEE_SUPLUS"];
    
    [appUserInfo setXUNGUI_MSG_YES:@"XUNGUI_MSG_YES"];
    
    [appUserInfo setDES_ORDERED:@"DES_ORDERED"];
    
    [appUserInfo setPORT_ORDERED:@"PORT_ORDERED"];
    
    [appUserInfo setACTIVE_INDEX:@"ACTIVE_INDEX"];
    
    [appUserInfo setMSN:@"MSN"];
    
    [appUserInfo setQQ:@"QQ"];
    
    [appUserInfo setVERIFY_YES:@"VERIFY_YES"];
    
    [appUserInfo setVERIFY_TIME:@"VERIFY_TIME"];

    [appUserInfo setQUERY_COUNT:@"QUERY_COUNT"];
    
    [appUserInfo setFEE_TYPE:@"FEE_TYPE"];
    
    [appUserInfo setGRADE:@"GRADE"];
    
    [appUserInfo setFEE_PerMonth:@"FEE_PerMonth"];
    
    [appUserInfo setINCOME:@"INCOME"];
    
    [appUserInfo setDEFRAY:@"DEFRAY"];
    
    [appUserInfo setLevelType:@"0"];
    
    return appUserInfo;
}


@end
