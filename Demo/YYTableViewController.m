//
//  YYTableViewController.m
//  Demo
//
//  Created by Yang on 15/10/21.
//  Copyright (c) 2015年 Yang. All rights reserved.
//

#import "YYTableViewController.h"
#import "YYTableCell.h"
#import "DetailViewController.h"
#import "mainViewController.h"
@interface YYTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation YYTableViewController

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        for (int i = 0; i<30; i++) {
            [_dataArray addObject:[NSString stringWithFormat:@"测试数据%d",i]];
        }
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor=[UIColor orangeColor];
    
    self.tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"nvbar.png"]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    YYTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[YYTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView beginUpdates];
        
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [tableView endUpdates];
        
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DetailViewController * dv=[[DetailViewController alloc]init];
    //mainViewController * main=[[mainViewController alloc]init];
    
    [self.navigationController pushViewController:dv animated:YES];
    
}
@end

