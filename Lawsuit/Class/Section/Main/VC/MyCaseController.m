//
//  MyCaseController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/27.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "MyCaseController.h"
#import "SGPagingView.h"
#import "BaseSubCaseController.h"
#import "AllCaseController.h"
#import "WaitAuditController.h"
#import "NoMediateController.h"
#import "MediatingController.h"
#import "FinishMediateController.h"
@interface MyCaseController ()<SGPageTitleViewDelegate,SGPageContentViewDelegate>


@property(nonatomic,strong)SGPageTitleView* pageTitleView;

@property(nonatomic,strong)SGPageContentView* pageContentView;

@end

@implementation MyCaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的案件";
}

-(void)setUI{
    
    CGFloat statusHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    CGFloat pageTitleViewY = 0;
    if (statusHeight == 20.0) {
        pageTitleViewY = 64;
    } else {
        pageTitleViewY = 88;
    }
    NSArray *titleArr = @[@"全部", @"待审核", @"未调解", @"调解中",@"已结束"];
    
    SGPageTitleViewConfigure* configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = [UIColor lightGrayColor];
    configure.titleSelectedColor = [UIColor blackColor];
    configure.indicatorColor = [UIColor blackColor];
   
    /// pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, pageTitleViewY, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    self.pageTitleView.isShowBottomSeparator = NO;
    [self.view addSubview:_pageTitleView];
    _pageTitleView.selectedIndex = 1;
    
    
    AllCaseController* allCaseVC = [[AllCaseController alloc] init];
    
    WaitAuditController* waitAuditVC = [[WaitAuditController alloc] init];
    NoMediateController* noMediateVC = [[NoMediateController alloc] init];
    MediatingController* mediatingVC = [[MediatingController alloc] init];
    FinishMediateController* finishVC = [[FinishMediateController alloc] init];
    NSArray* childArr = @[allCaseVC,waitAuditVC,noMediateVC,mediatingVC,finishVC];
    /// pageContentView
    CGFloat contentViewHeight = self.view.frame.size.height - CGRectGetMaxY(_pageTitleView.frame);
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), self.view.frame.size.width, contentViewHeight) parentVC:self childVCs:childArr];
    _pageContentView.delegatePageContentView = self;
    [self.view addSubview:_pageContentView];
}


- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageCententViewCurrentIndex:selectedIndex];
}

- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}


@end
