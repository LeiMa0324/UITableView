//
//  ViewController.m
//  0819_UITableView
//
//  Created by APPLE on 15/11/9.
//  Copyright (c) 2015年 big nerd ranch. All rights reserved.
//

#import "ViewController.h"
#import "HMstudent.h"


@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray *dataList;  //数据列表

@end

@implementation ViewController

#pragma mark-数据源方法,required

-(NSArray *)dataList
{
    if (_dataList==nil) {

        
        HMstudent *stu1=[[HMstudent alloc]init];
        stu1.head=@"黑马1期";
        stu1.foot=@"牛叉";
        
        
        //生成编号数组1
        NSMutableArray *arrayM1=[NSMutableArray array];
        for (int i=0; i<10; i++) {
            [arrayM1 addObject:[NSString stringWithFormat:@"%@-%2d",stu1.head,i]];   //生成编号并依次加入数组
        }
        
        stu1.student=arrayM1;
        
        
        HMstudent *stu2=[[HMstudent alloc]init];
        stu2.head=@"黑马2期";
        stu2.foot=@"牛叉2";
        
        
        //生成编号数组2
        NSMutableArray *arrayM2=[NSMutableArray array];
        for (int i=0; i<10; i++) {
            [arrayM2 addObject:[NSString stringWithFormat:@"%@-%2d",stu2.head,i]];   //生成编号并依次加入数组
        }
        
        stu2.student=arrayM2;
        
        _dataList=@[stu1,stu2]; //用两个stu对象包一个数组dataList

    }
    return _dataList;
}

//tableView中的section个数，如果没有实现，默认是1(@optional)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return self.dataList.count;
}


//返回分组的标题文字
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    HMstudent *stu=self.dataList[section];
    return [NSString stringWithFormat:@"%@",stu.head];
}

//返回分组的下标文字
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
{

    HMstudent *stu=self.dataList[section];
    return [NSString stringWithFormat:@"%@",stu.foot];
}


//设置每个分组中的数据总数(@required)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    //每个stu中数组的个数
    //取出对应的stu信息
    HMstudent *stu=self.dataList[section];
    return  stu.student.count;
}

//告诉表格空间，每一行cell单元格的细节(@required)
//indexPath
//@property (nonatomic,readonly) NSInteger section; //分组的下标
//@property(nonatomic,readonly)  NSInteger row; //行数

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //实例化tableviewcell时，使用initwithStyle方法来进行实例化
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //取出每个indexPath对应的学员信息
    HMstudent *stu=self.dataList[indexPath.section];

    cell.textLabel.text= stu.student[indexPath.row];
    return cell;
    
}

@end
