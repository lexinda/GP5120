//
//  PushViewDelegate.h
//  GP5120
//
//  Created by lele126 on 14-8-3.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PushViewDelegate <NSObject>

-(void)setupCarInfo;

-(void)successRedirectView;

-(void)showInfoDetailView;

-(void)showAcceptView;

@end
