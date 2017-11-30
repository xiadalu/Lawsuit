//
//  LineTextView.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/29.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "LineTextView.h"

@implementation LineTextView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    //画虚线矩形框
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor grayColor] set];
    CGContextSetLineWidth(ctx, 2);
    
    CGContextSaveGState(ctx);
    CGContextAddRect(ctx, rect);
    CGFloat lengths[] = {4,2};
    CGContextSetLineDash(ctx, 0, lengths, 2);
    
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);
    //画那两道斜线
    CGContextMoveToPoint(ctx, w-15, h-5);
    CGContextAddLineToPoint(ctx, w-5, h-15);
    CGContextStrokePath(ctx);

    CGContextMoveToPoint(ctx, w-10, h-5);
    CGContextAddLineToPoint(ctx, w-5, h-10);
    CGContextStrokePath(ctx);
    
}


@end
