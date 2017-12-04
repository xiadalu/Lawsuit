//
//  NoMediateController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/28.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "NoMediateController.h"
#import "NoMediateCell.h"
#import "BaseSubCaseModel.h"

@interface NoMediateController ()

@end

@implementation NoMediateController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)loadData{
    for (int i = 0 ; i < 10; i++) {
        NSDictionary* dic = @{@"title":@"张三与李四的交通事故纠纷",
                              @"state":@"10",
                              @"time":@"2016-04-12 10:20",
                              };
        BaseSubCaseModel* model = [BaseSubCaseModel yy_modelWithJSON:dic];
        NSLog(@"[%@]",model);
        [self.listArray addObject:model];
    }
}



-(NoMediateCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"iden";
    NoMediateCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[NoMediateCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:iden];
    }
    
    BaseSubCaseModel* model = self.listArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

@end
