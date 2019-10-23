//
//  PPKSelectStoreNameViewController.h
//  PPKProject
//
//  Created by 阿汤哥 on 2019/8/29.
//  Copyright © 2019 徐泽. All rights reserved.
//

#import "PPKBaseViewController.h"
#import "SKClassSearchBar.h"
#import "PPKSelectClassCell.h"
#import "PPKSelectStoreNameModel.h"
#import "PPKSearchUnView1.h"
#import "PPKggClassModel.h"
#import "SKThreeFlowerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPKSelectClass1ViewController : PPKBaseViewController <UITableViewDelegate,UITableViewDataSource,SKSearchBarDelegete>

/**
 name
 */
@property (nonatomic, strong) SKClassSearchBar * searchBar;

/**
 name
 */
@property (nonatomic, strong) UITableView * tableView;

/**
 name
 */
@property (nonatomic, strong) SKThreeFlowerView * flowerView;

/**
 name
 */
@property (nonatomic, strong) NSMutableArray * dataArray;

/**
 page
 */
@property (nonatomic, assign) NSInteger currentPage;
/**
 name
 */
@property (nonatomic, strong) NSString * key;


/**
 name
 */
@property (nonatomic, copy) void (^backModel)(PPKSelectStoreNameModel * model);

/**
 name
 */
@property (nonatomic, strong) PPKSearchUnView1 * unView;

/**
 name
 */
@property (nonatomic, copy) void(^backSelect)(PPKggClassModel *model);

/**
 name
 */
@property (nonatomic, strong) NSString * cateId;

@end

NS_ASSUME_NONNULL_END
