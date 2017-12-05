//
//  BaseController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/23.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupMyNav];
//
    [self setUI];
}
-(void)setUI{
    
}
-(void)setupMyNav{
    [self.view addSubview:self.myNav];
}

-(MyNav*)myNav{
    if (!_myNav) {
        _myNav = [[MyNav alloc] init];
        _myNav.navImageView.backgroundColor = MainColor;
        
        _myNav.titleLabel.textColor = [UIColor whiteColor];
        [_myNav.leftBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        [_myNav.leftBtn addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _myNav;
}

-(void)setTitle:(NSString *)title{
    self.myNav.titleLabel.text = title;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (@available(iOS 11.0, *)) {
        self.myNav.frame = CGRectMake(0, 0, kScreenWidth, self.view.safeAreaInsets.top+44);
    } else {
        self.myNav.frame = CGRectMake(0, 0, kScreenWidth, 64);
    }
}

//默认的值是黑色的
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
    
}

-(void)popAction{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
