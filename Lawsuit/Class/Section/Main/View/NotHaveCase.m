//
//  NotHaveCase.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/27.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "NotHaveCase.h"

@implementation NotHaveCase

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}


-(void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth, 30)];
    label.text = @"暂无案件";
    label.font = [UIFont boldSystemFontOfSize:25];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    UILabel* lable2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, kScreenWidth, 60)];
    lable2.text = @"可以点击上方“申请调解”快速添加案件\n也可以点击“输入关联码“快速进入案件";
    lable2.adjustsFontSizeToFitWidth = YES;
    lable2.numberOfLines = 0;
    lable2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lable2];
    
}
@end
