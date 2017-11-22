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
    
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 100, 200, 100);
    [btn2 setTitle:@"你是" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ViewController2* vc2 = [[ViewController2 alloc] init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc2];
    [self presentViewController:nav animated:YES completion:nil];
}



@end
