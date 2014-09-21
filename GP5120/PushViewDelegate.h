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

-(void)swapView:(int)id;

-(void)showCarDetail;

-(void)showDataPicker;

-(void)getDatePickerViewData:(NSString *)data;

@end
