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
        self.contentView.backgroundColor=[UIColor cz_colorWithRed:241 green:241 blue:241];
        // title
        self.textField = [[DashesTextField alloc] init];
        [self.contentView addSubview:self.textField];
       
        self.textField.font = [UIFont systemFontOfSize:17];
        __weak __typeof(self) weakSelf = self;
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView).offset(10);
            make.right.equalTo(weakSelf.contentView).offset(-20);
            make.top.bottom.equalTo(weakSelf.contentView);
        }];
        
        self.hyb_lastViewInCell = self.textField;
    }
    
    return self;
}
-(void)configCellWithModel:(InsideNextStepModel *)model{
    self.textField.text = model.comment;
}


@end
