//
//  TreeViewNode.h
//  GP5120
//
//  Created by lele126 on 14-8-12.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeViewNode : NSObject

@property(nonatomic) NSUInteger nodeLevel;

@property(nonatomic)BOOL isExpanded;

@property(nonatomic,strong)id nodeObject;

@property(strong,nonatomic)NSMutableArray *nodeChildren;

@property(nonatomic)NSUInteger index;

@end
