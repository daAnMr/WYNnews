//
//  WYNewsListViewController.m
//  网易新闻
//
//  Created by MacBook on 16/6/15.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "WYNewsListViewController.h"
#import "WYNewListModl.h"
#import "WYNewCell.h"

static NSString *normalCellId = @"normalCellId";
static NSString *imagesCellId = @"imagesCellId";
static NSString *WYDImageCellId = @"WYDImageCellId";
static NSString *headerCellId = @"headerCellId";
@interface WYNewsListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <WYNewListModl*>*newsList;
@end

@implementation WYNewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _category = @"T1348650593803";

    [self setupUI];
    [self loaData];
}

#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _newsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //根据模型判断Cell 的ID
    WYNewListModl *model = _newsList[indexPath.row];
    
    NSString *cellId;
    if (model.hasHead) {
        
        cellId = headerCellId;
        
    }else if (model.imgType) {
        
        cellId = WYDImageCellId;
        
    } else if(model.imgextra.count > 0) {
    
        cellId = imagesCellId;
    
    }else {
    
        cellId = normalCellId;
    
    }
    
    WYNewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.model = model;
    
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

    
    [tv registerNib:[UINib nibWithNibName:@"NewsNormalCell" bundle:nil] forCellReuseIdentifier:normalCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsImagesCell" bundle:nil] forCellReuseIdentifier:imagesCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYDTImageCell" bundle:nil] forCellReuseIdentifier:WYDImageCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYHeaderCell" bundle:nil] forCellReuseIdentifier:headerCellId];
    
    tv.estimatedRowHeight = 100;
    tv.rowHeight = UITableViewAutomaticDimension;
//    tv.rowHeight = 100;
    
    tv.dataSource = self;
    tv.delegate = self;
    _tableView = tv;
}


@end
