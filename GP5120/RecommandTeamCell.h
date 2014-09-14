//
//  RecommandTeamCell.h
//  GP5120
//
//  Created by lele126 on 14-8-9.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommandTeam.h"

#import "PushViewDelegate.h"

@interface RecommandTeamCell : UITableViewCell

@property(strong,nonatomic)id<PushViewDelegate> _pushViewDelegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withRecomandTeam:(RecommandTeam *)_recommadTeam;

@end
