//
//  SKThreeFlowerView.h
//  PPKProject
//
//  Created by 阿汤哥 on 2019/10/22.
//  Copyright © 2019 徐泽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKThreeFlowerTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SKThreeFlowerView : UIView

/**
 一级列表
 */
@property (nonatomic, strong) SKThreeFlowerTableView * tableView1;

/**
 二级列表
 */
@property (nonatomic, strong) SKThreeFlowerTableView * tableView2;

/**
 三级列表
 */
@property (nonatomic, strong) SKThreeFlowerTableView * tableView3;

/**
 name
 */
@property (nonatomic, strong) NSMutableArray * dataArray;

- (void)reloadData;

/**
 name
 */
@property (nonatomic, strong) PPKggClassModel * selectModel;

@end

NS_ASSUME_NONNULL_END
