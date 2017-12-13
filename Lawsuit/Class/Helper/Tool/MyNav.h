//
//  MyNav.h
//  CustomNavBar
//
//  Created by dl on 14-8-11.
//  Copyright (c) 2014年 dl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Masonry.h>

@interface MyNav : UIView


@property(nonatomic,retain)UIImageView *navImageView;
@property(nonatomic,retain)UILabel *titleLabel;
@property(nonatomic,retain)UIButton*leftBtn;
@property(nonatomic,retain)UIButton*rightBtn;

-(void)createNav;


@end
