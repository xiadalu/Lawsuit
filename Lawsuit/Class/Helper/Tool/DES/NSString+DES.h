//
//  NSString+DES.h
//其他平台地址
//http://www.jianshu.com/p/4eb3e6d07b78#
//  Created by xiadalu on 2017/5/23.
//  Copyright © 2017年 夏大路. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DES)

//加密
+ (NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;

//解密
+ (NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key;

@end
