//
//  AdList.m
//  GP5120
//
//  Created by 朱孟乐 on 14-10-16.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "AdList.h"

@implementation AdList

@synthesize PORT;

@synthesize ID;

@synthesize AD_TYPE;

@synthesize SEQ;

@synthesize AD_CONTENT;

@synthesize EFFECTIVE_FROM;

@synthesize EFFECTIVE_TO;

-(AdList *)getAdList:(NSDictionary *)adListDictionary{
    
    AdList *adList = [[AdList alloc] init];
    
    [adList setPORT:[adListDictionary objectForKey:@"PORT"]];
    
    [adList setID:[adListDictionary objectForKey:@"ID"]];
    
    [adList setAD_TYPE:[adListDictionary objectForKey:@"AD_TYPE"]];
    
    [adList setSEQ:[adListDictionary objectForKey:@"SEQ"]];
    
    [adList setAD_CONTENT:[adListDictionary objectForKey:@"AD_CONTENT"]];
    
    [adList setEFFECTIVE_FROM:[adListDictionary objectForKey:@"EFFECTIVE_FROM"]];
    
    [adList setEFFECTIVE_TO:[adListDictionary objectForKey:@"EFFECTIVE_TO"]];
    
    return adList;
    
}

@end
