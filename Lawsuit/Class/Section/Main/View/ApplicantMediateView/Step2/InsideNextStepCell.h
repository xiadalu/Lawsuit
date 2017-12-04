//
//  InsideNextStepCell.h
//  Lawsuit
//
//  Created by xiadalu on 2017/12/4.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InsideNextStepModel.h"

@interface InsideNextStepCell : UITableViewCell

@property (nonatomic, strong) UILabel *contentLabel;


-(void)configCellWithModel:(InsideNextStepModel*)model;

@end