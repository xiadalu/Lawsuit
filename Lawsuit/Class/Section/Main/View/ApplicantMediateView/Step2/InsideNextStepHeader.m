//
//  InsideNextStepHeader.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/4.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "InsideNextStepHeader.h"

@implementation InsideNextStepHeader

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    
    
    self.unfoldBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.unfoldBtn setTitle:@"展开" forState:UIControlStateNormal];
    [self.unfoldBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.unfoldBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.unfoldBtn];
    
    self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [self.deleteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.deleteBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.deleteBtn];
    
    UIView* lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:lineView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(80);
    }];
    
    [self.unfoldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-80);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(80);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.unfoldBtn.mas_right).offset(4);
        make.top.mas_equalTo(self.contentView).offset(5);
        make.bottom.mas_equalTo(self.contentView).offset(-5);
        make.width.mas_equalTo(1);
    }];
    
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.unfoldBtn.mas_right).offset(10);
        make.top.bottom.and.width.equalTo(self.unfoldBtn);
    }];
    
    
}


@end
