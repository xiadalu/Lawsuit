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
    [self setNavigation];
    [self setUI];
    
}
-(void)setNavigation{
     [self.view addSubview:self.myNav];
}

-(void)setUI{
    
}
#pragma mark ------------------delegate/dataSource-------------------
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc] init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}


-(MyNav*)myNav{
    if (!_myNav) {
        _myNav = [[MyNav alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kStatusHeight+44)];
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



//默认的值是黑色的
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
    
}

-(void)popAction{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
