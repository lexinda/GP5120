//
//  CarInfoBottomCell.h
//  GP5120
//
//  Created by lele126 on 14-8-7.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CarInfoCell.h"

#import "PushViewDelegate.h"

@interface CarInfoBottomCell : UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withCarInfoCell:(CarInfoCell*)_carInfoCell;

@property(strong,nonatomic)id<PushViewDelegate> _pushViewDelegate;

@end
