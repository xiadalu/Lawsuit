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
    
    [self setupMyNav];
}

-(void)setupMyNav{
    self.myNav = [[MyNav alloc] init];
    self.myNav.navImageView.backgroundColor = [UIColor cz_colorWithRed:80 green:137 blue:235];
    
    self.myNav.titleLabel.textColor = [UIColor whiteColor];
    [self.myNav.leftBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [self.myNav.leftBtn addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.myNav];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
