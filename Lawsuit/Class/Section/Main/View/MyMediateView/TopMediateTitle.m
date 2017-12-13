//
//  TopMediateTitle.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/6.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "TopMediateTitle.h"

@implementation TopMediateTitle


-(instancetype)initWithFrame:(CGRect)frame state:(NSString*)state title:(NSString*)title code:(NSString*)code{
    self = [super initWithFrame:frame];
    if (self) {
        self.stateLabel = [[UILabel alloc] init];
        self.stateLabel.backgroundColor = [UIColor redColor];
        self.stateLabel.font = [UIFont systemFontOfSize:18];
        self.stateLabel.text = state;
        [self addSubview:self.stateLabel];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.text = title;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:19];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.titleLabel];
        
        self.codeLabel = [[UILabel alloc] init];
        self.codeLabel.text = code;
        self.codeLabel.font = [UIFont boldSystemFontOfSize:19];
        self.codeLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.codeLabel];
        
        [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self).offset(20);
            make.bottom.equalTo(self).offset(-20);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.stateLabel.mas_right).offset(10);
            make.height.equalTo(self.stateLabel).multipliedBy(0.5);
            make.top.equalTo(self.stateLabel);
            
        }];
        
        [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel);
            make.top.mas_equalTo(self.titleLabel.mas_bottom);
            make.width.height.mas_equalTo(self.titleLabel);
        }];
        
    }
    return self;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
