//
//  PhotoSetViewController.h
//  GP5120
//
//  Created by lele126 on 14-8-17.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASINetworkQueue.h"

#import "ASIFormDataRequest.h"

@interface PhotoSetViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(strong,nonatomic)NSString *_filePath;

@property(strong,nonatomic)NSString *_server;

@property(strong,nonatomic)UIButton *_takePicture;

@property(strong,nonatomic)UIButton *_uploadPicture;

@end
