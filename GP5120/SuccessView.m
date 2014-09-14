//
//  SuccessView.m
//  GP5120
//
//  Created by lele126 on 14-8-6.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "SuccessView.h"

#import "UIDevice+Resolutions.h"

@implementation SuccessView

@synthesize _pushViewDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width-200.0)/2, 0.0, 230.0, 50.0)];
    
    [topLabel setText:@"恭喜您发布成功！"];
    
    [topLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:28.0]];
    
    [self addSubview:topLabel];
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(topLabel.frame.origin.x+20, topLabel.frame.origin.y+topLabel.frame.size.height, 75.0, 40.0)];
    
    [leftLabel setText:@"您可以"];
    
    [leftLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:24.0]];
    
    [self addSubview:leftLabel];
    
    UIImage *topImage = [UIImage imageNamed:@"releasesuccess_middle"];
    
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(leftLabel.frame.origin.x+leftLabel.frame.size.width, leftLabel.frame.origin.y+10.0, 79.0, 20.0)];
    
    [topImageView setImage:topImage];
    
    [self addSubview:topImageView];
    
    UILabel *meddleLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width-100.0)/2, leftLabel.frame.origin.y+leftLabel.frame.size.height, 100.0, 40.0)];
    
    [meddleLabel setText:@"或者："];
    
    [meddleLabel setTextColor:[UIColor redColor]];
    
    [meddleLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:15.0]];
    
    [self addSubview:meddleLabel];

    
    UIImage *meddleImage = [UIImage imageNamed:@"releasesuccess_middle_1"];
    
    UIButton *meddleButton = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width-208.0)/2, meddleLabel.frame.origin.y+meddleLabel.frame.size.height, 208.0, 69.0)];
    
    [meddleButton setBackgroundImage:meddleImage forState:UIControlStateNormal];
    
    [meddleButton addTarget:self action:@selector(findDriverView) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:meddleButton];
    
    UIImage *bottomImage = [UIImage imageNamed:@"releasesuccessredirect"];
    
    UIImageView *bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width-208.0)/2, meddleButton.frame.origin.y+89.0, 208.0, 57.0)];
    
    [bottomImageView setImage:bottomImage];
    
    [self addSubview:bottomImageView];
    
}

-(void)findDriverView{
    
    [_pushViewDelegate successRedirectView];
    
}

@end
