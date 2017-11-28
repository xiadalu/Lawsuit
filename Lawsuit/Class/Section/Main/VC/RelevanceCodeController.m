//
//  RelevanceCodeController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/28.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "RelevanceCodeController.h"

@interface RelevanceCodeController ()

@property(nonatomic,strong)UITextField* textField;

@property(nonatomic,strong)UIButton* confirmBtn;

@end

@implementation RelevanceCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"案件关联码";
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)confirmBtnClick:(UIButton*)btn{
    [self.textField resignFirstResponder];
}

-(void)setUI{
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @" 请输入案件关联号";
    self.textField.borderStyle = UITextBorderStyleLine;
    self.textField.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:self.textField];
    
    self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [self.confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.confirmBtn.backgroundColor = [UIColor lightGrayColor];
    [self.confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.confirmBtn];
    
    [self autoLayout];
}

-(void)autoLayout{
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.view).offset(150);
        make.height.mas_equalTo(60);
    }];
    
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textField.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(25);
        make.right.equalTo(self.view).offset(-25);
        make.height.mas_equalTo(40);
    }];
    
}

@end
