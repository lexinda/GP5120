//
//  UsrInGpMemberOrder.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/23.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "UsrInGpMemberOrder.h"

@implementation UsrInGpMemberOrder

@synthesize id;

@synthesize infoNo;

@synthesize usr;

@synthesize summary;

@synthesize contact;

@synthesize phone;

@synthesize isBid;

@synthesize insertTime;

@synthesize remark;

-(UsrInGpMemberOrder *)getUsrInGpMemberOrder:(NSDictionary *)dictionary{
    
    UsrInGpMemberOrder *usrInGpMemberOrder = [[UsrInGpMemberOrder alloc] init];
    
    [usrInGpMemberOrder setId:[dictionary objectForKey:@"id"]];
    
    [usrInGpMemberOrder setInfoNo:[dictionary objectForKey:@"info_no"]];
    
    [usrInGpMemberOrder setUsr:[dictionary objectForKey:@"usr"]];
    
    [usrInGpMemberOrder setSummary:[dictionary objectForKey:@"summary"]];
    
    [usrInGpMemberOrder setContact:[dictionary objectForKey:@"contact"]];
    
    [usrInGpMemberOrder setPhone:[dictionary objectForKey:@"phone"]];
    
    [usrInGpMemberOrder setIsBid:[dictionary objectForKey:@"is_bid"]];
    
    [usrInGpMemberOrder setInsertTime:[dictionary objectForKey:@"insert_time"]];
    
    [usrInGpMemberOrder setRemark:[dictionary objectForKey:@"remark"]];
    
    return usrInGpMemberOrder;
    
}

@end