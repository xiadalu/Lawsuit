//
//  IdentityCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/11.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "IdentityCell.h"

@interface IdentityCell ()

@property(nonatomic,strong)UIButton* agentBtn;

@property(nonatomic,strong)UIButton* litigantBtn;

@end


@implementation IdentityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel* label = [[UILabel alloc] init];
        label.text = @"选择身份";
        [self.contentView addSubview:label];
        
        [self.contentView addSubview:self.litigantBtn];
        
        [self.contentView addSubview:self.agentBtn];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(10);
            make.height.mas_equalTo(20);
        }];
        
        [self.litigantBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label);
            make.top.equalTo(label.mas_bottom).offset(10);
            make.width.mas_equalTo((kScreenWidth-30)/2);
            make.height.mas_equalTo(30);
        }];
        
        [self.agentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.litigantBtn.mas_right).offset(10);
            make.top.width.height.mas_equalTo(self.litigantBtn);
        }];
    }
    return self;
}

-(UIButton*)litigantBtn{
    if (!_litigantBtn) {
        _litigantBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _litigantBtn.selected = YES;
        [_litigantBtn setTitle:@"当事人" forState:UIControlStateNormal];
        [_litigantBtn setTitleColor:[UIColor cz_colorWithRed:255 green:147 blue:142] forState:UIControlStateSelected];
        [_litigantBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_litigantBtn setBackgroundImage:[UIImage createImageWithColor:[UIColor cz_colorWithRed:255 green:247 blue:247]] forState:UIControlStateSelected];
        [_litigantBtn setBackgroundImage:[UIImage createImageWithColor:[UIColor cz_colorWithRed:245 green:245 blue:245]] forState:UIControlStateNormal];
        _litigantBtn.tag = 1001;
        [_litigantBtn addTarget:self action:@selector(selectIden:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _litigantBtn;
}


-(UIButton*)agentBtn{
    if (!_agentBtn) {
        _agentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_agentBtn setTitle:@"代理人" forState:UIControlStateNormal];
        [_agentBtn setTitleColor:[UIColor cz_colorWithRed:255 green:147 blue:142] forState:UIControlStateSelected];
        [_agentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_agentBtn setBackgroundImage:[UIImage createImageWithColor:[UIColor cz_colorWithRed:255 green:247 blue:247]] forState:UIControlStateSelected];
        [_agentBtn setBackgroundImage:[UIImage createImageWithColor:[UIColor cz_colorWithRed:245 green:245 blue:245]] forState:UIControlStateNormal];
        _agentBtn.tag = 1000;
        [_agentBtn addTarget:self action:@selector(selectIden:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agentBtn;
}

-(void)selectIden:(UIButton*)btn{
//    btn.selected = !btn.selected;
    for (UIView* tempView in self.contentView.subviews) {
        if ([tempView isKindOfClass:[UIButton class]]) {
            UIButton* currentBtn = (UIButton*)tempView;
            if (currentBtn.tag == btn.tag) {
                currentBtn.selected = YES;
                currentBtn.userInteractionEnabled = NO;
            }else{
                currentBtn.selected = NO;
                currentBtn.userInteractionEnabled = YES;
            }
        }
    }
}

@end
