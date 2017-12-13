//
//  NSObject+DLSVP.m
//  SVProgressHUD
//
//  Created by xiadalu on 2017/8/29.
//
//

#import "NSObject+DLSVP.h"


@implementation NSObject (DLSVP)

#pragma mark 默认的一套
-(void)dl_show{
    //颜色（亮黑色）
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    //动画类型
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    
    //蒙版
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    [SVProgressHUD show];
    
}

//带蒙版的显示
-(void)dl_showWithMaskType:(SVProgressHUDMaskType)maskType{
    //颜色（亮黑色）
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    //动画类型
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    
    //蒙版
    [SVProgressHUD setDefaultMaskType:maskType];
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
}
//带文字
-(void)dl_showWithStatus:(NSString *)status{

    //颜色（亮黑色）
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];

    //动画类型
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];

    //蒙版
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    [SVProgressHUD showWithStatus:status];

    
}

-(void)dismiss{
    [SVProgressHUD dismiss];
}
//简介提示
-(void)dl_showInfoWithStatus:(NSString *)status{
    //颜色（亮黑色）
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    //动画类型
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    //蒙版
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMinimumDismissTimeInterval:2];

    [SVProgressHUD showInfoWithStatus:status];
}
//成功提示
-(void)dl_showSuccessWithStatus:(NSString *)status{
    
    //颜色（亮黑色）
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    //动画类型
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    //蒙版
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD showSuccessWithStatus:status];
}
//错误提示
-(void)dl_showErrorWithStatus:(NSString *)status{
    //颜色（亮黑色）
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    //动画类型
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    
    //蒙版
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMinimumDismissTimeInterval:2];

    [SVProgressHUD showErrorWithStatus:status];
}



@end
