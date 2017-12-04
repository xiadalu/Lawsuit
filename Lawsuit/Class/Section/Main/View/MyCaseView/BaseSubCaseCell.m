//
//  BaseSubCaseCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/27.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "BaseSubCaseCell.h"



@implementation BaseSubCaseCell

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
    self.processImage.contentMode = UIViewContentModeScaleAspectFill;
    [self.backView addSubview:self.processImage];
    
    self.stateLabel = [[UILabel alloc] init];
    self.stateLabel.text = @"未审核";
    self.stateLabel.textColor = [UIColor cz_colorWithRed:44 green:205 blue:109];
    self.stateLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.backView addSubview:self.stateLabel];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:15];
    [self.backView addSubview:self.timeLabel];
    
    self.rescindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rescindBtn setTitle:@"撤销调解" forState:UIControlStateNormal];
    [self.rescindBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.rescindBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.rescindBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    self.rescindBtn.layer.cornerRadius = 5;
    self.rescindBtn.layer.borderWidth = 1;
    
    [self.backView addSubview:self.rescindBtn];
    
    self.reeditBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.reeditBtn setTitle:@"进入调解" forState:UIControlStateNormal];
    [self.reeditBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.reeditBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.reeditBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    self.reeditBtn.layer.cornerRadius = 5;
    self.reeditBtn.layer.borderWidth = 1;
    [self.backView addSubview:self.reeditBtn];
    
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
    
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(Margin);
        make.width.mas_equalTo(kScreenWidth-20);
        make.height.mas_equalTo(50);
    }];
    
    [self.rescindBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.processImage.mas_bottom).offset(5);
        make.right.mas_equalTo(self.processImage);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    [self.reeditBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(self.rescindBtn);
        make.width.equalTo(self.rescindBtn);
        make.right.equalTo(self.rescindBtn.mas_left).offset(-10);
        
    }];
    
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.processImage.mas_bottom);
        make.left.mas_equalTo(self.processImage);
        make.height.mas_equalTo(40);
        make.right.mas_equalTo(self.reeditBtn.mas_left).offset(20);
    }];
}

-(void)setModel:(BaseSubCaseModel *)model{
    _model = model;
    
    self.titleLabel.text = _model.title;
    self.timeLabel.text = _model.time;

    if ([model.state isEqualToString:@"00"]) {
        self.stateLabel.text = @"未审核";
    }
    
    if ([model.state isEqualToString:@"01"]) {
        self.stateLabel.text = @"审核不通过";
        self.stateLabel.textColor = [UIColor redColor];
    }
    
    if ([model.state isEqualToString:@"10"]) {
        self.processImage.image = [UIImage imageNamed:@"homep1_order_ste0"];
    }
    
    if ([model.state isEqualToString:@"11"]) {
        self.processImage.image = [UIImage imageNamed:@"homep1_order_ste1"];
    }
    
    if ([model.state isEqualToString:@"12"]) {
        self.processImage.image = [UIImage imageNamed:@"homep1_order_ste2"];
    }
   
    
}



@end
