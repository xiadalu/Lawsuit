//
//  LoginController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/5.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "LoginController.h"
#import "LoginIcon.h"
#import "TextFieldLeft.h"

@interface LoginController ()<UITextFieldDelegate>


@property (strong, nonatomic) UIButton *loginBtn;

@property (strong, nonatomic) UIScrollView* scrollView;

@property(strong,nonatomic)TextFieldLeft* phoneText;

@property(strong,nonatomic)TextFieldLeft* pswText;


@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
-(void)setupMyNav{
    [self.scrollView addSubview:self.myNav];
}
-(void)setUI{
    [self.view addSubview:self.scrollView];
    
    self.phoneText = [[TextFieldLeft alloc] initWithFrame:CGRectMake(10, 100, kScreenWidth-20, 40) leftImageName:@"login_phone number" placehold:@"请输入手机号"];
    [self.phoneText addTarget:self action:@selector(phoneTextClick:) forControlEvents:UIControlEventEditingChanged];
    self.phoneText.keyboardType = UIKeyboardTypePhonePad;
    [self.scrollView addSubview:self.phoneText];
    
    self.pswText = [[TextFieldLeft alloc] initWithFrame:CGRectMake(10, 150, kScreenWidth-20, 40) leftImageName:@"login_password" placehold:@"请输入密码"];
    self.pswText.secureTextEntry = YES;
    [self.scrollView addSubview:self.pswText];
    
    self.loginBtn = [UIButton cz_textButton:@"登录" fontSize:18 normalColor:[UIColor blackColor] highlightedColor:[UIColor blueColor]];
    self.loginBtn.frame = CGRectMake(0, 200, kScreenWidth, 40);
    self.loginBtn.backgroundColor = [UIColor cz_colorWithRed:228 green:228 blue:228];
    [self.loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.loginBtn];
}
-(void)phoneTextClick:(UITextField*)textField{
    //对输入的字符进行特殊字符处理
    textField.text = [NSString pastePhoneSpecialCharacter:textField.text];
    NSLog(@"%@",textField.text);
}
-(void)loginBtnClick:(UIButton*)btn{
    NSLog(@"%@",self.phoneText.text);
    
}



-(UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
    }
    return _scrollView;
}


@end
