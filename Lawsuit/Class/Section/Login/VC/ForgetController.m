//
//  ForgetController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/7.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "ForgetController.h"
#import "ForgetRegion.h"

@interface ForgetController ()

@property (strong, nonatomic) UIScrollView* scrollView;


@end

@implementation ForgetController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
}

-(void)setUI{
    [self.view addSubview:self.scrollView];
    ForgetRegion* forgetRegion = [[ForgetRegion alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kStatusHeight-44)];
    forgetRegion.backgroundColor = [UIColor whiteColor];
    forgetRegion.layer.cornerRadius = 20;
    [self.scrollView addSubview:forgetRegion];
    
}

#pragma mark 懒加载scrollview
-(UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kStatusHeight+44, kScreenWidth, kScreenHeight)];
        _scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _scrollView;
}

-(void)dealloc{
    NSLog(@"dealloc");
}


@end
