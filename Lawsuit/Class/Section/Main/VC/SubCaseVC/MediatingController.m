//
//  MediatingController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/28.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "MediatingController.h"
#import "MediatingCell.h"
#import "BaseSubCaseModel.h"

@interface MediatingController ()

@end

@implementation MediatingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)loadData{
    for (int i = 0 ; i < 10; i++) {
        NSDictionary* dic = @{@"title":@"张三与李四的交通事故纠纷",
                              @"state":@"11",
                              @"time":@"2016-04-12 10:20",
                              };
        BaseSubCaseModel* model = [BaseSubCaseModel yy_modelWithJSON:dic];
        NSLog(@"[%@]",model);
        [self.listArray addObject:model];
    }
}

-(MediatingCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* iden = @"iden";
    MediatingCell* cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[MediatingCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:iden];
    }
    
    BaseSubCaseModel* model = self.listArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

@end
