//
//  NSString+Function.h
//  LawServer
//
//  Created by xiadalu on 16/8/9.
//  Copyright © 2016年 夏大路. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Function)
//手机号判断
+ (BOOL)isTelephone:(NSString*)str;
//nil空字符串转为@""
+ (NSString*) isBlankString:(NSString *)string;
//手机号隐藏
+(NSString *)phoneNumToAsterisk:(NSString*)phoneNum;
//设置字体高度
+(CGSize)calculateWidthOrHeight:(CGFloat)widthOrHeight andBool:(BOOL)flag andStr:(NSString *)str andFond:(UIFont*)fond;

//当前时间
+(NSString*)currentDateChangeString;

//得到中英文混合字符串长度 方法2
-(NSInteger)getToInt;

//判断是否是汉字
-(BOOL)isChinese;

@end
