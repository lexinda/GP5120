//
//  ValidataLogin.m
//  GP5120
//
//  Created by 朱孟乐 on 14/10/19.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "ValidataLogin.h"

@implementation ValidataLogin

-(void)standardUserInfo:(NSDictionary *)userInfo{

    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    NSString *username = [userInfo objectForKey:@"username"];
    
    [defaults setObject:username forKey:@"username"];
    
    NSString *password = [userInfo objectForKey:@"password"];
    
    [defaults setObject:password forKey:@"password"];
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//设定时间格式
    
    NSString *loginDate = [dateFormat stringFromDate:[NSDate date]];
    
    [defaults setObject:loginDate forKey:@"loginDate"];
    
    NSString *isAutoLogin = [userInfo objectForKey:@"isAutoLogin"];
    
    [defaults setObject:isAutoLogin forKey:@"isAutoLogin"];
    
    [defaults synchronize];
}

-(NSDictionary *)validataUserInfo{
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    NSString *isAutoLogin = [defaults objectForKey:@"isAutoLogin"];
    
    NSString *username = [defaults objectForKey:@"username"];
    
    if ([isAutoLogin isEqualToString:@"1"]) {
        
        NSString *password = [defaults objectForKey:@"password"];
        
        NSString *loginDate = [defaults objectForKey:@"loginDate"];
        
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
        
        [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//设定时间格式,要注意跟下面的dateString匹配，否则日起将无效
        
        NSDate *loginLastDate =[dateFormat dateFromString:loginDate];
        
        NSTimeInterval timeInterval = [loginLastDate timeIntervalSinceNow];
        
        timeInterval = -timeInterval;
        
        long temp = 0;
        
//        NSString *result;
        
//        if (timeInterval < 60) {
//            result = [NSString stringWithFormat:@"刚刚"];
//        }
//        else if((temp = timeInterval/60) <60){
//            result = [NSString stringWithFormat:@"%ld分前",temp];
//        }
//        
//        else if((temp = temp/60) <24){
//            result = [NSString stringWithFormat:@"%ld小前",temp];
//        }
//        
//        else if((temp = temp/24) <30){
//            result = [NSString stringWithFormat:@"%ld天前",temp];
//        }
//        
//        else if((temp = temp/30) <12){
//            result = [NSString stringWithFormat:@"%ld月前",temp];
//        }
//        else{
//            temp = temp/12;
//            result = [NSString stringWithFormat:@"%ld年前",temp];
//        }
        temp = timeInterval/60/60/24;
        
        if(temp<15){
            
            NSDictionary *resultData = [NSDictionary dictionaryWithObjectsAndKeys:username,@"username",password,@"password",isAutoLogin,@"isAutoLogin", nil];
            
            return resultData;
            
        }else{
            
            NSDictionary *resultData = [NSDictionary dictionaryWithObjectsAndKeys:username,@"username",@"",@"password",isAutoLogin,@"isAutoLogin", nil];
            
            return resultData;
        
        }
        
        
        
    }else{
    
        NSDictionary *resultData = [NSDictionary dictionaryWithObjectsAndKeys:username,@"username",@"",@"password",@"0",@"isAutoLogin", nil];
        
        return resultData;
    }
}

@end
