//
//  RegisterPhotoView.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "RegisterPhotoView.h"

@implementation RegisterPhotoView

@synthesize _takePicture;

@synthesize _uploadPicture;

@synthesize _pushViewDelegate;

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    _takePicture = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [_takePicture setFrame:CGRectMake((self.frame.size.width-200)/2, 20.0, 200.0, 50.0)];
    
    [_takePicture setBackgroundImage:[UIImage imageNamed:@"takepicture"] forState:UIControlStateNormal];
    
    [_takePicture addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_takePicture];
    
    _uploadPicture = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [_uploadPicture setFrame:CGRectMake(_takePicture.frame.origin.x, _takePicture.frame.origin.y+_takePicture.frame.size.height+20.0, 200.0, 50.0)];
    
    [_uploadPicture setBackgroundImage:[UIImage imageNamed:@"uploadpicture"] forState:UIControlStateNormal];
    
    [_uploadPicture addTarget:self action:@selector(localPhoto) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_uploadPicture];
    
}

-(void)takePhoto{

    [_pushViewDelegate takePhoto];
    
}

-(void)localPhoto{
    
    [_pushViewDelegate localPhoto];
    
}


@end
