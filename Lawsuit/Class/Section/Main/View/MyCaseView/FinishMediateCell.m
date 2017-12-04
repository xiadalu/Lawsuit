//
//  FinishMediateCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/28.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "FinishMediateCell.h"

@implementation FinishMediateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setUI{
    
    [super setUI];
    
    self.processImage.hidden = NO;
    self.stateLabel.hidden = YES;
    
    self.reeditBtn.hidden = YES;
    self.rescindBtn.hidden = YES;
}



@end
