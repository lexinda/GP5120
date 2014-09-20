//
//  TopButtonView.h
//  GP5120
//
//  Created by lele126 on 14-8-2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PushViewDelegate.h"

@interface TopButtonView : UIView

@property(strong,nonatomic)UIBezierPath *_activePath;

@property(strong,nonatomic)NSMutableDictionary *_pathData;

@property(strong,nonatomic)id<PushViewDelegate> _pushViewDelegate;

@end
