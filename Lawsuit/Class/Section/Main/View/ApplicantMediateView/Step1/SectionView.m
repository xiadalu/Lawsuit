//
//  SectionView.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/29.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "SectionView.h"

@implementation SectionView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}


-(void)createUI{
    CGFloat w = kScreenWidth;
    CGFloat h = 60;
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn.frame = CGRectMake(w-100, 5, 100, h-10);
    [self.selectBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:self.selectBtn];
}

-(void)setBtnTitle:(NSString *)btnTitle{
    self.selectBtn.frame = CGRectMake(kScreenWidth-100, 5, 100, 60-10);
    [self.selectBtn setTitle:btnTitle forState:UIControlStateNormal];
}
-(void)setBtnImageName:(NSString *)btnImageName{
    self.selectBtn.frame = CGRectMake(kScreenWidth-60, 5, 60, 60-10);
    [self.selectBtn setImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
}
-(void)setLabelStr:(NSString *)labelStr{
    _labelStr = labelStr;
    
}
- (void)drawRect:(CGRect)rect {
    CGFloat vH = rect.size.height;
    //画矩形框（设置颜色）
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx, rect);
    [[UIColor whiteColor] set];
    CGContextFillPath(ctx);
    // 画image
    UIImage* image = [UIImage imageNamed:@"diandian"];
    CGFloat imageH = image.size.height;
    CGFloat imageW = image.size.width;
    [image drawInRect:CGRectMake(0, (vH-imageH)/2, imageW, imageH)];

    //画文字
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    CGSize size = [NSString calculateWidthOrHeight:rect.size.height andBool:NO andStr:_labelStr andFond:font];
    CGFloat textW = size.width;
    CGFloat textH = size.height;
    [_labelStr drawInRect:CGRectMake(imageW, (vH-textH)/2, textW, textH) withAttributes:@{
     NSFontAttributeName:font}];

}




@end
