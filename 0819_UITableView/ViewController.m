//
//  ViewController.m
//  0819_UITableView
//
//  Created by APPLE on 15/11/9.
//  Copyright (c) 2015年 big nerd ranch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

#pragma mark-数据源方法,required

//tableView中的section个数，如果没有实现，默认是1(@optional)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}


//返回分组的标题文字
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    return [NSString stringWithFormat:@"黑马%02d期",section];
}

//返回分组的下标文字
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
{
    if (section==0) {
        return @"hhaha";
    }
    else
        return @"xixixi";
}


//设置每个分组中的数据总数(@required)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    if (section==0) {
        return 5;
    }
    else
        return 18;
}

//告诉表格空间，每一行cell单元格的细节(@required)
//indexPath
//@property (nonatomic,readonly) NSInteger section; //分组的下标
//@property(nonatomic,readonly)  NSInteger row; //行数

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //实例化tableviewcell时，使用initwithStyle方法来进行实例化
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text= [NSString stringWithFormat:@"黑马学院%02d-%04d",indexPath.section,indexPath.row];
    return cell;
    
}

@end
