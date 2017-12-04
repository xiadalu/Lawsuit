//
//  AllCaseController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/28.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "AllCaseController.h"
#import "BaseSubCaseModel.h"
#import "WaitAuditCell.h"
#import "NoMediateCell.h"
#import "MediatingCell.h"
#import "FinishMediateCell.h"

@interface AllCaseController ()

@end

@implementation AllCaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)loadData{
    for (int i = 0 ; i < 10; i++) {
        if (i<2) {
            NSDictionary* dic = @{@"title":@"张三与李四的交通事故纠纷",
                                  @"state":[NSString stringWithFormat:@"0%d",i],
                                  @"time":@"2016-04-12 10:20",
                                  };
            BaseSubCaseModel* model = [BaseSubCaseModel yy_modelWithJSON:dic];
            NSLog(@"[%@]",model);
            [self.listArray addObject:model];
        }else if (i<10){
            NSDictionary* dic = @{@"title":@"张三与李四的交通事故纠纷",
                                  @"state":[NSString stringWithFormat:@"1%d",i%3],
                                  @"time":@"2016-04-12 10:20",
                                  };
            BaseSubCaseModel* model = [BaseSubCaseModel yy_modelWithJSON:dic];
            NSLog(@"[%@]",model);
            [self.listArray addObject:model];
        }
        
        
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseSubCaseModel* model = self.listArray[indexPath.row];
    if ([model.state isEqualToString:@"00"]||[model.state isEqualToString:@"01"]) {
        static NSString* iden1 = @"iden1";
        WaitAuditCell* cell = [tableView dequeueReusableCellWithIdentifier:iden1];
        if (!cell) {
            cell = [[WaitAuditCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden1];
        }
        cell.model = model;
        return cell;
    }
    
    if ([model.state isEqualToString:@"10"]) {
        static NSString* iden2 = @"iden2";
        NoMediateCell* cell = [tableView dequeueReusableCellWithIdentifier:iden2];
        if (!cell) {
            cell = [[NoMediateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden2];
        }
        cell.model = model;
        return cell;
    }
    
    if ([model.state isEqualToString:@"11"]) {
        static NSString* iden3 = @"iden3";
        MediatingCell* cell = [tableView dequeueReusableCellWithIdentifier:iden3];
        if (!cell) {
            cell = [[MediatingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden3];
        }
        cell.model = model;
        return cell;
    }
    
    if ([model.state isEqualToString:@"12"]) {
        static NSString* iden4 = @"iden4";
        FinishMediateCell* cell = [tableView dequeueReusableCellWithIdentifier:iden4];
        if (!cell) {
            cell = [[FinishMediateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden4];
        }
        cell.model = model;
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
    
}


@end
