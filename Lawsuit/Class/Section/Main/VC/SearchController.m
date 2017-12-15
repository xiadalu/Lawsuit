//
//  SearchController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/12/15.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "SearchController.h"
#import "Product.h"
#import "ResultTableViewController.h"

@interface SearchController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating>

@property(nonatomic,strong)UISearchController* searchController;

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* searchResults;

@property(nonatomic,strong)NSArray* products;

@end

@implementation SearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"题目";
    
    
}
-(void)setUI{
    self.products = [Product allProducts];
    [self.view addSubview:self.tableView];
    
    ResultTableViewController* resultVC = [[ResultTableViewController alloc] init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:resultVC];
    self.searchController.searchBar.delegate = self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.placeholder = @"搜索案件";
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    self.definesPresentationContext = YES;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.products.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"iden";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    Product* product = [self.products objectAtIndex:indexPath.row];
    cell.textLabel.text = product.name;
    return cell;
}
#pragma mark 点击搜索
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchResults removeAllObjects];
    

    if (self.searchController.searchResultsController) {
        
        ResultTableViewController *vc = (ResultTableViewController *)self.searchController.searchResultsController;
        vc.searchResults = self.searchResults;
    }
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
}



-(NSMutableArray*)searchResults{
    if (!_searchResults) {
        _searchResults = [NSMutableArray array];
    }
    return _searchResults;
}

#pragma mark - UISearchBarDelegate
-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    [self updateSearchResultsForSearchController:self.searchController];
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    CGRect frame = self.tableView.frame;
    frame.origin.y = kStatusHeight;
    self.tableView.frame = frame;
    
    [self.tableView reloadData];
}

#pragma mark 点击取消
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    CGRect frame = self.tableView.frame;
    frame.origin.y = kStatusHeight+44;
    self.tableView.frame = frame;
   
}

#pragma mark 懒加载tableView
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44+kStatusHeight, kScreenWidth, kScreenHeight-44-kStatusHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
-(NSArray*)products{
    if (!_products) {
        _products = [NSArray array];
    }
    return _products;
}
@end
