//
//  ViewController.m
//  Lawsuit
//
//  Created by xiadalu on 2017/11/22.
//  Copyright © 2017年 xiadalu. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 200, 100);
    [btn setTitle:@"我说" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ViewController2* vc2 = [[ViewController2 alloc] init];
    [self presentViewController:vc2 animated:YES completion:nil];
    
    NSLog(@"%@",vc2);
}


@end
