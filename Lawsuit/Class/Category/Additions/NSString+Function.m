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


/**
 生成随机码
 
 @param BitCount 随机码位数
 @return 随机码
 */
+(NSString*)generateRandomStringBitCount:(NSInteger)BitCount{
    char data[BitCount];
    for (int x=0;x<BitCount;data[x++] = (char)('a' + (arc4random_uniform(26))));
    NSString* result=[[NSString alloc] initWithBytes:data length:BitCount encoding:NSUTF8StringEncoding];
    return result;
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

+(NSString*)pastePhoneSpecialCharacter:(NSString *)text{
    NSString *s = [[NSString alloc] initWithUTF8String:text.UTF8String];
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\"\U0000202d\U0000202c"];
    NSString *trimmedString = [s stringByTrimmingCharactersInSet:set];
    NSArray * array = [trimmedString componentsSeparatedByString:@" "];
    NSLog(@"%@",array);
    NSString * phoneN = array.lastObject;
    NSString * newMobile = [phoneN stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return newMobile;
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


+ (BOOL)verifyIDCardNumber:(NSString *)value{
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([value length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:value]) {
        return NO;
    }
    int summary = ([value substringWithRange:NSMakeRange(0,1)].intValue +
                   [value substringWithRange:NSMakeRange(10,1)].intValue) *7+
    ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9+
    ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10+
    ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5+
    ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8+
    ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4+
    ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2+
    [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6+
    [value substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
    return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}

@end
