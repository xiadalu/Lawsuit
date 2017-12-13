//
//  BaseController.h
//  Lawsuit
//
//  Created by xiadalu on 2017/11/23.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController

//@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)MyNav* myNav;

-(void)setUI;
-(void)setNavigation;
-(void)popAction;

@end
