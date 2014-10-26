//
//  ReleasePersonInfo.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/26.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReleasePersonInfo : NSObject

@property(strong,nonatomic)NSString *userName;

@property(strong,nonatomic)NSString *userCompanyName;

@property(strong,nonatomic)NSString *companyPoision;

@property(strong,nonatomic)NSString *companyType;

@property(strong,nonatomic)NSString *concatPerson;

@property(strong,nonatomic)NSString *email;

@property(strong,nonatomic)NSString *concatTel;

@property(strong,nonatomic)NSString *mobile;

-(ReleasePersonInfo *)getReleasePersonInfo:(NSDictionary *)dictionary;

@end
