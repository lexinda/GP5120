//
//  MemberDelegate.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/25.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MemberDelegate <NSObject>

-(void)confirm:(NSDictionary *)dictionary;

-(void)accusation:(NSDictionary *)dictionary;

@end
