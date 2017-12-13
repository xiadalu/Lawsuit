//
//  ForgetRegion.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/7.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "ForgetRegion.h"
#import "CustomTextField.h"
#import "ForgetController.h"

@interface ForgetRegion()


@property(nonatomic,strong)CustomTextField* phoneText;
@property(nonatomic,strong)CustomTextField* codeText;
@property(nonatomic,strong)CustomTextField* pswText;
@property(nonatomic,strong)CustomTextField* againPswText;
@property(nonatomic,strong)UIButton* codeBtn;
@property(nonatomic,strong)UIButton* confirmBtn;



@end

@implementation ForgetRegion

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    CGFloat H = 40;
    self.phoneText = [[CustomTextField alloc] initWithFrame:CGRectMake(20, 30, kScreenWidth-40, H) leftImageName:@"login_phone number" rightImageName:@"" placeholder:@"请输入手机号"];
    self.phoneText.keyboardType = UIKeyboardTypePhonePad;
    [self.phoneText addTarget:self action:@selector(phoneTextClick:) forControlEvents:UIControlEventEditingDidEnd];
    [self addSubview:self.phoneText];
    WS(weakSelf);
    CGFloat codeTextY = CGRectGetMaxY(weakSelf.phoneText.frame)+20;
    self.codeText = [[CustomTextField alloc] initWithFrame:CGRectMake(20, codeTextY, kScreenWidth-150, H) leftImageName:@"login_phone number" rightImageName:@"" placeholder:@"请输入验证码"];
    self.codeText.keyboardType = UIKeyboardTypePhonePad;
    [self addSubview:self.codeText];
    
    self.codeBtn=[UIButton cz_textButton:@"获取验证码" fontSize:16 titleColor:[UIColor whiteColor] backgroundColor:[UIColor cz_colorWithRed:0 green:208 blue:96]];
    self.codeBtn.frame = CGRectMake(kScreenWidth-120, codeTextY, 100, H);
    self.codeBtn.layer.cornerRadius = H*0.5;
    [self addSubview:self.codeBtn];
    
    CGFloat pswY = CGRectGetMaxY(weakSelf.codeText.frame)+20;
    self.pswText = [[CustomTextField alloc] initWithFrame:CGRectMake(20, pswY, kScreenWidth-40, H) leftImageName:@"login_password" rightImageName:@"login_password" placeholder:@"请输入密码"];
    [self addSubview:self.pswText];
    
    CGFloat againPswY = CGRectGetMaxY(weakSelf.pswText.frame)+20;
    self.againPswText = [[CustomTextField alloc] initWithFrame:CGRectMake(20, againPswY, kScreenWidth-40, H) leftImageName:@"login_password" rightImageName:@"login_password" placeholder:@"请输入密码"];
    [self addSubview:self.againPswText];

    CGFloat confirmY = CGRectGetMaxY(weakSelf.againPswText.frame)+20;
    self.confirmBtn = [UIButton cz_textButton:@"确  定" fontSize:17 titleColor:[UIColor whiteColor] backgroundColor:[UIColor cz_colorWithRed:225 green:112 blue:104]];

    self.confirmBtn.frame = CGRectMake(20, confirmY, kScreenWidth-40, H);
    self.confirmBtn.layer.cornerRadius = 20;
    [self.confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.confirmBtn];


    
    
}
#pragma mark  对输入的字符进行特殊字符处理
-(void)phoneTextClick:(UITextField*)textField{
    textField.text = [NSString pastePhoneSpecialCharacter:textField.text];
    NSLog(@"%@",textField.text);
}
#pragma mark 确定Click
-(void)confirmBtnClick:(UIButton*)btn{
    NSLog(@"登录");
    [self.phoneText resignFirstResponder];
    [self.pswText resignFirstResponder];
    NSLog(@"%@",self.phoneText.text);
    
}

@end
