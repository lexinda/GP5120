//
//  AppDelegate.m
//  GP5120
//
//  Created by lele126 on 14-8-2.
//  Copyright (c) 2014年 com.lexindasoft. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize _navigationController;

@synthesize _homeViewController;

@synthesize _mapManager;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _mapManager = [[BMKMapManager alloc] init];
    
    BOOL ret = [_mapManager start:@"VGdYXpEGLs3LwVE8UjSO5iVB" generalDelegate:self];
    
    if (!ret) {
        NSLog(@"载入地图出错");
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    LoginAndRegisterViewController *loginAndRegisterViewController = [[LoginAndRegisterViewController alloc] init];
//    
//    _navigationController = [[UINavigationController alloc] initWithRootViewController:loginAndRegisterViewController];
    
    _homeViewController = [[HomeViewController alloc] init];
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_homeViewController];
    
    self.window.rootViewController = _navigationController;
    
    return YES;
}
//0正确，2网络链接错误，300授权key验证失败
-(void)onGetNetworkState:(int)iError{

    if (0 == iError) {
        NSLog(@"联网成功");
    }else{
        NSLog(@"onGetNetworkState %d",iError);
    }
    
}

-(void)onGetPermissionState:(int)iError{

    if (0 == iError) {
        NSLog(@" 授权成功");
    }else{
        NSLog(@"onGetPermissionState %d",iError);
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
