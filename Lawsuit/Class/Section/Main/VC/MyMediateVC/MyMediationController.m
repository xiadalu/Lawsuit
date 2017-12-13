//
//  MyMediationController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/27.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "MyMediationController.h"
#import "SGPagingView.h"

#import "EvidenceManageController.h"
#import "LawsuitMaterialController.h"
#import "CaseProgressController.h"
#import "CasePersonnelController.h"
#import "JudgeWritController.h"
#import "TopMediateTitle.h"

@interface MyMediationController ()<SGPageTitleViewDelegate,SGPageContentViewDelegate>


@property(nonatomic,strong)SGPageTitleView* pageTitleView;
@property(nonatomic,strong)SGPageContentView* pageContentView;

@end

@implementation MyMediationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的调解";
    
}

-(void)setUI{
    CGFloat statusHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    CGFloat pageTitleViewY = 0;
    if (statusHeight == 20.0) {
        pageTitleViewY = 64;
    } else {
        pageTitleViewY = 88;
    }
    TopMediateTitle* topTitle = [[TopMediateTitle alloc] initWithFrame:CGRectMake(0, pageTitleViewY, kScreenWidth, 99) state:@"已介入" title:@"张三与李四的交通事故纠纷" code:@"案件流水号：1287918312"];
    topTitle.backgroundColor = [UIColor cz_colorWithRed:242 green:242 blue:242];
    [self.view addSubview:topTitle];
    
    
    NSArray *titleArr = @[@"案件进度", @"证据管理", @"诉讼材料", @"案件人员",@"裁判文书"];
    
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleSelectedColor = [UIColor whiteColor];
    configure.indicatorStyle = SGIndicatorStyleCover;
    configure.indicatorColor = [UIColor blackColor];
    configure.indicatorAdditionalWidth = 100; // 说明：指示器额外增加的宽度，不设置，指示器宽度为标题文字宽度；若设置无限大，则指示器宽度为按钮宽度
    configure.indicatorHeight = 100;
    
    /// pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, pageTitleViewY+100, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    self.pageTitleView.backgroundColor = [UIColor cz_colorWithRed:242 green:242 blue:242];
//    self.pageTitleView.isShowBottomSeparator = NO;
    [self.view addSubview:_pageTitleView];
    _pageTitleView.selectedIndex = 1;
    
    
    CaseProgressController* caseProgressVC = [[CaseProgressController alloc] init];
    
    EvidenceManageController* evidenceManageVC = [[EvidenceManageController alloc] init];
    
    LawsuitMaterialController* lawsuitMaterialVC = [[LawsuitMaterialController alloc] init];
    
    CasePersonnelController* mediatingVC = [[CasePersonnelController alloc] init];
    
    JudgeWritController* judegeWritVC = [[JudgeWritController alloc] init];
    
    NSArray* childArr = @[caseProgressVC,evidenceManageVC,lawsuitMaterialVC,mediatingVC,judegeWritVC];
    
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
