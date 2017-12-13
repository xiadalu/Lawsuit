//
//  AppDelegate+EaseMob.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/6.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "AppDelegate+EaseMob.h"
#import "MyNavigationController.h"
#import "LoginController.h"
#import "MainController.h"
#import "XLSlideMenu.h"
#import "LeftController.h"

@implementation AppDelegate (EaseMob)

-(void)easemobApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions appkey:(NSString *)appkey apnsCertName:(NSString *)apnsCertName otherConfig:(NSDictionary *)otherConfig{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginStateChange:) name:KNOTIFICATION_LOGINCHANGE object:nil];
    
    [[EaseSDKHelper shareHelper] hyphenateApplication:application didFinishLaunchingWithOptions:launchOptions appkey:appkey apnsCertName:apnsCertName otherConfig:otherConfig];
    
    BOOL isAutoLogin = [EMClient sharedClient].isAutoLogin;

    if (isAutoLogin) {
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
    }
}


-(void)easemobApplication:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    [[EaseSDKHelper shareHelper] hyphenateApplication:application didReceiveRemoteNotification:userInfo];
}


#pragma mark ---------------------APNs------------------------
#pragma mark 将得到的deviceToken传给SDK
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[EMClient sharedClient] bindDeviceToken:deviceToken];
    });
    
}
#pragma mark 注册deviceToken失败，一般是环境配置或证书配置有误
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"error:[%@]",error.debugDescription);
}

- (void)loginStateChange:(NSNotification *)notification{
    
    BOOL loginSucess = [notification.object boolValue];
    if (loginSucess) {
        
        if (self.slideMenu == nil) {
            //主控制器
            MainController* mainVC = [[MainController alloc] init];
            MyNavigationController* rootNav = [[MyNavigationController alloc] initWithRootViewController:mainVC];
            self.slideMenu = [[XLSlideMenu alloc] initWithRootViewController:rootNav];
            self.slideMenu.leftViewController = [[LeftController alloc] init];
        }
        self.window.rootViewController = self.slideMenu;
    }else{
        if (self.slideMenu) {
            [self.slideMenu.navigationController popToRootViewControllerAnimated:NO];
        }
        self.slideMenu = nil;
        LoginController* loginVC = [[LoginController alloc] init];
        MyNavigationController* rootNav = [[MyNavigationController alloc] initWithRootViewController:loginVC];
        self.window.rootViewController = rootNav;
    }
    
    
}

-(void)didReceiveRemoteNotification:(NSDictionary *)userInfo{
    NSLog(@"userInfo:[%@]",userInfo);
}

@end
