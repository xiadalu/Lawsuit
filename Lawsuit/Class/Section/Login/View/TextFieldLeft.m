//
//  TextFieldLeft.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/5.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "TextFieldLeft.h"

#define kLeftImageWidth     50


@implementation TextFieldLeft


-(instancetype)initWithFrame:(CGRect)frame leftImageName:(NSString *)imageName placehold:(NSString *)placehold{
    self = [super initWithFrame:frame];
    if (self) {
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        //左边
        UIImageView* leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kLeftImageWidth, self.frame.size.height)];
        leftImageView.image = [UIImage imageNamed:imageName];
        leftImageView.contentMode = UIViewContentModeCenter;
        self.leftView = leftImageView;
        self.leftViewMode = UITextFieldViewModeAlways;
        //占位
        self.placeholder = placehold;
    }
    return self;
}

-(void)createUI{
    
}
-(void)drawRect:(CGRect)rect{
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, kLeftImageWidth, h);
    CGContextAddLineToPoint(ctx, w, h);
    CGContextStrokePath(ctx);
}


@end
