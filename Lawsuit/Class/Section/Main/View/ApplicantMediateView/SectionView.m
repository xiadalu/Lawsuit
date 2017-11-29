//
//  SectionView.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/29.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "SectionView.h"

@implementation SectionView

-(instancetype)initWithFrame:(CGRect)frame labelText:(NSString*)text buttonText:(NSString*)title{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _text = text;
        _title = title;
        [self createUI];
    }
    return self;
}
-(void)createUI{
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn.frame = CGRectMake(w-100, 5, 100, h-10);
    [self.selectBtn setTitle:@"请选择>" forState:UIControlStateNormal];
    [self.selectBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:self.selectBtn];
    
}

- (void)drawRect:(CGRect)rect {
    CGFloat vH = rect.size.height;
    // 画image
    UIImage* image = [UIImage imageNamed:@"diandian"];
    CGFloat imageH = image.size.height;
    CGFloat imageW = image.size.width;
    [image drawInRect:CGRectMake(0, (vH-imageH)/2, imageW, imageH)];
   
    //画文字
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    CGSize size = [NSString calculateWidthOrHeight:rect.size.height andBool:NO andStr:_text andFond:font];
    CGFloat textW = size.width;
    CGFloat textH = size.height;
    [_text drawInRect:CGRectMake(imageW, (vH-textH)/2, textW, textH) withAttributes:@{
     NSFontAttributeName:font}];
    
}




@end
