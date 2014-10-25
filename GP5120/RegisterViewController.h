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

#import "MBProgressHUD.h"

#import "JSONKit.h"

#import "AdList.h"

@interface RegisterViewController : UIViewController<PushViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate>

@property(strong,nonatomic)UIScrollView *_meddleView;

@property(strong,nonatomic)NSString *_filePath;

@property(strong,nonatomic)UITableView *_adTable;

@property(strong,nonatomic)NSMutableArray *_adData;

@property(strong,nonatomic)MBProgressHUD *_hub;

@end
