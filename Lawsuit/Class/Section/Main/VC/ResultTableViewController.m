
//
//  ResultTableViewController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/15.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "ResultTableViewController.h"
#import "Product.h"



@interface ResultTableViewController ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation ResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.searchResults.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"iden";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    Product* product = [self.searchResults objectAtIndex:indexPath.row];
    cell.textLabel.text = product.name;
    return cell;
}

-(void)setSearchResults:(NSArray *)searchResults{
    _searchResults = searchResults;
    [self.tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kStatusHeight+44, kScreenWidth, kScreenHeight-kStatusHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _tableView;
}


@end
