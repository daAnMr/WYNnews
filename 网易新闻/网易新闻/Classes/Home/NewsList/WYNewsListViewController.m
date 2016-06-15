//
//  WYNewsListViewController.m
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYNewsListViewController.h"
#import <Masonry.h>
#import "CDNetwokingManager.h"
#import "WYNewListModl.h"
#import <YYModel.h>
static NSString *cellId = @"cellId";
@interface WYNewsListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <WYNewListModl*>*newsList;
@end

@implementation WYNewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _category = @"T1348647853363";

    [self setupUI];
    [self loaData];
}

#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _newsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.textLabel.text = _newsList[indexPath.row].title;
    
    return cell;


}

#pragma mark--加载数据
- (void)loaData {

    [[CDNetwokingManager sharedManager]newsListWithCategory:_category start:0 completion:^(NSArray *array, NSError *error) {
        NSLog(@"%@",array);
        //字典转模型
        NSArray *list = [NSArray yy_modelArrayWithClass:[WYNewListModl class] json:array];
        
        self.newsList = [NSMutableArray arrayWithArray:list];
        
        [self.tableView reloadData];

    }];




}
#pragma mark--设置界面
- (void)setupUI {

    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:tv];
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.view);
    }];

    
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];


    tv.dataSource = self;
    tv.delegate = self;
    _tableView = tv;
}


@end
