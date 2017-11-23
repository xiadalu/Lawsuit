//
//  MyNav.m
//  CustomNavBar
//
//  Created by dl on 14-8-11.
//  Copyright (c) 2014年 dl. All rights reserved.
//

#import "MyNav.h"


#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

@implementation MyNav

-(instancetype)init{
    self = [super init];
    if (self) {
        [self createNav];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self layoutCustomUI];
}
//布局UI
-(void)createNav{

    //背景颜色
    self.navImageView = [[UIImageView alloc] init];
    self.navImageView.userInteractionEnabled = YES;
    self.navImageView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.navImageView];
    self.navImageView.translatesAutoresizingMaskIntoConstraints = NO;

    //标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.userInteractionEnabled = YES;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    //左侧返回键
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview: self.leftBtn];
    self.leftBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    //右侧返回键
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:self.rightBtn];
    self.rightBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
}

//布局
-(void)layoutCustomUI{
    //背景图
   [self addConstraint:[NSLayoutConstraint
                        constraintWithItem:self.navImageView
                        attribute:(NSLayoutAttributeTop)
                        relatedBy:(NSLayoutRelationEqual)
                        toItem:self
                        attribute:(NSLayoutAttributeTop)
                        multiplier:1.0
                        constant:0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.navImageView
                         attribute:(NSLayoutAttributeWidth)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:self
                         attribute:(NSLayoutAttributeWidth)
                         multiplier:1.0
                         constant:0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.navImageView
                         attribute:(NSLayoutAttributeHeight)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:self
                         attribute:(NSLayoutAttributeHeight)
                         multiplier:1.0
                         constant:0]];
   //title
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.titleLabel
                         attribute:(NSLayoutAttributeWidth)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:self
                         attribute:(NSLayoutAttributeWidth)
                         multiplier:1.0
                         constant:0]];
    
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.titleLabel
                         attribute:(NSLayoutAttributeHeight)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:nil
                         attribute:(NSLayoutAttributeHeight)
                         multiplier:1.0
                         constant:44]];
    if (@available(iOS 11.0, *)) {
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.titleLabel
                             attribute:(NSLayoutAttributeTop)
                             relatedBy:(NSLayoutRelationEqual)
                             toItem:self
                             attribute:(NSLayoutAttributeTop)
                             multiplier:1.0
                             constant:self.safeAreaInsets.top]];
    }else{
        [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.titleLabel
                         attribute:(NSLayoutAttributeTop)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:self
                         attribute:(NSLayoutAttributeTop)
                         multiplier:1.0
                         constant:20]];
    
    }
    
    //leftBtn
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.leftBtn
                         attribute:(NSLayoutAttributeLeft)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:self
                         attribute:(NSLayoutAttributeLeft)
                         multiplier:1.0
                         constant:0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.leftBtn
                         attribute:(NSLayoutAttributeWidth)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:nil
                         attribute:(NSLayoutAttributeWidth)
                         multiplier:1.0
                         constant:60]];
    
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.leftBtn
                         attribute:(NSLayoutAttributeHeight)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:nil
                         attribute:(NSLayoutAttributeHeight)
                         multiplier:1.0
                         constant:44]];
    
    
    if (@available(iOS 11.0, *)) {
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.leftBtn
                             attribute:(NSLayoutAttributeTop)
                             relatedBy:(NSLayoutRelationEqual)
                             toItem:self
                             attribute:(NSLayoutAttributeTop)
                             multiplier:1.0
                             constant:self.safeAreaInsets.top]];
    }else{
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.leftBtn
                             attribute:(NSLayoutAttributeTop)
                             relatedBy:(NSLayoutRelationEqual)
                             toItem:self
                             attribute:(NSLayoutAttributeTop)
                             multiplier:1.0
                             constant:20]];
        
    }
    
    
    //rightBtn
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.rightBtn
                         attribute:(NSLayoutAttributeRight)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:self
                         attribute:(NSLayoutAttributeRight)
                         multiplier:1.0
                         constant:-5]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.rightBtn
                         attribute:(NSLayoutAttributeWidth)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:nil
                         attribute:(NSLayoutAttributeWidth)
                         multiplier:1.0
                         constant:60]];
    
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.rightBtn
                         attribute:(NSLayoutAttributeHeight)
                         relatedBy:(NSLayoutRelationEqual)
                         toItem:nil
                         attribute:(NSLayoutAttributeHeight)
                         multiplier:1.0
                         constant:44]];
    
    
    if (@available(iOS 11.0, *)) {
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.rightBtn
                             attribute:(NSLayoutAttributeTop)
                             relatedBy:(NSLayoutRelationEqual)
                             toItem:self
                             attribute:(NSLayoutAttributeTop)
                             multiplier:1.0
                             constant:self.safeAreaInsets.top]];
    }else{
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.rightBtn
                             attribute:(NSLayoutAttributeTop)
                             relatedBy:(NSLayoutRelationEqual)
                             toItem:self
                             attribute:(NSLayoutAttributeTop)
                             multiplier:1.0
                             constant:20]];
        
    }
}


@end
