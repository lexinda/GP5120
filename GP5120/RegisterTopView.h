//
//  RegisterTopView.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PushViewDelegate.h"

@interface RegisterTopView : UIView

@property(strong,nonatomic)UIBezierPath *_activePath;

@property(strong,nonatomic)NSMutableDictionary *_pathData;

@property(strong,nonatomic)id<PushViewDelegate> _pushViewDelegate;

@end
