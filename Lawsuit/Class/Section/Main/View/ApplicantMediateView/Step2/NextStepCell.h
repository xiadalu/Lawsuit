//
//  NextStepCell.h
//  Lawsuit
//
//  Created by xiadalu on 2017/12/4.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NextStepModel;

@protocol TestCellDelegate <NSObject>

- (void)reloadCellHeightForModel:(NextStepModel *)model atIndexPath:(NSIndexPath*)indexPath;

@end

@interface NextStepCell : UITableViewCell


@property(nonatomic,weak)id delegate;

-(void)configCellWithModel:(NextStepModel*)model indexPath:(NSIndexPath*)indexPath;

@end
