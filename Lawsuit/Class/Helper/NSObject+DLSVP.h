//
//  NSObject+DLSVP.h
//  SVProgressHUD
//
//  Created by xiadalu on 2017/8/29.
//
//

#import <Foundation/Foundation.h>
#import <SVProgressHUD.h>

@interface NSObject (DLSVP)


#pragma mark 默认的一套

-(void)dl_show;

-(void)dl_showWithStatus:(NSString*)status;

-(void)dismiss;

// 简介提示图片（可改）
-(void)dl_showInfoWithStatus:(NSString*)status;

// 成功提示图片（可改）
-(void)dl_showSuccessWithStatus:(NSString*)status;

// 错误提示图片（可改）
-(void)dl_showErrorWithStatus:(NSString*)status;


//带蒙版
-(void)dl_showWithMaskType:(SVProgressHUDMaskType)maskType;
@end
