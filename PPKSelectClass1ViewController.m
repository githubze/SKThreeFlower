//
//  PPKSelectStoreNameViewController.m
//  PPKProject
//
//  Created by 阿汤哥 on 2019/8/29.
//  Copyright © 2019 徐泽. All rights reserved.
//

#import "PPKSelectClass1ViewController.h"

@interface PPKSelectClass1ViewController ()

@end

@implementation PPKSelectClass1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUI];
    [self getData];
}
- (void)setUI{
    self.key = @"";
    self.currentPage = 1;
    self.view.backgroundColor = KTextColorfff;
    
    UIButton *rightButton = [UIButton buttonWithFrame:CGRectMake(0, 0, 100, 44) title:@"确定" titleColor:UIColorFromRGB(0x000000) font:kPfFont(14) image:nil color:nil tag:111 target:self action:@selector(rightClick)];
    rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.flowerView];
    [self.view addSubview:self.unView];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kAuto(8));
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    [self.flowerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBar.mas_bottom);
        make.left.bottom.right.equalTo(self.view);
    }];
    
    [self.unView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBar.mas_bottom);
        make.left.bottom.right.equalTo(self.view);
    }];
    
}
- (void)rightClick{
    [self upClassWith:self.flowerView.selectModel];
}
- (PPKSearchUnView1 *)unView{
    if (!_unView) {
        _unView = [[PPKSearchUnView1 alloc] initWithFrame:CGRectZero];
        _unView.hidden = YES;
    }
    return _unView;
}
- (SKClassSearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[SKClassSearchBar alloc] initWithFrame:CGRectZero];
        _searchBar.sk_delegate = self;
    }
    return _searchBar;
}
/**
 搜索按钮
 */
- (void)sk_searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    self.key = searchBar.text;
//    [self refishData];
}
- (void)sk_searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    self.key = searchBar.text;
//    [self refishData];
}
- (void)sk_searchBarTextDidEndEditing:(UISearchBar *)searchBar{
//    self.key = searchBar.text;
//    [self refishData];
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (SKThreeFlowerView *)flowerView{
    if (!_flowerView) {
        _flowerView = [[SKThreeFlowerView alloc] initWithFrame:CGRectZero];
    }
    return _flowerView;
}
//- (UITableView *)tableView{
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        _tableView.showsVerticalScrollIndicator = NO;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//
//        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refishData)];
//
//        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(addData)];
//    }
//    return _tableView;
//}
//- (void)refishData{
//    self.currentPage = 1;
//    [self getData];
//}
//- (void)addData{
//    self.currentPage ++;
//    [self getData];
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.dataArray.count;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return kAuto(50);
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *stwe = @"stwe";
//    PPKSelectClassCell *cell = [tableView dequeueReusableCellWithIdentifier:stwe];
//    if (cell == nil) {
//        cell = [[PPKSelectClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stwe];
//    }
//    PPKggClassModel *model = self.dataArray[indexPath.row];
//    cell.nameLabel.text = model.cateName;
//
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//    if ([self.cateId isEqualToString:model.cateId]) {
//        cell.selectBugtton.hidden = NO;
//    }else{
//        cell.selectBugtton.hidden = YES;
//    }
//
//
//    return cell;
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self upClassWith:self.dataArray[indexPath.row]];
//}

- (void)upClassWith:(PPKggClassModel *)model{
    
    [SVProgressHUD showWithStatus:@"正在操作..."];
    
    NSDictionary *para = @{@"cateId":model.cateId};
    
    [Httptool PostShopWithApi:kCollageGoodsSpecCategoryList Dic:para success:^(id data) {
        
        NSArray *arr1 = data[@"specList"];
        if (arr1.count) {
            model.hasGg = YES;
        }else{
            model.hasGg = NO;
        }
        
        if (self.backSelect) {
            self.backSelect(model);
        }
        [self.navigationController popViewControllerAnimated:YES];
        
        [SVProgressHUD dismiss];
    } fail:^(NSString *error) {
        
    }];
    
    //    NSArray *arr1 = @[@"牛油果绿",@"米白色",@"浅灰色",@"深灰色",@"黑色"];
    //    NSArray *arr2 = @[@"均码S偏小",@"大码M",@"大码L",@"大码XL",@"大码XXL"];
    //
    //    for (int i=0; i<arr1.count; i++) {
    //        PPKggShowModel *model = [[PPKggShowModel alloc] init];
    //        model.specdValue = arr1[i];
    //        model.placeHold = @"自定义颜色";
    //        [self.view1.dataArray addObject:model];
    //    }
    //    [self.view1.collection reloadData];
    //
    //    for (int i=0; i<arr2.count; i++) {
    //        PPKggShowModel *model = [[PPKggShowModel alloc] init];
    //        model.specdValue = arr2[i];
    //        model.placeHold = @"自定义尺码";
    //        [self.view2.dataArray addObject:model];
    //    }
    //    [self.view2.collection reloadData];
}

- (void)getData{
    [SVProgressHUD showWithStatus:@"正在加载..."];

//    NSDictionary *para = @{@"pageSize":@(20),@"pageNo":@(self.currentPage),@"keyword":self.key};
    NSDictionary *para = @{@"keyword":self.key};
    
    [Httptool PostShopWithApi:kCategoryList Dic:para success:^(id data) {

        if (self.currentPage==1) {
            [self.flowerView.dataArray removeAllObjects];
        }
        
        for (NSDictionary *dic in data) {
            PPKggClassModel *model = [PPKggClassModel mj_objectWithKeyValues:dic];
            [self.flowerView.dataArray addObject:model];
            if (self.flowerView.dataArray.count==1) {
                model.isSelect = YES;
            }
        }
        
//        //组合数据
//        for (int i=0; i<temArray.count; i++) {
//            PPKggClassModel *model = temArray[i];
//            if (model.dataArray.count!=0) {
//                for (int j=0; j<model.dataArray.count; j++) {
//                    PPKggClassModel *model1 = model.dataArray[j];
//                    if (model1.dataArray.count!=0) {
//                        for (int k =0; k<model1.dataArray.count; k++) {
//                            PPKggClassModel *model2 = model1.dataArray[k];
//                            model2.cateName = [NSString stringWithFormat:@"%@/%@/%@",model.cateName,model1.cateName,model2.cateName];
//                            [self.dataArray addObject:model2];
//                        }
//                    }else{
//                        model1.cateName = [NSString stringWithFormat:@"%@/%@",model.cateName,model1.cateName];
//                        [self.dataArray addObject:model1];
//                    }
//
//                }
//            }else{
//                [self.dataArray addObject:model];
//            }
//        }
        
        if (self.flowerView.dataArray.count==0) {
            self.unView.hidden = NO;
        }else{
            self.unView.hidden = YES;
        }

        [self.flowerView reloadData];
        
        [SVProgressHUD dismiss];
    } fail:^(NSString *error) {
        
    }];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
