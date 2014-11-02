//
//  AcceptInfoViewController.h
//  GP5120
//
//  Created by lele126 on 14-8-13.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIDevice+Resolutions.h"

#import "CarInfoTopView.h"

#import "CarInfoCell.h"

#import "CarInfoAcceptBottomView.h"

#import "ReleaseInfo.h"

#import "MBProgressHUD.h"

#import "AppUserInfo.h"

#import "ReleasePersonInfo.h"

#import "ASIFormDataRequest.h"

#import "JSONKit.h"

@interface AcceptInfoViewController : UIViewController<MBProgressHUDDelegate>

@property(strong,nonatomic)AppUserInfo *_appUserInfo;

@property(strong,nonatomic)ReleasePersonInfo *_releasePersonInfo;

@property(strong,nonatomic)ReleaseInfo *_releaseInfo;

@property(strong,nonatomic)MBProgressHUD *_hud;

@end
