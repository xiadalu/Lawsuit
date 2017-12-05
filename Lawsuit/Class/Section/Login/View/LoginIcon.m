//
//  LoginIcon.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/5.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "LoginIcon.h"


@interface LoginIcon()

@property(nonatomic,strong)UIImage* image;

@property(nonatomic,copy)NSString* labelStr;

@end

@implementation LoginIcon


-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image labelStr:(NSString *)labelStr{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _image = image;
        _labelStr = labelStr;
    }
    return self;
}

-(void)setImage:(UIImage *)image{
    _image = image;
}

-(void)setLabelStr:(NSString *)labelStr{
    _labelStr = labelStr;
}

- (void)drawRect:(CGRect)rect {
    
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    //图片
    UIImage* image = _image;
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    [image drawAtPoint:CGPointMake((w-imageW)*0.5, (h-imageH)*0.5)];
    //文字
    CGSize size = [NSString calculateWidthOrHeight:30 andBool:NO andStr:_labelStr andFond:[UIFont boldSystemFontOfSize:18]];
    [_labelStr drawAtPoint:CGPointMake((w-size.width)*0.5, (h+imageH)*0.5+10) withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    
}


@end
