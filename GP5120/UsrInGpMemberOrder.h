//
//  UsrInGpMemberOrder.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/23.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UsrInGpMemberOrder : NSObject

@property(strong,nonatomic)NSString *id;

@property(strong,nonatomic)NSString *infoNo;

@property(strong,nonatomic)NSString *usr;

@property(strong,nonatomic)NSString *summary;

@property(strong,nonatomic)NSString *contact;

@property(strong,nonatomic)NSString *phone;

@property(strong,nonatomic)NSString *isBid;

@property(strong,nonatomic)NSString *insertTime;

@property(strong,nonatomic)NSString *remark;

-(UsrInGpMemberOrder *)getUsrInGpMemberOrder:(NSDictionary *)dictionary;

@end
