//
//  ReleasePersonInfo.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/26.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "ReleasePersonInfo.h"

@implementation ReleasePersonInfo

@synthesize userName;

@synthesize userCompanyName;

@synthesize companyPoision;

@synthesize companyType;

@synthesize concatPerson;

@synthesize email;

@synthesize concatTel;

@synthesize mobile;

-(ReleasePersonInfo *)getReleasePersonInfo:(NSDictionary *)dictionary{

    ReleasePersonInfo *releasePersonInfo = [[ReleasePersonInfo alloc] init];
    
    [releasePersonInfo setUserName:[dictionary objectForKey:@"USER_NAME"]];
    
    [releasePersonInfo setUserCompanyName:[dictionary objectForKey:@"USER_COMPANY_NAME"]];
    
    [releasePersonInfo setCompanyPoision:[dictionary objectForKey:@"COMPANY_POISION"]];
    
    [releasePersonInfo setCompanyType:[dictionary objectForKey:@"COMPANY_TYPE"]];
    
    [releasePersonInfo setConcatPerson:[dictionary objectForKey:@"CONTACT_PERSON"]];
    
    [releasePersonInfo setEmail:[dictionary objectForKey:@"E_MAIL"]];
    
    [releasePersonInfo setConcatTel:[dictionary objectForKey:@"CONTACT_TEL"]];
    
    [releasePersonInfo setMobile:[dictionary objectForKey:@"MOBILE"]];
    
    return releasePersonInfo;
    
}

@end
