//
//  MapDataViewController.h
//  GP5120
//
//  Created by 朱孟乐 on 14-9-14.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface MapDataViewController : UIViewController<BMKMapViewDelegate>
@property(strong,nonatomic)BMKMapView *_mapView;
@end
