//
//  MediatingCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/28.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "MediatingCell.h"

@implementation MediatingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setUI{
    
    [super setUI];
    
    self.processImage.hidden = NO;
    self.stateLabel.hidden = YES;
    
    self.reeditBtn.hidden = NO;
    self.rescindBtn.hidden = NO;
    
    [self.reeditBtn setTitle:@"进入调解" forState:UIControlStateNormal];
    [self.reeditBtn addTarget:self action:@selector(reeditBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.rescindBtn addTarget:self action:@selector(rescindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

//撤销调解
-(void)rescindBtnClick:(UIButton*)btn{
    
}
//进入调解
-(void)reeditBtnClick:(UIButton*)btn{
    
}
@end
