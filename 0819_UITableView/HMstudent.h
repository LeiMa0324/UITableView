//
//  HMstudent.h
//  0819_UITableView
//
//  Created by APPLE on 15/11/9.
//  Copyright (c) 2015年 big nerd ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMstudent : NSObject

//头部信息文字
@property(nonatomic,strong) NSString *head;
//尾部信息文字
@property (nonatomic,strong) NSString *foot;

//学员编号数组
@property(nonatomic,strong) NSArray *student;

@end
