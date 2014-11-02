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
    
    [releaseInfo setLevelType:@"0"];
    
    return releaseInfo;
}

@end
