//
//  HomeInfoModel.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/22.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeInfoModel : NSObject

@property(strong,nonatomic)NSString *oneField;

@property(strong,nonatomic)NSString *twoField;

@property(strong,nonatomic)NSString *queryTime;

@property(strong,nonatomic)NSString *userName;

@property(strong,nonatomic)NSString *type;

-(HomeInfoModel *)getHomeInfoModel:(NSDictionary *)dictionary;

-(HomeInfoModel *)getHomeInfoModelNoLogin;

@end
