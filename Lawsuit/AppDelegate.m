//
//  AppDelegate.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/22.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "AppDelegate.h"


#import "MainController.h"
#import "LeftController.h"

#import "MyNavigationController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //网络配置
    [self networkConfig];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //主控制器
    MainController* mainVC = [[MainController alloc] init];
    MyNavigationController* nav = [[MyNavigationController alloc] initWithRootViewController:mainVC];
    
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];

    return YES;
}

#pragma mark 网络配置
-(void)networkConfig{
    //XMCenter配置
    [XMCenter setupConfig:^(XMConfig * _Nonnull config) {
        config.generalServer = REQURL;
        config.callbackQueue = dispatch_get_main_queue();
        
        //        config.generalHeaders = @{@"Content-Type":@"text/xml"};
#ifdef DEBUG
        config.consoleLog = YES;
#endif
    }];
    
    //检查网络状态
    [GLobalRealReachability startNotifier];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
