//
//  RegisterViewController.h
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RegisterTopView.h"

#import "FootButtonView.h"

#import "RegisterView.h"

#import "RegisterDetailView.h"

#import "RegisterPhotoView.h"

#import "ASINetworkQueue.h"

#import "ASIFormDataRequest.h"

@interface RegisterViewController : UIViewController<PushViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(strong,nonatomic)UIScrollView *_meddleView;

@property(strong,nonatomic)NSString *_filePath;

@end
