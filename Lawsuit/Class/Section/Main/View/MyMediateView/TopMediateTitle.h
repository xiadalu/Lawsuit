//
//  TopMediateTitle.h
//  Lawsuit
//
//  Created by xiadalu on 2017/12/6.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopMediateTitle : UIView


@property(nonatomic,strong)UILabel* stateLabel;

@property(nonatomic,strong)UILabel* titleLabel;

@property(nonatomic,strong)UILabel* codeLabel;

-(instancetype)initWithFrame:(CGRect)frame state:(NSString*)state title:(NSString*)title code:(NSString*)code;


@end
