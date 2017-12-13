//
//  EmailCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/11.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "EmailCell.h"

#import "CustomTextField.h"

@interface EmailCell()

@property(nonatomic,strong)CustomTextField* emailTextField;

@property(nonatomic,strong)CustomTextField* codeTextField;

@property(nonatomic,strong)CustomTextField* pswTextField;

@property(nonatomic,strong)UIButton* sendCodeBtn;

@end

@implementation EmailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 120, 20)];
        label.text = @"邮箱绑定";
        [self.contentView addSubview:label];
        
        CGFloat emailTextY = CGRectGetMaxY(label.frame)+10;
        self.emailTextField = [[CustomTextField alloc] initWithFrame:CGRectMake(10, emailTextY, kScreenWidth-20, 40) leftImageName:@"login_password" rightImageName:@"" placeholder:@"请输入邮箱账号"];
        [self.contentView addSubview:self.emailTextField];
        
        CGFloat codeTextY = CGRectGetMaxY(self.emailTextField.frame)+10;
        self.codeTextField = [[CustomTextField alloc] initWithFrame:CGRectMake(10, codeTextY, kScreenWidth-150, 40) leftImageName:@"login_password" rightImageName:@"" placeholder:@"请输入验证码"];
        [self.contentView addSubview:self.codeTextField];
        
        CGFloat sendCodeX = CGRectGetMaxX(self.codeTextField.frame)+10;
        self.sendCodeBtn = [UIButton cz_textButton:@"获取验证码" fontSize:15 titleColor:[UIColor whiteColor] backgroundColor:[UIColor greenColor]];
        self.sendCodeBtn.layer.cornerRadius = 20;

        self.sendCodeBtn.frame = CGRectMake(sendCodeX, codeTextY, 120, 40);
        [self.contentView addSubview:self.sendCodeBtn];
        
        CGFloat pswTextY = CGRectGetMaxY(self.codeTextField.frame)+10;
        self.pswTextField = [[CustomTextField alloc] initWithFrame:CGRectMake(10, pswTextY, kScreenWidth-20, 40) leftImageName:@"login_password" rightImageName:@"" placeholder:@"请输入密码"];
        [self.contentView addSubview:self.pswTextField];
        
    }
    return self;
}

@end
