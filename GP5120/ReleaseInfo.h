//
//  ReleaseInfo.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/30.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReleaseInfo : NSObject

@property(strong,nonatomic)NSString *DESTINATION;

@property(strong,nonatomic)NSString *CONTRACT;

@property(strong,nonatomic)NSString *ESPECIAL_REQUEST;

@property(strong,nonatomic)NSString *LAST_OUT;

@property(strong,nonatomic)NSString *CHUNK_TYPE;

@property(strong,nonatomic)NSString *RELEASE_TIME;

@property(strong,nonatomic)NSString *PRICE;

@property(strong,nonatomic)NSString *WEIGHT;

@property(strong,nonatomic)NSString *PORT;

@property(strong,nonatomic)NSString *TRAFFIC_TYPE;

@property(strong,nonatomic)NSString *QUERY_COUNT;

@property(strong,nonatomic)NSString *MSGTO_NUM;

@property(strong,nonatomic)NSString *INFO_NO;

////////////////////////////////////
@property(strong,nonatomic)NSString *FACTORY_CITY;

@property(strong,nonatomic)NSString *STOWAGE_TIME;

@property(strong,nonatomic)NSString *START;

@property(strong,nonatomic)NSString *INFO_STATUS;

@property(strong,nonatomic)NSString *RELEASE_PERSON;

@property(strong,nonatomic)NSString *RELEASE_IP;

@property(strong,nonatomic)NSString *TARGET_PROVINCE;

@property(strong,nonatomic)NSString *TARGET_CITY;

@property(strong,nonatomic)NSString *START_PROVINCE;

@property(strong,nonatomic)NSString *START_CITY;

@property(strong,nonatomic)NSString *LAST_IN;

@property(strong,nonatomic)NSString *INFO_TYPE;

@property(strong,nonatomic)NSString *OWNER_PROFIT;

@property(strong,nonatomic)NSString *PROFIT_CONFIRM_TIME;

@property(strong,nonatomic)NSString *PROFIT_BY;



@property(strong,nonatomic)NSString *levelType;

-(ReleaseInfo *)getReleaseInfo:(NSDictionary *)dictionary;

-(ReleaseInfo *)getReleaseInfoDemo;
@end
