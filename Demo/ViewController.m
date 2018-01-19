//
//  ViewController.m
//  Demo
//
//  Created by Yang on 15/10/21.
//  Copyright (c) 2015年 Yang. All rights reserved.
//

#import "ViewController.h"
#import "YYTableViewController.h"
#import "mainViewController.h"
#import "RightViewController.h"
@interface ViewController ()

@end

@implementation ViewController


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent=YES;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nvbar.png"]forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    YYTableViewController *tableViewVc = [[YYTableViewController alloc] init];
    tableViewVc.view.frame = self.leftView.bounds;
    
    [self.leftView addSubview:tableViewVc.view];
    // 把A控制器的view 添加到B控制器的view上，那么A控制器必须成为B控制器的自控制器。
    [self addChildViewController:tableViewVc];
    
    
    mainViewController *mainViewVc = [[mainViewController alloc] init];
    mainViewVc.view.frame = self.mainView.bounds;
    
    [self.mainView addSubview:mainViewVc.view];
    // 把A控制器的view 添加到B控制器的view上，那么A控制器必须成为B控制器的自控制器。
    [self addChildViewController:mainViewVc];
    
    
    RightViewController *rightViewVc = [[RightViewController alloc] init];
    rightViewVc.view.frame = self.rightView.bounds;
    
    [self.rightView addSubview:rightViewVc.view];
    // 把A控制器的view 添加到B控制器的view上，那么A控制器必须成为B控制器的自控制器。
    [self addChildViewController:rightViewVc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
