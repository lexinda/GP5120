//
//  AdList.h
//  GP5120
//
//  Created by 朱孟乐 on 14-10-16.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdList : NSObject

@property(strong,nonatomic)NSString *PORT;

@property(strong,nonatomic)NSString *ID;

@property(strong,nonatomic)NSString *AD_TYPE;

@property(strong,nonatomic)NSString *SEQ;

@property(strong,nonatomic)NSString *AD_CONTENT;

@property(strong,nonatomic)NSString *EFFECTIVE_FROM;

@property(strong,nonatomic)NSString *EFFECTIVE_TO;

-(AdList *)getAdList:(NSDictionary *)adListDictionary;

@end
