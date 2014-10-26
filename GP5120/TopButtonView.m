//
//  TopButtonView.m
//  GP5120
//
//  Created by lele126 on 14-8-2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "TopButtonView.h"

#import <QuartzCore/QuartzCore.h>

@implementation TopButtonView

@synthesize _activePath;

@synthesize _pathData;

@synthesize _pushViewDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        float width = frame.size.width/3.0;
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [leftButton setFrame:CGRectMake(0.0, 0.0, width, frame.size.height)];
        
        [leftButton setTitle:@"找柜" forState:UIControlStateNormal];
        
        [leftButton addTarget:self action:@selector(pushView:) forControlEvents:UIControlEventTouchUpInside];
        
        [leftButton setTag:1];
        
        [self addSubview:leftButton];
        
        UIButton *middleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [middleButton setFrame:CGRectMake(leftButton.frame.size.width, 0.0, width, frame.size.height)];
        
        [middleButton setTitle:@"派车" forState:UIControlStateNormal];
        
        [middleButton addTarget:self action:@selector(pushView:) forControlEvents:UIControlEventTouchUpInside];
        
        [middleButton setTag:2];
        
        [self addSubview:middleButton];
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [rightButton setFrame:CGRectMake(middleButton.frame.size.width+middleButton.frame.origin.x, 0.0, width, frame.size.height)];
        
        [rightButton setTitle:@"推荐朋友" forState:UIControlStateNormal];
        
        [rightButton addTarget:self action:@selector(pushView:) forControlEvents:UIControlEventTouchUpInside];
        
        [rightButton setTag:3];
        
        [self addSubview:rightButton];
        
        NSNumber *startPointX = [NSNumber numberWithFloat:0.0+leftButton.frame.size.width];
        
        NSNumber *startPointY = [NSNumber numberWithFloat:self.frame.size.height];
        
        NSNumber *endPointX = [NSNumber numberWithFloat:width*2];
        
        NSNumber *endPointY = [NSNumber numberWithFloat:self.frame.size.height];
        
        _pathData = [[NSMutableDictionary alloc] initWithCapacity:4];
        
        [_pathData setValue:startPointX forKey:@"startPointX"];
        
        [_pathData setValue:startPointY forKey:@"startPointY"];
        
        [_pathData setValue:endPointX forKey:@"endPointX"];
        
        [_pathData setValue:endPointY forKey:@"endPointY"];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0.0, rect.size.height)];
    
    [path addLineToPoint:CGPointMake(rect.size.width, rect.size.height)];
    
    [path closePath];
    
    [[UIColor blackColor] setStroke];
    
    path.lineWidth=1;
    
    [path stroke];
    
    CGMutablePathRef cgPath = CGPathCreateMutable();
    
    CGPathMoveToPoint(cgPath, NULL, [[_pathData objectForKey:@"startPointX"] floatValue], [[_pathData objectForKey:@"startPointY"] floatValue]);
    
    CGPathAddLineToPoint(cgPath, NULL, [[_pathData objectForKey:@"endPointX"] floatValue], [[_pathData objectForKey:@"endPointY"] floatValue]);
    
    _activePath = [UIBezierPath bezierPath];
    
    [[UIColor redColor] setStroke];
    
    _activePath.lineWidth=1;
    
    _activePath.CGPath = cgPath;
    
    [_activePath stroke];
    
    CGPathRelease(cgPath);
    
}

-(void)pushView:(id)action{

    UIButton *button = (UIButton *)action;
    
    NSLog(@"%i",button.tag);
    
    if (button.tag!=3) {
        
        [_pathData removeAllObjects];
        
        NSNumber *startPointX = [NSNumber numberWithFloat:button.frame.origin.x];
        
        NSNumber *startPointY = [NSNumber numberWithFloat:button.frame.size.height];
        
        NSNumber *endPointX = [NSNumber numberWithFloat:button.frame.origin.x+button.frame.size.width];
        
        NSNumber *endPointY = [NSNumber numberWithFloat:button.frame.size.height];
        
        [_pathData setValue:startPointX forKey:@"startPointX"];
        
        [_pathData setValue:startPointY forKey:@"startPointY"];
        
        [_pathData setValue:endPointX forKey:@"endPointX"];
        
        [_pathData setValue:endPointY forKey:@"endPointY"];
        
    }
    
    [self setNeedsDisplay];
    
    [_pushViewDelegate swapView:button.tag];
    
}

@end
