//
//  InsideNextStepCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/4.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "InsideNextStepCell.h"

@implementation InsideNextStepCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // title
        self.contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.contentLabel];
        self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.font = [UIFont systemFontOfSize:17];
        __weak __typeof(self) weakSelf = self;
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(weakSelf.contentView);
        }];
        
        self.hyb_lastViewInCell = self.contentLabel;
    }
    
    return self;
}
-(void)configCellWithModel:(InsideNextStepModel *)model{
    self.contentLabel.text = model.comment;
}


@end
