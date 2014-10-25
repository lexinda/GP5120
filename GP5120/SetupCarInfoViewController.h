//
//  SetupCarInfoViewController.h
//  GP5120
//
//  Created by lele126 on 14-8-3.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FootButtonView.h"

#import "SuccessViewController.h"

#import "HomeInfoModel.h"

@interface SetupCarInfoViewController : UIViewController<UITextFieldDelegate>

@property(strong,nonatomic)UIScrollView *_mainScrollView;

@property(strong,nonatomic)HomeInfoModel *_homeInfoModel;

@end
