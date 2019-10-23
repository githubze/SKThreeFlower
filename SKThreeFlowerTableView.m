//
//  SKThreeFlowerTableView.m
//  PPKProject
//
//  Created by 阿汤哥 on 2019/10/22.
//  Copyright © 2019 徐泽. All rights reserved.
//

#import "SKThreeFlowerTableView.h"

@implementation SKThreeFlowerTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.showsVerticalScrollIndicator = NO;
    self.delegate = self;
    self.dataSource = self;
    
    
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SKThreeFlowerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeflowercell"];
    if (cell == nil) {
        cell = [[SKThreeFlowerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"threeflowercell"];
    }
    PPKggClassModel *model = self.dataArray[indexPath.row];
    cell.nameLabel.text = model.cateName;
    if (model.isSelect) {
        cell.backgroundColor = kBackgroundColor;
        cell.nameLabel.textColor = kRedMainColor;
    }else{
        cell.backgroundColor = [UIColor whiteColor];
        cell.nameLabel.textColor = UIColorFromRGB(0x6E6E6E);
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PPKggClassModel *model = self.dataArray[indexPath.row];
    if (model.isSelect) {
        return;
    }
    
    if (self.selectItem) {
        self.selectItem(indexPath.row);
    }
}
@end
