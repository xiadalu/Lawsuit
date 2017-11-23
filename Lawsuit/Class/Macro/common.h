//
//  common.h
//  LvJinHuiSimple
//
//  Created by xiadalu on 2017/5/21.
//  Copyright © 2017年 夏大路. All rights reserved.
//

#ifndef common_h
#define common_h

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


#define IS_IOS_10  [[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."].firstObject intValue] >=10 ? YES : NO

//字符串为空判断的宏定义 很高效
#define IsNOTNullOrEmptyOfNSString(string) !((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@"<null>"]|| [string isEqualToString:@"(null)"]|| [string isEqualToString:@"null"]|| [string isEqualToString:@"nil"] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)


//强弱引用
#define WS(weakSelf)  __weak __typeof(self)weakSelf = self;
#define SG(strongSelf)  __strong __typeof(weakSelf)strongSelf =weakSelf;

//提高发布时的性能
#ifdef DEBUG
#define MyLog(...) NSLog(__VA_ARGS__)
#define IsProduct        NO
#else
#define MyLog(...)
#define IsProduct        YES
#endif

//** 沙盒路径 ***********************************************************************************

//沙盒路径
//获取沙盒主目录路径
#define kHome     NSHomeDirectory()
//获取Caches目录路径的方法：
#define kCaches   [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//获取Documents目录路径的方法
#define kDocument  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//获取tmp目录路径的方法
#define kTemp   NSTemporaryDirectory()


#define MainColor     [UIColor cz_colorWithRed:107 green:155 blue:234];

#endif /* common_h */
