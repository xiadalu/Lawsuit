//
//  NextStepNestCell.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/30.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "NextStepNestCell.h"

@implementation NextStepNestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self createUI];
        
    }
    return self;
}
-(void)createUI{
    self.textField = [[DashesTextField alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-30, 40)];
    self.textField.labelStr = @"姓名";
    [self.contentView addSubview:self.textField];
}
@end
