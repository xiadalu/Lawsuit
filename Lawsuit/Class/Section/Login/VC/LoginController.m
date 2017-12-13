//
//  LoginController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/5.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "LoginController.h"

#import "ForgetController.h"
#import "LoginRegion.h"

@interface LoginController ()<UITextFieldDelegate>


@property (strong, nonatomic) UIScrollView* scrollView;

@property(nonatomic,strong)UILabel* versionLabel;


@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)setUI{
    
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor cz_colorWithRed:82 green:152 blue:252];
//
    LoginRegion* loginRegion = [[LoginRegion alloc] initWithFrame:CGRectMake(0, (kScreenHeight-kScreenWidth)/2-20, kScreenWidth, kScreenWidth)];
    loginRegion.backgroundColor = [UIColor cz_colorWithRed:200 green:245 blue:221];
   
    [self.scrollView addSubview:loginRegion];


    self.versionLabel = [[UILabel alloc] init];
    NSDictionary* infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString* appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    self.versionLabel.text = [NSString stringWithFormat:@"v版本%@",appVersion];
    self.versionLabel.textColor = [UIColor whiteColor];
    self.versionLabel.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:self.versionLabel];
   
   
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    if (@available(iOS 11.0, *)) {
        CGFloat bottom = self.view.safeAreaInsets.bottom;
        self.versionLabel.frame = CGRectMake(0, kScreenHeight-60-bottom, kScreenWidth, 40);
    } else {
        self.versionLabel.frame = CGRectMake(0, kScreenHeight-60, kScreenWidth, 40);
    }
}

#pragma mark 懒加载scrollview
-(UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _scrollView;
}


@end
