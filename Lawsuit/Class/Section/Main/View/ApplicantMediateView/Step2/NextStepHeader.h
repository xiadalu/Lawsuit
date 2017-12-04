//
//  NextStepHeader.h
//  Lawsuit
//
//  Created by xiadalu on 2017/12/4.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextStepHeader : UITableViewHeaderFooterView

@property(nonatomic,strong)UILabel* titleLabel;

@property(nonatomic,strong)UIButton* addBtn;



-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
