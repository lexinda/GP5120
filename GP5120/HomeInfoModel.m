//
//  HomeInfoModel.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/22.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "HomeInfoModel.h"

@implementation HomeInfoModel

@synthesize oneField;

@synthesize twoField;

@synthesize queryTime;

@synthesize userName;

@synthesize portType;

@synthesize type;

-(HomeInfoModel *)getHomeInfoModel:(NSDictionary *)dictionary{

    HomeInfoModel *homeInfoModel = [[HomeInfoModel alloc] init];
    
    [homeInfoModel setOneField:[dictionary objectForKey:@"oneField"]];
    
    [homeInfoModel setTwoField:[dictionary objectForKey:@"twoField"]];
    
    [homeInfoModel setQueryTime:[dictionary objectForKey:@"queryTime"]];
    
    [homeInfoModel setUserName:[dictionary objectForKey:@"userName"]];
    
    [homeInfoModel setPortType:[dictionary objectForKey:@"find_type"]];
    
    [homeInfoModel setType:@"1"];
    
    return homeInfoModel;
    
}

-(HomeInfoModel *)getHomeInfoModelNoLogin{

    HomeInfoModel *homeInfoModel = [[HomeInfoModel alloc] init];
    
    [homeInfoModel setOneField:@"notlogin"];
    
    [homeInfoModel setTwoField:@"notlogin"];
    
    [homeInfoModel setQueryTime:@"notlogin"];
    
    [homeInfoModel setUserName:@"notlogin"];
    
    [homeInfoModel setUserName:@"find_type"];
    
    [homeInfoModel setType:@"0"];
    
    NSLog(@"%@",homeInfoModel.oneField);
    
    return homeInfoModel;
    
}

@end
