//
//  FootButtonView.m
//  GP5120
//
//  Created by lele126 on 14-8-2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "FootButtonView.h"

@implementation FootButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImage *footImage = [UIImage imageNamed:@"releasesuccess_foot_2"];
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:footImage]];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    float width = (rect.size.width-140)/3;
    
    UIButton *guideButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [guideButton setFrame:CGRectMake(20.0, 5.0, width, rect.size.height-20)];
    
    UIImage *guideImage = [UIImage imageNamed:@"releasesuccess_foot_3"];
    
    [guideButton setBackgroundImage:guideImage forState:UIControlStateNormal];
    
    [self addSubview:guideButton];
    
    UIButton *behaviorButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [behaviorButton setFrame:CGRectMake(guideButton.frame.size.width+70, 5.0, width, rect.size.height-20)];
    
    UIImage *behaviorImage = [UIImage imageNamed:@"releasesuccess_foot_4"];
    
    [behaviorButton setBackgroundImage:behaviorImage forState:UIControlStateNormal];
    
    [self addSubview:behaviorButton];
    
    UIButton *aboutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [aboutButton setFrame:CGRectMake(behaviorButton.frame.origin.x+behaviorButton.frame.size.width+50, 5.0, width, rect.size.height-20)];
    
    UIImage *aboutImage = [UIImage imageNamed:@"releasesuccess_foot_5"];
    
    [aboutButton setBackgroundImage:aboutImage forState:UIControlStateNormal];
    
    [self addSubview:aboutButton];
    
}

@end
