//
//  ViewReleaseInfoDriverOrder.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/23.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "ViewReleaseInfoDriverOrder.h"

@implementation ViewReleaseInfoDriverOrder

@synthesize releasePerson;
@synthesize id;
@synthesize infoNo;
@synthesize usr;
@synthesize realName;
@synthesize phone;
@synthesize carId;
@synthesize remark;
@synthesize insertTime;

-(ViewReleaseInfoDriverOrder *)getViewReleaseInfoDriverOrder:(NSDictionary *)dictionary{

    ViewReleaseInfoDriverOrder *viewReleaseInfoDriverOrder = [[ViewReleaseInfoDriverOrder alloc] init];
    
    [viewReleaseInfoDriverOrder setReleasePerson:[dictionary objectForKey:@"RELEASE_PERSON"]];
    
    [viewReleaseInfoDriverOrder setId:[dictionary objectForKey:@"id"]];
    
    [viewReleaseInfoDriverOrder setInfoNo:[dictionary objectForKey:@"info_no"]];
    
    [viewReleaseInfoDriverOrder setUsr:[dictionary objectForKey:@"usr"]];
    
    [viewReleaseInfoDriverOrder setRealName:[dictionary objectForKey:@"real_name"]];
    
    [viewReleaseInfoDriverOrder setPhone:[dictionary objectForKey:@"phone"]];
    
    [viewReleaseInfoDriverOrder setCarId:[dictionary objectForKey:@"car_id"]];
    
    [viewReleaseInfoDriverOrder setRemark:[dictionary objectForKey:@"remark"]];
    
    [viewReleaseInfoDriverOrder setInsertTime:[dictionary objectForKey:@"insert_time"]];
    
    return viewReleaseInfoDriverOrder;
    
}

@end
