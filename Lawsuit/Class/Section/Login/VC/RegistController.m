//
//  RegistController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/5.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "RegistController.h"

#import "RegistRegion.h"

@interface RegistController ()

@property (strong, nonatomic) UIScrollView* scrollView;

@property(nonatomic,strong)RegistRegion* registRegion;

@end

@implementation RegistController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册";
    
}


-(void)setUI{
    
    [self.view addSubview:self.scrollView];
    
    self.registRegion = [[RegistRegion alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kStatusHeight-44)];
    
    [self.scrollView addSubview:self.registRegion];
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


@end
