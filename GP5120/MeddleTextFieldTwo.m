//
//  MeddleTextFieldTwo.m
//  GP5120
//
//  Created by 朱孟乐 on 14-9-17.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "MeddleTextFieldTwo.h"

@implementation MeddleTextFieldTwo

@synthesize _oneText;

@synthesize _twoText;

@synthesize _leftButtonText;

@synthesize _rightButtonText;

@synthesize _oneTextFiled;

@synthesize _twoTextFiled;

@synthesize _pushViewDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    _oneTextFiled = [[UITextField alloc] initWithFrame:CGRectMake((rect.size.width-rect.size.width/3*2)/2, 0.0, rect.size.width/3*2, (rect.size.height-30)/4+8)];
    
    [_oneTextFiled setBorderStyle:UITextBorderStyleRoundedRect];
    
    _oneTextFiled.placeholder = _oneText;
    
    _oneTextFiled.delegate = self;
    
    _oneTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _oneTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _oneTextFiled.returnKeyType = UIReturnKeyDone;
    
    _oneTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _oneTextFiled.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_oneTextFiled];
    
    _twoTextFiled = [[UITextField alloc] initWithFrame:CGRectMake((rect.size.width-rect.size.width/3*2)/2, _oneTextFiled.frame.size.height+10.0, rect.size.width/3*2, (rect.size.height-30)/4+8)];
    
    [_twoTextFiled setBorderStyle:UITextBorderStyleRoundedRect];
    
    _twoTextFiled.placeholder = _twoText;
    
    _twoTextFiled.delegate = self;
    
    _twoTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _twoTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _twoTextFiled.returnKeyType = UIReturnKeyDone;
    
    _twoTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self addSubview:_twoTextFiled];
    
    UIButton *nowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [nowButton setFrame:CGRectMake(_twoTextFiled.frame.origin.x, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height, (_twoTextFiled.frame.size.width-9)/4, (rect.size.height-30)/4)];
    
    [nowButton setTitle:@"今天" forState:UIControlStateNormal];
    
    [self addSubview:nowButton];
    
    UIButton *tomorrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [tomorrowButton setFrame:CGRectMake(nowButton.frame.origin.x+nowButton.frame.size.width, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height, (_twoTextFiled.frame.size.width-9)/4, (rect.size.height-30)/4)];
    
    [tomorrowButton setTitle:@"明天" forState:UIControlStateNormal];
    
    [self addSubview:tomorrowButton];
    
    UIButton *afterTomorrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [afterTomorrowButton setFrame:CGRectMake(tomorrowButton.frame.origin.x+tomorrowButton.frame.size.width, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height, (_twoTextFiled.frame.size.width-9)/4, (rect.size.height-30)/4)];
    
    [afterTomorrowButton setTitle:@"后天" forState:UIControlStateNormal];
    
    [self addSubview:afterTomorrowButton];
    
    UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [otherButton setFrame:CGRectMake(afterTomorrowButton.frame.origin.x+afterTomorrowButton.frame.size.width, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height, (_twoTextFiled.frame.size.width-9)/4, (rect.size.height-30)/4)];
    
    [otherButton setTitle:@"月＋日" forState:UIControlStateNormal];
    
    [self addSubview:otherButton];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [leftButton setFrame:CGRectMake(nowButton.frame.origin.x-10, nowButton.frame.origin.y+nowButton.frame.size.height, (_twoTextFiled.frame.size.width-4)/2, (rect.size.height-30)/4)];
    
    [leftButton setTitle:@"派单给他" forState:UIControlStateNormal];
    
    [self addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [rightButton setFrame:CGRectMake(leftButton.frame.origin.x+leftButton.frame.size.width, nowButton.frame.origin.y+nowButton.frame.size.height, (_twoTextFiled.frame.size.width-4)/2, (rect.size.height-30)/4)];
    
    [rightButton addTarget:self action:@selector(setupCarInfo:) forControlEvents:UIControlEventTouchUpInside];
    
    [rightButton setTitle:@"发布派车信息" forState:UIControlStateNormal];
    
    [self addSubview:rightButton];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ((![_oneTextFiled isExclusiveTouch])||(![_twoTextFiled isExclusiveTouch])) {
        [_oneTextFiled resignFirstResponder];
        [_twoTextFiled resignFirstResponder];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
    
}

-(void)setupCarInfo:(id)action{
    
    [_pushViewDelegate setupCarInfo];
    
}

@end
