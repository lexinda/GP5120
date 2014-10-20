//
//  RegisterPhotoView.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PushViewDelegate.h"

@interface RegisterPhotoView : UIView

@property(strong,nonatomic)UIButton *_takePicture;

@property(strong,nonatomic)UIButton *_uploadPicture;

@property(strong,nonatomic)id<PushViewDelegate> _pushViewDelegate;

@end
