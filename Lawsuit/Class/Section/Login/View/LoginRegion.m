//
//  LoginRegion.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/7.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "LoginRegion.h"
#import "CustomTextField.h"
#import "RegistController.h"
#import "ForgetController.h"

@interface LoginRegion ()

@property(nonatomic,strong)CustomTextField* phoneText;

@property(nonatomic,strong)CustomTextField* pswText;




@end

@implementation LoginRegion

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
        
        [self createUI];
    }
    return self;
}
-(void)createUI{
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 30)];
    titleLabel.text = @"用户登录";
    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:20];
    [self addSubview:titleLabel];
    CGFloat phoneTextY = CGRectGetMaxY(titleLabel.frame)+20;
    self.phoneText = [[CustomTextField alloc] initWithFrame:CGRectMake(20, phoneTextY, kScreenWidth-40, 40) leftImageName:@"login_phone number" rightImageName:@"" placeholder:@"请输入账号"];
    

    self.phoneText.keyboardType = UIKeyboardTypePhonePad;
    [self.phoneText addTarget:self action:@selector(phoneTextClick:) forControlEvents:UIControlEventEditingDidEnd];
    [self addSubview:self.phoneText];
    
    
    CGFloat pswY = CGRectGetMaxY(self.phoneText.frame)+20;
    self.pswText = [[CustomTextField alloc] initWithFrame:CGRectMake(20, pswY, kScreenWidth-40, 40) leftImageName:@"login_password" rightImageName:@"" placeholder:@"请输入密码"];
    [self addSubview:self.pswText];
    
    CGFloat loginBtnY = CGRectGetMaxY(self.pswText.frame)+20;
    self.loginBtn = [UIButton cz_textButton:@"登  录" fontSize:17 titleColor:[UIColor whiteColor] backgroundColor:[UIColor cz_colorWithRed:225 green:112 blue:104]];
    
    self.loginBtn.frame = CGRectMake(20, loginBtnY, kScreenWidth-40, 40);
    self.loginBtn.layer.cornerRadius = 20;
    [self.loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loginBtn];
    
    self.rigistBtn = [UIButton cz_textButton:@"注  册" fontSize:17 titleColor:[UIColor whiteColor] backgroundColor:[UIColor cz_colorWithRed:90 green:168 blue:250]];
    self.rigistBtn.layer.cornerRadius = 20;
    [self.rigistBtn addTarget:self action:@selector(rigistBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat rigistBtnY = (self.frame.size.height+CGRectGetMaxY(self.loginBtn.frame)-40)/2;
    self.rigistBtn.frame = CGRectMake(20, rigistBtnY, (self.frame.size.width-60)/2, 40);
    [self addSubview:self.rigistBtn];
    
    self.forgetBtn = [UIButton cz_textButton:@"忘记密码" fontSize:17 titleColor:[UIColor whiteColor] backgroundColor:[UIColor cz_colorWithRed:174 green:146 blue:242]];
    CGFloat forgetBtnX = CGRectGetMaxX(self.rigistBtn.frame)+20;
    CGFloat forgetBtnY = CGRectGetMinY(self.rigistBtn.frame);
    CGFloat forgetBtnW = CGRectGetWidth(self.rigistBtn.frame);
    CGFloat forgetBtnH = CGRectGetHeight(self.rigistBtn.frame);
    self.forgetBtn.frame = CGRectMake(forgetBtnX, forgetBtnY, forgetBtnW, forgetBtnH);
    self.forgetBtn.layer.cornerRadius = 20;
    [self.forgetBtn addTarget:self action:@selector(forgetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.forgetBtn];
    
    
}

-(void)phoneTextClick:(UITextField*)textField{
    //对输入的字符进行特殊字符处理
    textField.text = [NSString pastePhoneSpecialCharacter:textField.text];
    NSLog(@"%@",textField.text);
}

-(void)loginBtnClick:(UIButton*)btn{
    NSLog(@"登录");
    [self.phoneText resignFirstResponder];
    [self.pswText resignFirstResponder];
    NSLog(@"%@",self.phoneText.text);
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
}

-(void)rigistBtnClick:(UIButton*)btn{
    NSLog(@"注册");
    RegistController* registVC = [[RegistController alloc] init];
    [DCURLRouter pushViewController:registVC animated:YES];
}

-(void)forgetBtnClick:(UIButton*)btn{
    NSLog(@"忘记密码");
    ForgetController* forgetVC = [[ForgetController alloc] init];
    [DCURLRouter pushViewController:forgetVC animated:YES];
}



-(void)dealloc{
    NSLog(@"viewDealloc");
}

@end
