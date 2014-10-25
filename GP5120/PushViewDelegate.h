//
//  PushViewDelegate.h
//  GP5120
//
//  Created by lele126 on 14-8-3.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HomeInfoModel.h"

@protocol PushViewDelegate <NSObject>

-(void)successRedirectView;

-(void)showInfoDetailView;

-(void)showAcceptView;

-(void)swapView:(int)id;

-(void)swapRegisterView:(int)id;

-(void)showCarDetail;

-(void)showDataPicker;

-(void)getDatePickerViewData:(NSString *)data;

-(void)popToLoginView;

-(void)commitRegisterInfo;

-(void)commitSimpleRegisterInfo;

-(void)inputBegin:(id)sender;

-(void)inputEnd;

-(void)localPhoto;

-(void)takePhoto;

-(void)loginAndRegister;

-(void)pushCarInfoView:(HomeInfoModel *)homeInfoModel;

@end
