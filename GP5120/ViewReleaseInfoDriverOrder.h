//
//  ViewReleaseInfoDriverOrder.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/23.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewReleaseInfoDriverOrder : NSObject

@property(strong,nonatomic)NSString *releasePerson;
@property(strong,nonatomic)NSString *id;
@property(strong,nonatomic)NSString *infoNo;
@property(strong,nonatomic)NSString *usr;
@property(strong,nonatomic)NSString *realName;
@property(strong,nonatomic)NSString *phone;
@property(strong,nonatomic)NSString *carId;
@property(strong,nonatomic)NSString *remark;
@property(strong,nonatomic)NSString *insertTime;
-(ViewReleaseInfoDriverOrder *)getViewReleaseInfoDriverOrder:(NSDictionary *)dictionary;
@end
