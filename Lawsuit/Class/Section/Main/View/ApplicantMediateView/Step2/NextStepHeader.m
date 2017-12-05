//
//  NextStepHeader.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/4.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "NextStepHeader.h"

@interface NextStepHeader()

@property(nonatomic,strong)UIView* bottomLineView;

//@property(nonatomic,strong)UIView* topLineView;


@end

@implementation NextStepHeader

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
//    self.topLineView = [[UIView alloc] init];
//    self.topLineView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
//    [self.contentView addSubview:self.topLineView];
    
    
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    
    
    self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [self.addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.addBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.addBtn];
    
    self.bottomLineView = [[UIView alloc] init];
    self.bottomLineView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    [self.contentView addSubview:self.bottomLineView];
    
//    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(self.contentView);
//        make.height.mas_equalTo(20);
//    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(160);
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(60);
    }];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(10);
    }];
    
   
}

@end
