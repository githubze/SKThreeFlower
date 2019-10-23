//
//  SKThreeFlowerTableView.h
//  PPKProject
//
//  Created by 阿汤哥 on 2019/10/22.
//  Copyright © 2019 徐泽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKThreeFlowerCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SKThreeFlowerTableView : UITableView <UITableViewDelegate,UITableViewDataSource>

/**
 name
 */
@property (nonatomic, strong) NSMutableArray * dataArray;

/**
 name
 */
@property (nonatomic, copy) void (^selectItem)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
