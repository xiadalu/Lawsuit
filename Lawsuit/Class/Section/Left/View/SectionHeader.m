//
//  SectionHeader.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/23.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "SectionHeader.h"

@implementation SectionHeader

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.avatarImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 70, 70)];
    [self addSubview:self.avatarImage];
    self.usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 80, 30)];
    self.usernameLabel.text = @"用户名";
    [self addSubview:self.usernameLabel];
    
}

@end
