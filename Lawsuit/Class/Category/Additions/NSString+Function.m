//
//  NSString+Function.m
//  LawServer
//
//  Created by xiadalu on 16/8/9.
//  Copyright © 2016年 夏大路. All rights reserved.
//

#import "NSString+Function.h"

@implementation NSString (Function)



+(NSString*)isBlankString:(NSString *)string{
    
    if (string == nil || string == NULL) {
        return @"";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    return string;
}
+(NSString*)currentDateChangeString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh-mm-ss"];
    NSString *dateStr = [dateFormatter stringFromDate:[NSDate date]];
    return dateStr;
}

+(BOOL)isTelephone:(NSString*)str{
    NSString * MOBILE = @"^1(3[0-9]|47|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";;
    NSString * CU = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    NSString * CT = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:str]   ||
    [regextestphs evaluateWithObject:str]      ||
    [regextestct evaluateWithObject:str]       ||
    [regextestcu evaluateWithObject:str]       ||
    [regextestcm evaluateWithObject:str];

}

+(NSString *)phoneNumToAsterisk:(NSString*)phoneNum;
{
    return [phoneNum stringByReplacingCharactersInRange:NSMakeRange(3,4) withString:@"****"];
}


#pragma mark 计算label 高
+(CGSize)calculateWidthOrHeight:(CGFloat)widthOrHeight andBool:(BOOL)flag andStr:(NSString *)str andFond:(UIFont*)fond{
    NSDictionary *attributeDic = @{NSFontAttributeName:fond};
    CGSize size;
    if (flag) {
        //iOS7  高
        size=[str boundingRectWithSize:CGSizeMake(widthOrHeight, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributeDic context:nil].size;
        NSLog(@"%f",size.height);
    }else{
        //iOS7  宽
        size=[str boundingRectWithSize:CGSizeMake(MAXFLOAT, widthOrHeight) options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributeDic context:nil].size;
        NSLog(@"%f",size.width);
    }
    
    return size;
}


//得到中英文混合字符串长度 方法2
-(NSInteger)getToInt
{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* da = [self dataUsingEncoding:enc];
    return [da length];
}

-(BOOL)isChinese{
    
    int strlength = 0 ;
    strlength=[self getToInt];
    return ((strlength/ 2 )== 1 )? YES : NO ;
}
@end
