//
//  RightCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/8.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "RightCell.h"

#define Margin   10

@interface RightCell ()

@property(nonatomic,strong)UIView* backView;

@property(nonatomic,strong)UIImageView* thumImageView;

@property(nonatomic,strong)UILabel* titleLabel;

@property(nonatomic,strong)UILabel* introLabel;

@property(nonatomic,strong)UILabel* timeLabel;

@end

@implementation RightCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor cz_colorWithRed:245 green:245 blue:245];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.backView];
    
    self.thumImageView = [[UIImageView alloc] init];
    self.thumImageView.contentMode = UIViewContentModeCenter;
    [self.backView addSubview:self.thumImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self.backView addSubview:self.titleLabel];
    
    self.introLabel = [[UILabel alloc] init];
    self.introLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    self.introLabel.textColor = [UIColor cz_colorWithRed:160 green:160 blue:160];
    self.introLabel.adjustsFontSizeToFitWidth = YES;
    [self.backView addSubview:self.introLabel];
    
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    
    self.timeLabel.textAlignment = NSTextAlignmentRight;
    self.timeLabel.textColor = [UIColor cz_colorWithRed:160 green:160 blue:160];
    [self.backView addSubview:self.timeLabel];
    
    
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
        make.bottom.right.equalTo(self.contentView).offset(-10);
    }];
    
    [self.thumImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.backView).offset(Margin);
        make.bottom.equalTo(self.backView).offset(-Margin);
        make.width.mas_equalTo(self.thumImageView.mas_height);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.thumImageView.mas_right).offset(Margin);
        make.top.equalTo(self.thumImageView);
        make.right.equalTo(self.backView).offset(-80);
        make.height.mas_equalTo(20);
    }];
    
    [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.backView).offset(-90);
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
        make.bottom.mas_equalTo(self.thumImageView);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.backView.mas_right).offset(-10);
        make.top.mas_equalTo(self.thumImageView);
        make.height.mas_equalTo(20);
    }];
    
    
}


-(void)setModel:(RightModel *)model{
    self.titleLabel.text = model.title;
    self.introLabel.text = model.intro;
    self.timeLabel.text = model.time;
}



@end
