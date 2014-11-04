//
//  ReleaseInfo.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/30.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "ReleaseInfo.h"

@implementation ReleaseInfo

@synthesize DESTINATION;

@synthesize CONTRACT;

@synthesize ESPECIAL_REQUEST;

@synthesize LAST_OUT;

@synthesize CHUNK_TYPE;

@synthesize RELEASE_TIME;

@synthesize PRICE;

@synthesize WEIGHT;

@synthesize PORT;

@synthesize TRAFFIC_TYPE;

@synthesize QUERY_COUNT;

@synthesize MSGTO_NUM;

@synthesize INFO_NO;
/////////////////////////////////

@synthesize FACTORY_CITY;

@synthesize STOWAGE_TIME;

@synthesize START;

@synthesize INFO_STATUS;

@synthesize RELEASE_PERSON;

@synthesize RELEASE_IP;

@synthesize TARGET_PROVINCE;

@synthesize TARGET_CITY;

@synthesize START_PROVINCE;

@synthesize START_CITY;

@synthesize LAST_IN;

@synthesize INFO_TYPE;

@synthesize OWNER_PROFIT;

@synthesize PROFIT_CONFIRM_TIME;

@synthesize PROFIT_BY;

-(ReleaseInfo *)getReleaseInfo:(NSDictionary *)dictionary{

    ReleaseInfo *releaseInfo = [[ReleaseInfo alloc] init];
    
    [releaseInfo setDESTINATION:[dictionary objectForKey:@"DESTINATION"]];
    
    [releaseInfo setCONTRACT:[dictionary objectForKey:@"CONTRACT"]];
    
    [releaseInfo setESPECIAL_REQUEST:[dictionary objectForKey:@"ESPECIAL_REQUEST"]];
    
    [releaseInfo setLAST_OUT:[dictionary objectForKey:@"LAST_OUT"]];
    
    [releaseInfo setCHUNK_TYPE:[dictionary objectForKey:@"CHUNK_TYPE"]];
    
    [releaseInfo setRELEASE_TIME:[dictionary objectForKey:@"RELEASE_TIME"]];
    
    [releaseInfo setPRICE:[dictionary objectForKey:@"PRICE"]];
    
    [releaseInfo setWEIGHT:[dictionary objectForKey:@"WEIGHT"]];
    
    [releaseInfo setPORT:[dictionary objectForKey:@"PORT"]];
    
    [releaseInfo setTRAFFIC_TYPE:[dictionary objectForKey:@"TRAFFIC_TYPE"]];
    
    [releaseInfo setQUERY_COUNT:[dictionary objectForKey:@"QUERY_COUNT"]];
    
    [releaseInfo setMSGTO_NUM:[dictionary objectForKey:@"MSGTO_NUM"]];
    
    [releaseInfo setINFO_NO:[dictionary objectForKey:@"INFO_NO"]];
    
    //////////////////////////////////////
    
    [releaseInfo setFACTORY_CITY:[dictionary objectForKey:@"FACTORY_CITY"]];
    
    [releaseInfo setSTOWAGE_TIME:[dictionary objectForKey:@"STOWAGE_TIME"]];
    
    [releaseInfo setSTART:[dictionary objectForKey:@"START"]];
    
    [releaseInfo setINFO_STATUS:[dictionary objectForKey:@"INFO_STATUS"]];
    
    [releaseInfo setRELEASE_PERSON:[dictionary objectForKey:@"RELEASE_PERSON"]];
    
    [releaseInfo setRELEASE_IP:[dictionary objectForKey:@"RELEASE_IP"]];
    
    [releaseInfo setTARGET_PROVINCE:[dictionary objectForKey:@"TARGET_PROVINCE"]];
    
    [releaseInfo setTARGET_CITY:[dictionary objectForKey:@"TARGET_CITY"]];
    
    [releaseInfo setSTART_PROVINCE:[dictionary objectForKey:@"START_PROVINCE"]];
    
    [releaseInfo setSTART_CITY:[dictionary objectForKey:@"START_CITY"]];
    
    [releaseInfo setLAST_IN:[dictionary objectForKey:@"LAST_IN"]];
    
    [releaseInfo setINFO_TYPE:[dictionary objectForKey:@"INFO_TYPE"]];
    
    [releaseInfo setOWNER_PROFIT:[dictionary objectForKey:@"OWNER_PROFIT"]];
    
    [releaseInfo setPROFIT_CONFIRM_TIME:[dictionary objectForKey:@"PROFIT_CONFIRM_TIME"]];
    
    [releaseInfo setPROFIT_BY:[dictionary objectForKey:@"PROFIT_BY"]];
    
    [releaseInfo setLevelType:@"1"];
    
    return releaseInfo;
    
}

-(ReleaseInfo *)getReleaseInfoDemo{

    ReleaseInfo *releaseInfo = [[ReleaseInfo alloc] init];
    
    [releaseInfo setDESTINATION:@"DESTINATION"];
    
    [releaseInfo setCONTRACT:@"CONTRACT"];
    
    [releaseInfo setESPECIAL_REQUEST:@"ESPECIAL_REQUEST"];
    
    [releaseInfo setLAST_OUT:@"LAST_OUT"];
    
    [releaseInfo setCHUNK_TYPE:@"CHUNK_TYPE"];
    
    [releaseInfo setRELEASE_TIME:@"RELEASE_TIME"];
    
    [releaseInfo setPRICE:@"PRICE"];
    
    [releaseInfo setTRAFFIC_TYPE:@"TRAFFIC_TYPE"];
    
    [releaseInfo setQUERY_COUNT:@"QUERY_COUNT"];
    
    [releaseInfo setMSGTO_NUM:@"MSGTO_NUM"];
    
    [releaseInfo setINFO_NO:@"INFO_NO"];
    
    ///////////////////////////////////////////
    
    [releaseInfo setFACTORY_CITY:@"FACTORY_CITY"];
    
    [releaseInfo setSTOWAGE_TIME:@"STOWAGE_TIME"];
    
    [releaseInfo setSTART:@"START"];
    
    [releaseInfo setINFO_STATUS:@"INFO_STATUS"];
    
    [releaseInfo setRELEASE_PERSON:@"RELEASE_PERSON"];
    
    [releaseInfo setRELEASE_IP:@"RELEASE_IP"];
    
    [releaseInfo setTARGET_PROVINCE:@"TARGET_PROVINCE"];
    
    [releaseInfo setTARGET_CITY:@"TARGET_CITY"];
    
    [releaseInfo setSTART_PROVINCE:@"START_PROVINCE"];
    
    [releaseInfo setSTART_CITY:@"START_CITY"];
    
    [releaseInfo setLAST_IN:@"LAST_IN"];
    
    [releaseInfo setINFO_TYPE:@"INFO_TYPE"];
    
    [releaseInfo setOWNER_PROFIT:@"OWNER_PROFIT"];
    
    [releaseInfo setPROFIT_CONFIRM_TIME:@"PROFIT_CONFIRM_TIME"];
    
    [releaseInfo setPROFIT_BY:@"PROFIT_BY"];
    
    [releaseInfo setLevelType:@"0"];
    
    return releaseInfo;
}

@end
