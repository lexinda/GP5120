//
//  MeddleTextField.m
//  GP5120
//
//  Created by lele126 on 14-8-2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "MeddleTextField.h"

@implementation MeddleTextField

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
    // Drawing code
    
    _oneTextFiled = [[UITextField alloc] initWithFrame:CGRectMake((rect.size.width-rect.size.width/3*2)/2, 0.0, rect.size.width/3*2, 30.0)];
    
    [_oneTextFiled setBorderStyle:UITextBorderStyleRoundedRect];
    
    _oneTextFiled.placeholder = _oneText;
    
    _oneTextFiled.delegate = self;
    
    _oneTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _oneTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _oneTextFiled.returnKeyType = UIReturnKeyDone;
    
    _oneTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _oneTextFiled.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    
    [self addSubview:_oneTextFiled];
    
    _twoTextFiled = [[UITextField alloc] initWithFrame:CGRectMake((rect.size.width-rect.size.width/3*2)/2, _oneTextFiled.frame.size.height+10.0, rect.size.width/3*2, 30.0)];
    
    [_twoTextFiled setBorderStyle:UITextBorderStyleRoundedRect];
    
    _twoTextFiled.placeholder = _twoText;
    
    _twoTextFiled.delegate = self;
    
    _twoTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    
    _twoTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    _twoTextFiled.returnKeyType = UIReturnKeyDone;
    
    _twoTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self addSubview:_twoTextFiled];
    
    UIButton *nowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [nowButton setFrame:CGRectMake(_twoTextFiled.frame.origin.x-5.0, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height+10.0, (_twoTextFiled.frame.size.width-9)/4, 20.0)];
    
    [nowButton setBackgroundImage:[UIImage imageNamed:@"today"] forState:UIControlStateNormal];
    
    [nowButton setTag:10];
    
    [nowButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:nowButton];
    
    UIButton *tomorrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [tomorrowButton setFrame:CGRectMake(nowButton.frame.origin.x+nowButton.frame.size.width+5.0, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height+10.0, (_twoTextFiled.frame.size.width-9)/4, 20.0)];
    
    [tomorrowButton setBackgroundImage:[UIImage imageNamed:@"tomorrow"] forState:UIControlStateNormal];
    
    [tomorrowButton setTag:11];
    
    [tomorrowButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:tomorrowButton];
    
    UIButton *afterTomorrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [afterTomorrowButton setFrame:CGRectMake(tomorrowButton.frame.origin.x+tomorrowButton.frame.size.width+5.0, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height+10.0, (_twoTextFiled.frame.size.width-9)/4, 20.0)];
    
    [afterTomorrowButton setBackgroundImage:[UIImage imageNamed:@"nextday"] forState:UIControlStateNormal];
    
    [afterTomorrowButton setTag:12];
    
    [afterTomorrowButton addTarget:self action:@selector(activeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:afterTomorrowButton];
    
    UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [otherButton setFrame:CGRectMake(afterTomorrowButton.frame.origin.x+afterTomorrowButton.frame.size.width+5.0, _twoTextFiled.frame.origin.y+_twoTextFiled.frame.size.height+10.0, (_twoTextFiled.frame.size.width-9)/4, 20.0)];
    
    [otherButton addTarget:self action:@selector(showDataPicker:) forControlEvents:UIControlEventTouchUpInside];
    
    [otherButton setBackgroundImage:[UIImage imageNamed:@"otherday"] forState:UIControlStateNormal];
    
    [self addSubview:otherButton];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [leftButton setFrame:CGRectMake((self.frame.size.width-(100+5+100+5+100))/2, nowButton.frame.origin.y+nowButton.frame.size.height+10.0, 100.0, 30.0)];
    
    [leftButton setTitle:@"派单给他" forState:UIControlStateNormal];
    
    [leftButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self addSubview:leftButton];
    
    UIButton *meddleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [meddleButton setFrame:CGRectMake(leftButton.frame.origin.x+leftButton.frame.size.width+5.0, nowButton.frame.origin.y+nowButton.frame.size.height+10.0, 100.0, 30.0)];
    
     [meddleButton addTarget:self action:@selector(setupCarInfo:) forControlEvents:UIControlEventTouchUpInside];
    
    [meddleButton setTitle:@"发布派车信息" forState:UIControlStateNormal];
    
    [meddleButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self addSubview:meddleButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [rightButton setFrame:CGRectMake(meddleButton.frame.origin.x+meddleButton.frame.size.width+5.0, nowButton.frame.origin.y+nowButton.frame.size.height+10.0, 100.0, 30.0)];
    
    [rightButton addTarget:self action:@selector(showCarDetail:) forControlEvents:UIControlEventTouchUpInside];
    
    [rightButton setTitle:@"查看派车信息" forState:UIControlStateNormal];
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"_12"] forState:UIControlStateNormal];
    
    [self addSubview:rightButton];
    
}

-(void)activeButton:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    for (UIView *view in [self subviews]) {
        if (view.tag==10) {
            
            UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"today"] forState:UIControlStateNormal];
            
        }else if(view.tag==11){
            
            UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"tomorrow"] forState:UIControlStateNormal];
            
        }else if(view.tag==12){
            
            UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"nextday"] forState:UIControlStateNormal];
            
        }
    }
    
    if (button.tag == 10) {
        
        [button setBackgroundImage:[UIImage imageNamed:@"today1"] forState:UIControlStateNormal];
        
    }else if(button.tag == 11){
        
        [button setBackgroundImage:[UIImage imageNamed:@"tomorrow1"] forState:UIControlStateNormal];
        
    }else if(button.tag == 12){
        
        [button setBackgroundImage:[UIImage imageNamed:@"nextday1"] forState:UIControlStateNormal];
        
    }
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

-(void)showCarDetail:(id)action{
    
    [_pushViewDelegate showCarDetail];
    
}

-(void)showDataPicker:(id)action{
    
    for (UIView *view in [self subviews]) {
        if (view.tag==10) {
            
            UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"today"] forState:UIControlStateNormal];
            
        }else if(view.tag==11){
            
            UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"tomorrow"] forState:UIControlStateNormal];
            
        }else if(view.tag==12){
            
            UIButton *button = (UIButton *)view;
            
            [button setBackgroundImage:[UIImage imageNamed:@"nextday"] forState:UIControlStateNormal];
            
        }
    }


    [_pushViewDelegate showDataPicker];
};

@end
