//
//  ListCaseCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/27.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "ListCaseCell.h"

#define Margin  10

@implementation ListCaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self setUI];
    }
    return self;
}

-(void)setUI{
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.backView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [self.backView addSubview:self.titleLabel];
    
    self.processImage = [[UIImageView alloc] init];
    self.processImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.backView addSubview:self.processImage];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:15];
    [self.backView addSubview:self.timeLabel];
    
//    self.enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.enterBtn setTitle:@"进入调解" forState:UIControlStateNormal];
//    [self.enterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
//    [self.enterBtn addTarget:self action:@selector(enterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.backView addSubview:self.enterBtn];
    
    [self autoLayout];
}
-(void)autoLayout{
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(10);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(130);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(Margin);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(kScreenWidth-20);
    }];
    
    [self.processImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(Margin);
        make.width.mas_equalTo(kScreenWidth-20);
        make.height.mas_equalTo(50);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.processImage.mas_bottom);
        make.left.mas_equalTo(self.processImage);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(kScreenWidth*0.7);
    }];
    
//    [self.enterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.processImage.mas_bottom);
//        make.right.mas_equalTo(self.processImage);
//        make.width.mas_equalTo(80);
//        make.height.mas_equalTo(40);
//    }];
    
    
}

#pragma mark 进入我的调解
-(void)enterBtnClick:(UIButton*)btn{
    
}
-(void)setModel:(ListCaseModel *)model{
    _model = model;
    self.titleLabel.text = _model.title;
    self.processImage.image = [UIImage imageNamed:_model.state];
    self.timeLabel.text = _model.time;
    
}

@end
