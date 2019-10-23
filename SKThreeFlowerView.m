//
//  SKThreeFlowerView.m
//  PPKProject
//
//  Created by 阿汤哥 on 2019/10/22.
//  Copyright © 2019 徐泽. All rights reserved.
//

#define table_height 125

#import "SKThreeFlowerView.h"

@implementation SKThreeFlowerView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    self.backgroundColor = kBackgroundColor;
    [self addSubview:self.tableView1];
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectZero];
    lineView1.backgroundColor = UIColorFromRGB(0xdddddd);
    [self addSubview:lineView1];
    
    [self addSubview:self.tableView2];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectZero];
    lineView2.backgroundColor = UIColorFromRGB(0xdddddd);
    [self addSubview:lineView2];
    
    [self addSubview:self.tableView3];
    
    [self.tableView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(self);
        make.width.mas_equalTo(table_height);
    }];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(0.5);
        make.left.equalTo(self.tableView1.mas_right);
    }];
    
    [self.tableView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(lineView1.mas_right);
        make.width.mas_equalTo(table_height);
    }];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(0.5);
        make.left.equalTo(self.tableView2.mas_right);
    }];
    
    [self.tableView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(lineView2.mas_right);
        make.width.mas_equalTo(table_height);
    }];
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (SKThreeFlowerTableView *)tableView1{
    if (!_tableView1) {
        _tableView1 = [[SKThreeFlowerTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        kWeakSelf;
        _tableView1.selectItem = ^(NSInteger index) {
            for (int i=0; i<weakSelf.tableView1.dataArray.count; i++) {
                PPKggClassModel *model = weakSelf.tableView1.dataArray[i];
                if (index == i) {
                    model.isSelect = YES;
                }else{
                    model.isSelect = NO;
                }
            }
            [weakSelf.tableView1 reloadData];
            
            //改下级
            [weakSelf.tableView2.dataArray removeAllObjects];
            PPKggClassModel *model1 = weakSelf.tableView1.dataArray[index];
            for (int i=0; i<model1.dataArray.count; i++) {
                PPKggClassModel *model2 = model1.dataArray[i];
                if (i == 0) {
                    model2.isSelect = YES;
                }else{
                    model2.isSelect = NO;
                }
                [weakSelf.tableView2.dataArray addObject:model2];
            }
            [weakSelf.tableView2 reloadData];
            
            //改下下级
            [weakSelf.tableView3.dataArray removeAllObjects];
            if (model1.dataArray.count>0) {
                PPKggClassModel *model2 = weakSelf.tableView2.dataArray[0];
                for (int i=0; i<model2.dataArray.count; i++) {
                    PPKggClassModel *model3 = model2.dataArray[i];
                    if (i == 0) {
                        model3.isSelect = YES;
                        weakSelf.selectModel = model3;
                    }else{
                        model3.isSelect = NO;
                    }
                    [weakSelf.tableView3.dataArray addObject:model3];
                }
            }
            [weakSelf.tableView3 reloadData];
        };
    }
    return _tableView1;
}
- (SKThreeFlowerTableView *)tableView2{
    if (!_tableView2) {
        _tableView2 = [[SKThreeFlowerTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        kWeakSelf;
        _tableView2.selectItem = ^(NSInteger index) {
            for (int i=0; i<weakSelf.tableView2.dataArray.count; i++) {
                PPKggClassModel *model = weakSelf.tableView2.dataArray[i];
                if (index == i) {
                    model.isSelect = YES;
                }else{
                    model.isSelect = NO;
                }
            }
            [weakSelf.tableView2 reloadData];
            
            //改下级
            [weakSelf.tableView3.dataArray removeAllObjects];
            PPKggClassModel *model1 = weakSelf.tableView2.dataArray[index];
            for (int i=0; i<model1.dataArray.count; i++) {
                PPKggClassModel *model2 = model1.dataArray[i];
                if (i == 0) {
                    model2.isSelect = YES;
                    weakSelf.selectModel = model2;
                }else{
                    model2.isSelect = NO;
                }
                [weakSelf.tableView3.dataArray addObject:model2];
            }
            [weakSelf.tableView3 reloadData];
        };
    }
    return _tableView2;
}
- (SKThreeFlowerTableView *)tableView3{
    if (!_tableView3) {
        _tableView3 = [[SKThreeFlowerTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        kWeakSelf;
        _tableView3.selectItem = ^(NSInteger index) {
            for (int i=0; i<weakSelf.tableView3.dataArray.count; i++) {
                PPKggClassModel *model = weakSelf.tableView3.dataArray[i];
                if (index == i) {
                    model.isSelect = YES;
                    weakSelf.selectModel = model;
                }else{
                    model.isSelect = NO;
                }
            }
            [weakSelf.tableView3 reloadData];
        };
    }
    return _tableView3;
}
- (void)reloadData{
    [self.tableView1.dataArray removeAllObjects];
    [self.tableView1.dataArray addObjectsFromArray:self.dataArray];
    [self.tableView1 reloadData];
    
    [self.tableView2.dataArray removeAllObjects];
    if (self.tableView1.dataArray.count>0) {
        PPKggClassModel *model = self.tableView1.dataArray[0];
        [self.tableView2.dataArray addObjectsFromArray:model.dataArray];
        [self.tableView2 reloadData];
        
        if (self.tableView2.dataArray.count>0) {
            PPKggClassModel *model = self.tableView2.dataArray[0];
            self.selectModel = model;
            [self.tableView3.dataArray addObjectsFromArray:model.dataArray];
            [self.tableView3 reloadData];
        }
    }
}
@end
