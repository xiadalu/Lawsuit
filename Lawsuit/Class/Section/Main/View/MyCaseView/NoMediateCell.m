//
//  NoMediateCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/28.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "NoMediateCell.h"

@interface NoMediateCell ()


@end


@implementation NoMediateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setUI{
    
    [super setUI];
    
    self.processImage.hidden = NO;
    self.stateLabel.hidden = YES;
    
    self.reeditBtn.hidden = YES;
    self.rescindBtn.hidden = NO;
    
    [self.rescindBtn addTarget:self action:@selector(rescindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)rescindBtnClick:(UIButton*)btn{
    
}



@end
