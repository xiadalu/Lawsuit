//
//  CustomTextField.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/7.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "CustomTextField.h"


@interface CustomTextField()



@end

@implementation CustomTextField


-(instancetype)initWithFrame:(CGRect)frame leftImageName:(NSString *)leftname rightImageName:(NSString *)rightname placeholder:(NSString *)placeholder{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = frame.size.height/2;
        self.backgroundColor = [UIColor cz_colorWithRed:239 green:239 blue:239];
        UIView* leftBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.height+20, frame.size.height)];
        
        UIImageView* leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, frame.size.height, frame.size.height)];
        leftImage.image = [UIImage imageNamed:leftname];
        leftImage.contentMode = UIViewContentModeCenter;
        [leftBackView addSubview:leftImage];
        
        CGFloat lineX = CGRectGetMaxX(leftImage.frame);
        UIView* lineView = [[UIView alloc] initWithFrame:CGRectMake(lineX, (frame.size.height-20)/2, 1, 20)];
        lineView.backgroundColor = [UIColor cz_colorWithRed:209 green:209 blue:209];
        [leftBackView addSubview:lineView];
        
        self.leftView = leftBackView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        if (IsNOTNullOrEmptyOfNSString(@"")) {
            UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            rightBtn.frame = CGRectMake(0, 0, frame.size.height, frame.size.height);
            [rightBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            rightBtn.imageView.contentMode = UIViewContentModeCenter;
            self.rightView = rightBtn;
            self.rightViewMode = UITextFieldViewModeAlways;
        }
        
        self.placeholder = placeholder;
    }
    return self;
}



-(void)dealloc{
    NSLog(@"textDealloc");
}
@end
