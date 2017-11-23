//
//  MainController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/23.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "MainController.h"
#import "AppDelegate.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
}
-(void)setupMyNav{
    self.myNav = [[MyNav alloc] init];
    self.myNav.navImageView.backgroundColor = [UIColor cz_colorWithRed:80 green:137 blue:235];
    
    self.myNav.titleLabel.textColor = [UIColor whiteColor];
    [self.myNav.leftBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [self.myNav.leftBtn addTarget:self action:@selector(openLeft:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.myNav];
}
-(void)openLeft:(UIButton*)btn{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.leftSliderVC.closed)
    {
        [tempAppDelegate.leftSliderVC openLeftView];
    }
    else
    {
        [tempAppDelegate.leftSliderVC closeLeftView];
    }
}
@end
