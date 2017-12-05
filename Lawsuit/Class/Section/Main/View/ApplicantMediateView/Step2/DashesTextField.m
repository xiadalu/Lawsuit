//
//  DashesTextField.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/30.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "DashesTextField.h"

#define     W   self.frame.size.width
#define     H   self.frame.size.height
@interface DashesTextField()

@property(nonatomic,strong)UIView* customLeftView;

@property(nonatomic,strong)UILabel* label;


@end

@implementation DashesTextField


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cz_colorWithRed:242 green:242 blue:242];
        [self createUI];
    }
    return self;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor cz_colorWithRed:242 green:242 blue:242];
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    self.customLeftView = [[UIView alloc] init];
    
    //图片
    UIImage* image = [UIImage imageNamed:@"diandian"];
    CGSize size = image.size;
    UIImageView* markImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (H-size.height)/2, size.width, size.height)];
    markImgView.image = image;
    [self.customLeftView addSubview:markImgView];
    
   //文字
    self.label = [[UILabel alloc] init];
    [self.customLeftView addSubview:self.label];
    
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = self.customLeftView;
    
    self.textAlignment = NSTextAlignmentRight;
    
    UIImageView* rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(W-30, 0, 30, H-2)];
    rightImgView.image = [UIImage imageNamed:@"contact"];
    rightImgView.contentMode = UIViewContentModeScaleAspectFit;
    self.rightView = rightImgView;
    self.rightViewMode = UITextFieldViewModeWhileEditing;

    
}
-(void)setLabelStr:(NSString *)labelStr{
    CGRect frame = self.frame;
    self.label.text = labelStr;
    CGSize size = [NSString calculateWidthOrHeight:30 andBool:NO andStr:labelStr andFond:[UIFont systemFontOfSize:17]];
    self.label.frame = CGRectMake(25, (frame.size.height-30)/2, size.width, 30);
    self.customLeftView.frame = CGRectMake(0, 0, 25+size.width, H-1);
}

//画虚线
- (void)drawRect:(CGRect)rect {
   
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, 0, H-1);
    CGContextAddLineToPoint(ctx, W, H-1);
   
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGFloat lengths[] = {10,5};
    CGContextSetLineDash(ctx, 0, lengths, 2);

    CGContextStrokePath(ctx);
    
    
}


@end
