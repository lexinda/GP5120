//
//  RecommandCarTeamCell.h
//  GP5120
//
//  Created by 朱孟乐 on 14/11/2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppUserInfo.h"

#import "PushViewDelegate.h"

#import "ReleaseInfo.h"

@interface RecommandCarTeamCell : UITableViewCell

@property(strong,nonatomic)UILabel *_addressLabel;

@property(strong,nonatomic)UILabel *_addressInfoLabel;

@property(strong,nonatomic)UILabel *_boxTypelabel;

@property(strong,nonatomic)UILabel *_boxTypeInfoLabel;

@property(strong,nonatomic)UILabel *_dateLabel;

@property(strong,nonatomic)UILabel *_dateInfoLabel;

@property(strong,nonatomic)UILabel *_boxlabel;

@property(strong,nonatomic)UILabel *_boxInfoLabel;

@property(strong,nonatomic)UILabel *_inputLabel;

@property(strong,nonatomic)UILabel *_inputInfoLabel;

@property(strong,nonatomic)UILabel *_peoplelabel;

@property(strong,nonatomic)UILabel *_peopleInfoLabel;

@property(strong,nonatomic)UILabel *_rankLabel;

@property(strong,nonatomic)UIImageView *_rankInfo;

@property(strong,nonatomic)UILabel *_createTimelabel;

@property(strong,nonatomic)UILabel *_createTimeInfoLabel;

@property(strong,nonatomic)UILabel *_companyIntro;

@property(strong,nonatomic)UILabel *_companyIntroInfo;

@property(strong,nonatomic)UILabel *_queryTimesLabel;

@property(strong,nonatomic)UILabel *_queryTimesInfoLabel;

@property(strong,nonatomic)UILabel *_smsTimeslabel;

@property(strong,nonatomic)UILabel *_smsTimeInfoLabel;

@property(strong,nonatomic)UILabel *_systemTimesLabel;

@property(strong,nonatomic)UILabel *_systemTimesInfoLabel;

@property(strong,nonatomic)id<PushViewDelegate> _pushViewDelegate;

@property(strong,nonatomic)ReleaseInfo *_releaseInfo;

-(void)setAppUserInfo:(AppUserInfo *)_appUserInfo;

@end
