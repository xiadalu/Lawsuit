//
//  SectionView.h
//  Lawsuit
//
//  Created by xiadalu on 2017/11/29.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionView : UITableViewHeaderFooterView


@property(nonatomic,strong)UIButton* selectBtn;

@property(nonatomic,copy)NSString* labelStr;

@property(nonatomic,copy)NSString* btnTitle;

@property(nonatomic,copy)NSString* btnImageName;

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
