//
//  ApplicantTextViewCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/29.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "ApplicantTextViewCell.h"

@implementation ApplicantTextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textView = [[LineTextView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-20, 150)];
        [self.contentView addSubview:self.textView];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
