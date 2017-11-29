//
//  SectionView.h
//  Lawsuit
//
//  Created by xiadalu on 2017/11/29.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionView : UIView


@property(nonatomic,strong)UIButton* selectBtn;
@property(nonatomic,copy)NSString* text;
@property(nonatomic,copy)NSString* title;

-(instancetype)initWithFrame:(CGRect)frame labelText:(NSString*)text buttonText:(NSString*)title;


@end
