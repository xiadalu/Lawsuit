//
//  WaitAuditCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/28.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "WaitAuditCell.h"

@implementation WaitAuditCell


-(void)setUI{
    
    [super setUI];
    
    self.processImage.hidden = YES;
    self.stateLabel.hidden = NO;
    
    self.reeditBtn.hidden = NO;
    self.rescindBtn.hidden = NO;
    
    [self.reeditBtn setTitle:@"再次编辑" forState:UIControlStateNormal];
    [self.reeditBtn addTarget:self action:@selector(reeditBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)reeditBtnClick:(UIButton*)btn{
    
}


@end
