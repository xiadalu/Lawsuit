//
//  BaseMediateController.h
//  Lawsuit
//
//  Created by xiadalu on 2017/12/6.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseMediateController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* listArray;

@end
